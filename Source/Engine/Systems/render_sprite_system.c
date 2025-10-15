#include "render_sprite_system.h"
#include "../../Asset_Manifests/tile_manifest.h"

// Renders all visible sprites from the global sprite and transform component pools.
// Uses the global camera position for world-space sprites.

// Remove this after we add a proper camera
vec2_i camera = {0, 0};

void RenderSprites(void) {
    // Storing attributes in local variables if referenced more than once
    // This helps reduce repeated processor instructions for deep array lookups
    // And allows the processor to better utilize the CPU registers instead of
    // putting everything on the stack.
    vec2 position;
    vec2_i offset;
    uint8_t id;
    uint8_t spriteOAMIndex = 0;
    bool isWorld;
    Entity *e;
    int tileDataIndex = 0;

    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        id = spriteComponent.entityID[i];
        e = getEntityById(id);
        if (id != 0 &&
            (spriteComponent.flags[i] & SPRITE_VISIBLE) &&
            EntityHasComponent(id, TRANSFORM_COMPONENT)) {

            // Get the transform
            position = getTransformPosition(id);
            // position = transformComponent.position[i];

            // Get the offset
            offset = spriteComponent.offset[i];

            // Determine screen position
            isWorld = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
            int16_t screenX = isWorld ? (TO_INT(position.x) - camera.x + offset.x) : position.x + offset.x;
            int16_t screenY = isWorld ? (TO_INT(position.y) - camera.y + offset.y) : position.y + offset.y;

            uint8_t numTiles = spriteComponent.width[i] * spriteComponent.height[i];
            set_sprite_data(spriteOAMIndex, numTiles, spriteComponent.tileData[i]);


            // Loop through sprite tiles
            for (uint8_t tx = 0; tx < spriteComponent.width[i]; tx++) {
                for (uint8_t ty = 0; ty < spriteComponent.height[i]; ty++) {
                    if (spriteOAMIndex >= 40) return; // Max hardware sprites

                    uint8_t tileIndex = tx * spriteComponent.height[i] + ty;
                    set_sprite_tile(spriteOAMIndex, spriteOAMIndex);
                    set_sprite_prop(spriteOAMIndex, spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y));

                    move_sprite(spriteOAMIndex, screenX + tx * 8, screenY + ty * 8);
                    spriteOAMIndex++;
                }
            }
        }
    }
}