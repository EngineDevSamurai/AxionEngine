#include "render_sprite_system.h"
#include "../Components/sprite_component.h"
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
    Entity *e;
    uint8_t tileDataIndex = 0;
    uint8_t spriteCount;
    LocalSprite s;

    spriteCount = sortEntitiesByZIndex();


    for (uint8_t i = 0; i < spriteCount; i++) {
        id = spriteIDByZIndex[i];
        e = getEntityById(id);
        // Load the local sprite component into memory
        s = getLocalSprite(id);

        if (id != 0 && s.visible &&
            EntityHasComponent(e, TRANSFORM_COMPONENT)) {

            // Get the transform
            position = getTransformPosition(id);

            // // Determine screen position
            int16_t screenX = s.isWorld ? (TO_INT(position.x) - camera.x + s.offset.x) : position.x + s.offset.x;
            int16_t screenY = s.isWorld ? (TO_INT(position.y) - camera.y + s.offset.y) : position.y + s.offset.y;

            uint8_t numTiles = s.width * s.height;
            set_sprite_data(spriteOAMIndex, numTiles, s.tileData);


            // Loop through sprite tiles
            for (uint8_t tx = 0; tx < s.width; tx++) {
                for (uint8_t ty = 0; ty < s.height; ty++) {
                    if (spriteOAMIndex >= 40) return; // Max hardware sprites

                    uint8_t tileIndex = tx * s.height + ty;
                    set_sprite_tile(spriteOAMIndex, spriteOAMIndex);
                    set_sprite_prop(spriteOAMIndex, s.flipProps);
                    move_sprite(spriteOAMIndex, screenX + tx * 8, screenY + ty * 8);
                    spriteOAMIndex++;
                }
            }
        }
    }
}

// Clear the ZIndex Array
void clearZIndexArray(void) {
    uint8_t i;
    for (i = 0; i < SPRITE_POOL_SIZE; i++) {
        spriteIDByZIndex[i] = 0;
    }
}

// Sort the entities by ZIndex
uint8_t sortEntitiesByZIndex(void) {
    clearZIndexArray();
    uint8_t zIndex, entityID, entityCount;
    entityCount = 0;
    for (zIndex = 0; zIndex < 8; zIndex++) {
        for (entityID = 0; entityID < SPRITE_POOL_SIZE; entityID++) {
            if (SPRITE_GET_Z(spriteComponent.flags[entityID]) == zIndex) {
                spriteIDByZIndex[entityCount] = spriteComponent.entityID[entityID];
                entityCount++;
            }
        }
    }
    return entityCount;
}