#include "systems.h"
#include "components.h"
#include "../Asset_Manifests/tile_manifest.h"

// Temporary camera placeholder
vec2_i camera = {0, 0};


/*────────────────────────────────────────────────*/
/*─ ███████╗██████╗ ██████╗ ██╗████████╗███████╗ ─*/
/*─ ██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝ ─*/
/*─ ███████╗██████╔╝██████╔╝██║   ██║   █████╗   ─*/
/*─ ╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝   ─*/
/*─ ███████║██║     ██║  ██║██║   ██║   ███████╗ ─*/
/*─ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝ ─*/
/*─────────── RENDER SPRITE SYSTEM ───────────────*/


// Structure for temporary OAM sort list
typedef struct {
    uint8_t entityID;
    int16_t screenX;
    int16_t screenY;
    uint16_t orderKey; // optional: preserves stable ordering for same X
} OAMEntry;

static OAMEntry oamList[SPRITE_POOL_SIZE];
static uint8_t oamCount = 0;


// ---------------------------------------------------------------
// Renders all visible sprites from the global sprite/transform pools.
// Draw order: ascending screen X (hardware order on Game Boy).
// ---------------------------------------------------------------
void RenderSprites(void) {
    vec2 position;
    uint8_t spriteOAMIndex = 0;
    uint8_t spriteCount = 0;
    oamCount = 0;

    // Build list of visible sprites
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        uint8_t id = spriteComponent.entityID[i];
        if (id == 0) continue;

        LocalSprite s = getLocalSprite(id);
        if (!s.visible) continue;

        Entity *e = getEntityById(id);
        if (!EntityHasComponent(e, TRANSFORM_COMPONENT))
            continue;

        position = getTransformPosition(id);

        int16_t screenX = s.isWorld ? (TO_INT(position.x) - camera.x + s.offset.x)
                                    : position.x + s.offset.x;
        int16_t screenY = s.isWorld ? (TO_INT(position.y) - camera.y + s.offset.y)
                                    : position.y + s.offset.y;

        OAMEntry entry;
        entry.entityID = id;
        entry.screenX  = screenX;
        entry.screenY  = screenY;
        entry.orderKey = (uint16_t)((screenX << 1) | (id & 1));

        oamList[oamCount++] = entry;

        ;
    }

    // Sort ascending by screenX (and stable order)
    for (uint8_t i = 0; i < oamCount; i++) {
        for (uint8_t j = i + 1; j < oamCount; j++) {
            if (oamList[j].screenX < oamList[i].screenX) {
                OAMEntry tmp = oamList[i];
                oamList[i] = oamList[j];
                oamList[j] = tmp;
            }
        }
    }

    // Render in sorted order
    for (uint8_t n = 0; n < oamCount; n++) {
        uint8_t id = oamList[n].entityID;
        LocalSprite s = getLocalSprite(id);
        if (!s.visible) continue;

        uint8_t numTiles = s.width * s.height;
        set_sprite_data(spriteOAMIndex, numTiles, s.tileData);

        for (uint8_t tx = 0; tx < s.width; tx++) {
            for (uint8_t ty = 0; ty < s.height; ty++) {
                if (spriteOAMIndex >= 40) return; // Max hardware sprites

                uint8_t tileIndex = tx * s.height + ty;
                uint8_t props = SPRITE_PROPS_FROM_FLAGS(s.flags);

                set_sprite_tile(spriteOAMIndex, spriteOAMIndex);
                set_sprite_prop(spriteOAMIndex, props);
                move_sprite(spriteOAMIndex,
                            oamList[n].screenX + tx * 8,
                            oamList[n].screenY + ty * 8);
                spriteOAMIndex++;
            }
        }
    }
}


//──────────────── RENDER SPRITE SYSTEM ─────────────────────//
//                                                           //
//───────────────────────── END ─────────────────────────────//



/*────────────────────────────────────────────────*/
/*─ ███████╗██╗   ██╗███████╗███╗   ██╗████████╗ ─*/
/*─ ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝ ─*/
/*─ █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║    ─*/
/*─ ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║    ─*/
/*─ ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║    ─*/
/*─ ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ─*/
/*──────────────── EVENT SYSTEM ──────────────────*/

// Clear event pool
void ClearEventPool(void) {
    for (int i = 0; i < EVENT_POOL_SIZE; i++) {
        eventPool[i].type = 0;
        eventPool[i].entityID = 0;
        eventPool[i].arg1 = 0;
        eventPool[i].arg2 = 0;
    }
    eventCount = 0;
}

// Emit Event
void EmitEvent(Event event) {
    if (eventCount == EVENT_POOL_SIZE) return; // No slots available
    eventPool[eventCount] = event;
    eventCount++;
}

// Wrapper for EmitEvent. Removes need to construct an event
void Emit(uint8_t type, uint8_t entityID, uint8_t arg1, uint8_t arg2) {
    Event e = {type, entityID, arg1, arg2};
    EmitEvent(e);
}

