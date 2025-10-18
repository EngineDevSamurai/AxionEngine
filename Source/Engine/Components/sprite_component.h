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

// The struct used by the ECS
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

// Local sprite used in the rendering loop
typedef struct {
    uint8_t id;
    uint8_t width;
    uint8_t height;
    vec2_i offset;
    bool isWorld;
    bool visible;
    uint8_t flags;
    const unsigned char *tileData;
    uint8_t flipProps;
} LocalSprite;



// Global instance
extern SpriteComponent spriteComponent;


// Inline function for getting sprite height (in tiles)
static inline uint8_t getSpriteHeight(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return spriteComponent.height[i];
        }
    }
    return 0;
}

// Inline function for setting sprite height (in tiles)
static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.height[i] = height;
            return;
        }
    }
}

// Inline function for returning sprite Z-index (0–7)
static inline uint8_t getSpriteZIndex(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return SPRITE_GET_Z(spriteComponent.flags[i]);
        }
    }
    return 0;
}

// Inline function for returning sprite offset
static inline vec2_i getSpriteOffset(uint8_t entityID) {
    vec2_i result = {0, 0};
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            result = spriteComponent.offset[i];
            return result;
        }
    }
    return result;
}

// Inline function for checking if sprite is world-space
static inline bool getSpriteWorldFlag(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return (spriteComponent.flags[i] & SPRITE_FLAG_WORLD) != 0;
        }
    }
    return false;
}

// Inline function for checking horizontal flip
static inline bool getSpriteFlipX(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return (spriteComponent.flags[i] & SPRITE_FLIP_X) != 0;
        }
    }
    return false;
}

// Inline function for checking vertical flip
static inline bool getSpriteFlipY(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return (spriteComponent.flags[i] & SPRITE_FLIP_Y) != 0;
        }
    }
    return false;
}

// Inline function for checking sprite visibility
static inline bool getSpriteVisible(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return (spriteComponent.flags[i] & SPRITE_VISIBLE) != 0;
        }
    }
    return false;
}

// Get the sprite flip flags ready for set_sprite_prop()
static inline uint8_t getSpriteFlipProps(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y);
        }
    }
    return 0;
}

// Inline function for returning a LocalSprite by entity ID
static inline LocalSprite getLocalSprite(uint8_t entityID) {
    LocalSprite s = {0};  // Initialize everything to zero / NULL
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            s.id        = spriteComponent.entityID[i];
            s.width     = spriteComponent.width[i];
            s.height    = spriteComponent.height[i];
            s.offset    = spriteComponent.offset[i];
            s.flags     = spriteComponent.flags[i];
            s.tileData  = spriteComponent.tileData[i];
            s.isWorld   = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
            s.visible   = spriteComponent.flags[i] & SPRITE_VISIBLE;
            s.flipProps = spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y);
            return s;
        }
    }
    // If not found, returns a LocalSprite with id=0 and visible=false
    s.visible = false;
    return s;
}



// Inline function to set sprite Z-index (0–7)
static inline void setSpriteZIndex(uint8_t entityID, uint8_t z) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.flags[i] = SPRITE_SET_Z(spriteComponent.flags[i], z);
            return;
        }
    }
}

// Inline function to set sprite world flag
static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (isWorld) {
                spriteComponent.flags[i] |= SPRITE_FLAG_WORLD;
            } else {
                spriteComponent.flags[i] &= ~SPRITE_FLAG_WORLD;
            }
            return;
        }
    }
}

// Inline function to set horizontal flip
static inline void setSpriteFlipX(uint8_t entityID, bool flip) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (flip) {
                spriteComponent.flags[i] |= SPRITE_FLIP_X;
            } else {
                spriteComponent.flags[i] &= ~SPRITE_FLIP_X;
            }
            return;
        }
    }
}

// Inline function to set vertical flip
static inline void setSpriteFlipY(uint8_t entityID, bool flip) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (flip) {
                spriteComponent.flags[i] |= SPRITE_FLIP_Y;
            } else {
                spriteComponent.flags[i] &= ~SPRITE_FLIP_Y;
            }
            return;
        }
    }
}

// Inline function to set sprite visibility
static inline void setSpriteVisible(uint8_t entityID, bool visible) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (visible) {
                spriteComponent.flags[i] |= SPRITE_VISIBLE;
            } else {
                spriteComponent.flags[i] &= ~SPRITE_VISIBLE;
            }
            return;
        }
    }
}

// Inline function for setting sprite offset
static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.offset[i] = newOffset;
            return;
        }
    }
}

// Inline function for getting sprite width (in tiles)
static inline uint8_t getSpriteWidth(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            return spriteComponent.width[i];
        }
    }
    return 0;
}

// Inline function for setting sprite width (in tiles)
static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.width[i] = width;
            return;
        }
    }
}




// For sorting sprites by ZIndex
extern uint8_t spriteIDByZIndex[];

#endif
