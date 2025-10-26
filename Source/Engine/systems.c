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

    // After drawing all active sprites
    for (uint8_t i = spriteOAMIndex; i < 40; i++) {
        move_sprite(i, 0, 0); // Move offscreen (e.g., y=0 hides sprite)
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
void Emit(uint8_t type, uint8_t arg1, uint8_t arg2) {
    Event e = {type, arg1, arg2};
    EmitEvent(e);
}

// Process events
void ProcessEvents(void) {
    for (uint8_t i = 0; i < eventCount; i++) {
        Event* e = &eventPool[i];

        for (uint8_t j = 0; j < EVENT_LISTENER_POOL_SIZE; j++) {
            if (eventListenerComponent.callback[j] &&
                eventListenerComponent.type[j] == e->type)
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
            Emit(ON_BUTTON_UP_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_UP);
            Emit(ON_BUTTON_UP_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_UP);
    }

    // DOWN
    if (input & J_DOWN) {
        if (IS_HELD(BTN_DOWN)) {
            Emit(ON_BUTTON_DOWN_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_DOWN);
            Emit(ON_BUTTON_DOWN_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_DOWN);
    }

    // LEFT
    if (input & J_LEFT) {
        if (IS_HELD(BTN_LEFT)) {
            Emit(ON_BUTTON_LEFT_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_LEFT);
            Emit(ON_BUTTON_LEFT_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_LEFT);
    }

    // RIGHT
    if (input & J_RIGHT) {
        if (IS_HELD(BTN_RIGHT)) {
            Emit(ON_BUTTON_RIGHT_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_RIGHT);
            Emit(ON_BUTTON_RIGHT_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_RIGHT);
    }

    // A
    if (input & J_A) {
        if (IS_HELD(BTN_A)) {
            Emit(ON_BUTTON_A_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_A);
            Emit(ON_BUTTON_A_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_A);
    }

    // B
    if (input & J_B) {
        if (IS_HELD(BTN_B)) {
            Emit(ON_BUTTON_B_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_B);
            Emit(ON_BUTTON_B_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_B);
    }

    // START
    if (input & J_START) {
        if (IS_HELD(BTN_START)) {
            Emit(ON_BUTTON_START_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_START);
            Emit(ON_BUTTON_START_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_START);
    }

    // SELECT
    if (input & J_SELECT) {
        if (IS_HELD(BTN_SELECT)) {
            Emit(ON_BUTTON_SELECT_HELD, 0, 0);
        } 
        else {
            SET_HELD(BTN_SELECT);
            Emit(ON_BUTTON_SELECT_PRESSED, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_SELECT);
    }
}

//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//──────────────────────── END ───────────────────────────────//

/*──────────────────────────────────────────────────*/
/*─           ██████╗  ██████╗ ██╗  ██╗            ─*/
/*─           ██╔══██╗██╔═══██╗╚██╗██╔╝            ─*/
/*─           ██████╔╝██║   ██║ ╚███╔╝             ─*/
/*─           ██╔══██╗██║   ██║ ██╔██╗             ─*/
/*─           ██████╔╝╚██████╔╝██╔╝ ██╗            ─*/
/*─           ╚═════╝  ╚═════╝ ╚═╝  ╚═╝            ─*/
/*──────────── BOX COLLISION SYSTEM ────────────────*/

// Process Collisions
void ProcessCollisions(void) {
    LocalCollider boxA;
    LocalCollider boxB;
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) 
    {
        if (boxColliderComponent.entityID[i] == 0) continue;
        boxA.entityID  = boxColliderComponent.entityID[i];
        boxA.layerMask = boxColliderComponent.layerMask[i];
        boxA.width     = boxColliderComponent.width[i];
        boxA.height    = boxColliderComponent.height[i];
        boxA.offset    = boxColliderComponent.offset[i];
        boxA.position  = *boxColliderComponent.position[i];
        boxA.position.x += F12(boxA.offset.x);
        boxA.position2.x = boxA.position.x + F12(boxA.width);
        boxA.position.y += F12(boxA.offset.y);
        boxA.position2.y = boxA.position.y + F12(boxA.height);

        for (uint8_t j = 0; j < BOX_COLLIDER_POOL_SIZE; j++) 
        {
            if (boxColliderComponent.entityID[j] == 0 || j <= i) continue;
            boxB.entityID  = boxColliderComponent.entityID[j];
            boxB.layerMask = boxColliderComponent.layerMask[j];
            boxB.width     = boxColliderComponent.width[j];
            boxB.height    = boxColliderComponent.height[j];
            boxB.offset    = boxColliderComponent.offset[j];
            boxB.position  = *boxColliderComponent.position[j];
            boxB.position.x += F12(boxB.offset.x);
            boxB.position2.x = boxB.position.x + F12(boxB.width);
            boxB.position.y += F12(boxB.offset.y);
            boxB.position2.y = boxB.position.y + F12(boxB.height);

            if (boxA.position.x < boxB.position2.x &&
                boxA.position2.x > boxB.position.x &&
                boxA.position.y < boxB.position2.y &&
                boxA.position2.y > boxB.position.y) 
            {
                Emit(ON_COLLISION, boxA.entityID, boxB.entityID);
            } 
        }
    }
}

//────────────────────── BOX COLLIDER SYSTEM ─────────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//