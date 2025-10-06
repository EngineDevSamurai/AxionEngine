#ifndef SPRITE_COMPONENT_H
#define SPRITE_COMPONENT_H

#include <stdint.h>
#include <stdbool.h>
#include "../../settings.h"
#include "../Libraries/vec2.h"

// Sprite flags layout (1 byte)
// Bit 0: World (1) / UI (0)
// Bit 1: Flip X
// Bit 2: Flip Y
// Bits 3-5: Z-index (0-7)
// Bit 6: Visible (1 = visible, 0 = hidden)
// Bit 7: Reserved

#define SPRITE_FLAG_WORLD   (1 << 0)
#define SPRITE_FLIP_X       (1 << 1)
#define SPRITE_FLIP_Y       (1 << 2)
#define SPRITE_VISIBLE      (1 << 6)

// Z-index helpers
#define SPRITE_Z_SHIFT      3
#define SPRITE_Z_MASK       (0x07 << SPRITE_Z_SHIFT)
#define SPRITE_SET_Z(flags, z) ((flags & ~SPRITE_Z_MASK) | ((z << SPRITE_Z_SHIFT) & SPRITE_Z_MASK))
#define SPRITE_GET_Z(flags) ((flags & SPRITE_Z_MASK) >> SPRITE_Z_SHIFT)

typedef struct {
    uint8_t entityID[SPRITE_POOL_SIZE];
    const unsigned char* tileData[SPRITE_POOL_SIZE];  // pointer to tile data in ROM
    uint8_t tileIndex[SPRITE_POOL_SIZE];              // tile index in VRAM
    uint8_t width[SPRITE_POOL_SIZE];                  // in tiles
    uint8_t height[SPRITE_POOL_SIZE];                 // in tiles
    vec2_i offset[SPRITE_POOL_SIZE];                  // offset relative to entity transform
    uint8_t flags[SPRITE_POOL_SIZE];                  // bitmask
    uint8_t palette[SPRITE_POOL_SIZE];                // color palette
} SpriteComponent;

// Global instance
extern SpriteComponent spriteComponent;

#endif