// Process events
void ProcessEvents(void) {
    for (uint8_t i = 0; i < eventCount; i++) {
        Event* e = &eventPool[i];

        for (uint8_t j = 0; j < EVENT_LISTENER_POOL_SIZE; j++) {
            if (eventListenerComponent.callback[j] &&
                eventListenerComponent.type[j] == e->type &&
                (eventListenerComponent.entityID[j] == e->entityID ||
                e->entityID == GLOBAL_EVENT))
            {
                eventListenerComponent.callback[j](e);
            }
        }
    }
    ClearEventPool();

}

// Set event listener
void setEventListener(uint8_t entityID, EventType type, EventCallback callback) {
    // Look for an existing listener slot for this entity
    for (uint8_t i = 0; i < EVENT_LISTENER_POOL_SIZE; i++) {
        if (eventListenerComponent.entityID[i] == entityID &&
            eventListenerComponent.type[i] == 0) {  // uninitialized slot
            eventListenerComponent.type[i] = type;
            eventListenerComponent.callback[i] = callback;
            return;
        }
    }
}


/// Add Event Listener
void addEventListener(uint8_t entityID, EventType type, EventCallback callback) {
    Entity* e = getEntityById(entityID);
    EntityAddComponent(e, EVENT_LISTENER_COMPONENT);

    for (uint8_t i = 0; i < EVENT_LISTENER_POOL_SIZE; i++) {

        // If this exact event type is already registered for this entity, just update the callback
        if (eventListenerComponent.entityID[i] == entityID &&
            eventListenerComponent.type[i] == type) {
            eventListenerComponent.callback[i] = callback;
            return;
        }

        // Otherwise, look for a free slot (type == 0 means unused)
        if (eventListenerComponent.type[i] == 0) {
            eventListenerComponent.entityID[i] = entityID;
            eventListenerComponent.type[i] = type;
            eventListenerComponent.callback[i] = callback;
            return;
        }
    }
}
    
//───────────────────────── EVENT SYSTEM ─────────────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//

/*────────────────────────────────────────────────*/
/*─ ██╗ ███╗   ██╗ ██████╗  ██╗   ██╗ ████████╗  ─*/
/*─ ██║ ████╗  ██║ ██╔══██╗ ██║   ██║ ╚══██╔══╝  ─*/
/*─ ██║ ██╔██╗ ██║ ██████╔╝ ██║   ██║    ██║     ─*/
/*─ ██║ ██║╚██╗██║ ██╔═══╝  ██║   ██║    ██║     ─*/
/*─ ██║ ██║ ╚████║ ██║      ╚██████╔╝    ██║     ─*/
/*─ ╚═╝ ╚═╝  ╚═══╝ ╚═╝       ╚═════╝     ╚═╝     ─*/
/*───────────────── INPUT SYSTEM ─────────────────*/

uint8_t buttonHeld = 0;

void ProcessInput(void) {
    uint8_t input = joypad();
    // UP
    if (input & J_UP) {
        if (IS_HELD(BTN_UP)) {
            Emit(ON_BUTTON_UP_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_UP);
            Emit(ON_BUTTON_UP_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_UP);
    }

    // DOWN
    if (input & J_DOWN) {
        if (IS_HELD(BTN_DOWN)) {
            Emit(ON_BUTTON_DOWN_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_DOWN);
            Emit(ON_BUTTON_DOWN_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_DOWN);
    }

    // LEFT
    if (input & J_LEFT) {
        if (IS_HELD(BTN_LEFT)) {
            Emit(ON_BUTTON_LEFT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_LEFT);
            Emit(ON_BUTTON_LEFT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_LEFT);
    }

    // RIGHT
    if (input & J_RIGHT) {
        if (IS_HELD(BTN_RIGHT)) {
            Emit(ON_BUTTON_RIGHT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_RIGHT);
            Emit(ON_BUTTON_RIGHT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_RIGHT);
    }

    // A
    if (input & J_A) {
        if (IS_HELD(BTN_A)) {
            Emit(ON_BUTTON_A_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_A);
            Emit(ON_BUTTON_A_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_A);
    }

    // B
    if (input & J_B) {
        if (IS_HELD(BTN_B)) {
            Emit(ON_BUTTON_B_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_B);
            Emit(ON_BUTTON_B_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_B);
    }

    // START
    if (input & J_START) {
        if (IS_HELD(BTN_START)) {
            Emit(ON_BUTTON_START_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_START);
            Emit(ON_BUTTON_START_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_START);
    }

    // SELECT
    if (input & J_SELECT) {
        if (IS_HELD(BTN_SELECT)) {
            Emit(ON_BUTTON_SELECT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_SELECT);
            Emit(ON_BUTTON_SELECT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_SELECT);
    }
}

//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//──────────────────────── END ───────────────────────────────//