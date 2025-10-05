#ifndef SPRITE_COMPONENT_H
#define SPRITE_COMPONENT_H

#include <stdint.h>
#include <stdbool.h>
#include "../../settings.h"
#include "../Libraries/vec2.h"

// Sprite type: world-space (moves with camera) or UI-space (fixed)
typedef enum {
    SPRITE_TYPE_WORLD,
    SPRITE_TYPE_UI
} SpriteType;

typedef struct {
    uint8_t entityID [SPRITE_POOL_SIZE];
    const unsigned char* tileData [SPRITE_POOL_SIZE]; // pointer to tile data in ROM
    uint8_t tileIndex [SPRITE_POOL_SIZE];              // tile index in VRAM
    vec2_i offset [SPRITE_POOL_SIZE];                  // offset relative to entity transform
    SpriteType type [SPRITE_POOL_SIZE];                // world or UI
    bool visible [SPRITE_POOL_SIZE];
} SpriteComponent;

// Global instance
extern SpriteComponent spriteComponent;

#endif
