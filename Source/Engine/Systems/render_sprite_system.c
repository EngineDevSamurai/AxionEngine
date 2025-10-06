#include "render_sprite_system.h"

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

    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        id = spriteComponent.entityID[i];
        e = getEntityById(id);
        if (id != 0 &&
            (spriteComponent.flags[i] & SPRITE_VISIBLE) &&
            EntityHasComponent(id, TRANSFORM_COMPONENT)) {

            // Get the transform
            position = transformComponent.position[i];

            // Get the offset
            offset = spriteComponent.offset[i];

            // Determine screen position
            isWorld = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
            int16_t screenX = isWorld ? (TO_INT(position.x) - camera.x + offset.x) : offset.x;
            int16_t screenY = isWorld ? (TO_INT(position.y) - camera.y + offset.y) : offset.y;


            // Loop through sprite tiles
            for (uint8_t ty = 0; ty < spriteComponent.height[i]; ty++) {
                for (uint8_t tx = 0; tx < spriteComponent.width[i]; tx++) {
                    if (spriteOAMIndex >= 40) return; // Max hardware sprites

                    uint8_t tileIndex = ty * spriteComponent.width[i] + tx;
                    move_sprite(spriteOAMIndex, screenX + tx * 8, screenY + ty * 8);
                    set_sprite_tile(spriteOAMIndex, spriteComponent.tileData[i][tileIndex]);
                    set_sprite_prop(spriteOAMIndex, spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y));

                    spriteOAMIndex++;
                }
            }
        }
    }
}