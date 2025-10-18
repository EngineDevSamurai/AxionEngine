#include "render_sprite_system.h"
#include "../Components/sprite_component.h"
#include "../../Asset_Manifests/tile_manifest.h"

// Temporary camera placeholder
vec2_i camera = {0, 0};

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
