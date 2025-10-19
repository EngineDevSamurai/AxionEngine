#ifndef SPRITE_COMPONENT_H
#define SPRITE_COMPONENT_H

#include <stdint.h>
#include <stdbool.h>
#include <gb/gb.h>                     // for sprite property macros
#include "../../settings.h"
#include "../Libraries/vec2.h"

/* ------- Flag layout (1 byte) -------
   bit0 : WORLD (1=world, 0=UI)          [SPRF_WORLD]
   bit1 : FLIP X                         [SPRF_FLIPX]
   bit2 : FLIP Y                         [SPRF_FLIPY]
   bits3-5 : PALETTE index (0..7)        [SPRF_PAL_MASK / SHIFT]
   bit6 : OBJ->BG priority (behind BG)   [SPRF_BEHIND]
   bit7 : ACTIVE / visible               [SPRF_ACTIVE]
-------------------------------------- */

#define SPRF_WORLD      0x01
#define SPRF_FLIPX      0x02
#define SPRF_FLIPY      0x04
#define SPRF_PAL_MASK   0x38
#define SPRF_PAL_SHIFT  3
#define SPRF_BEHIND     0x40
#define SPRF_ACTIVE     0x80

/* ---- Flag helpers (get/set/toggle) ---- */

/* active/visible */
#define SPRITE_IS_ACTIVE(f)       ((uint8_t)((f) & SPRF_ACTIVE))
#define SPRITE_SET_ACTIVE(f)      ((f) |= SPRF_ACTIVE)
#define SPRITE_CLEAR_ACTIVE(f)    ((f) &= (uint8_t)~SPRF_ACTIVE)

/* world/ui */
#define SPRITE_IS_WORLD(f)        ((uint8_t)((f) & SPRF_WORLD))
#define SPRITE_SET_WORLD(f)       ((f) |= SPRF_WORLD)
#define SPRITE_SET_UI(f)          ((f) &= (uint8_t)~SPRF_WORLD)

/* flips */
#define SPRITE_IS_FLIPX(f)        ((uint8_t)((f) & SPRF_FLIPX))
#define SPRITE_SET_FLIPX(f)       ((f) |= SPRF_FLIPX)
#define SPRITE_CLEAR_FLIPX(f)     ((f) &= (uint8_t)~SPRF_FLIPX)

#define SPRITE_IS_FLIPY(f)        ((uint8_t)((f) & SPRF_FLIPY))
#define SPRITE_SET_FLIPY(f)       ((f) |= SPRF_FLIPY)
#define SPRITE_CLEAR_FLIPY(f)     ((f) &= (uint8_t)~SPRF_FLIPY)

/* behind BG */
#define SPRITE_IS_BEHIND(f)       ((uint8_t)((f) & SPRF_BEHIND))
#define SPRITE_SET_BEHIND(f)      ((f) |= SPRF_BEHIND)
#define SPRITE_CLEAR_BEHIND(f)    ((f) &= (uint8_t)~SPRF_BEHIND)

/* palette (3 bits, 0..7). On DMG, only 0/1 are meaningful. */
#define SPRITE_GET_PALETTE(f)     ( (uint8_t)(((f) & SPRF_PAL_MASK) >> SPRF_PAL_SHIFT) )
#define SPRITE_SET_PALETTE(f,n)   ( (f) = (uint8_t)(((f) & (uint8_t)~SPRF_PAL_MASK) | (uint8_t)(((n) & 0x07) << SPRF_PAL_SHIFT)) )

/* Pack GBDK sprite props from flags (palette left to caller if needed) */
#define SPRITE_PROPS_BASE_FROM_FLAGS(f) \
    ( ((f)&SPRF_FLIPX ? S_FLIPX : 0) | ((f)&SPRF_FLIPY ? S_FLIPY : 0) | ((f)&SPRF_BEHIND ? S_PRIORITY : 0) )

/* Include palette info (auto-handles DMG vs CGB) */
#if defined(CGB)
/* CGB: 0..7 palette */
  #define SPRITE_PROPS_FROM_FLAGS(f) \
      ( SPRITE_PROPS_BASE_FROM_FLAGS(f) | S_PALETTE(SPRITE_GET_PALETTE(f)) )
#else
/* DMG: coerce to 0/1 (OBP0 / OBP1). Adjust macros if needed for your GBDK version. */
  #ifndef S_PAL0
    #define S_PAL0 0
    #define S_PAL1 0x10  /* DMG attr bit 4 selects OBP1 */
  #endif
  #define SPRITE_PROPS_FROM_FLAGS(f) \
      ( SPRITE_PROPS_BASE_FROM_FLAGS(f) | ((SPRITE_GET_PALETTE(f) & 1) ? S_PAL1 : S_PAL0) )
#endif

#define GET_SPRITE_OFFSET(entityID, OUT_VEC)                      \
    do {                                                          \
        (OUT_VEC).x = 0;                                          \
        (OUT_VEC).y = 0;                                          \
        for (uint8_t _i = 0; _i < SPRITE_POOL_SIZE; _i++) {       \
            if (spriteComponent.entityID[_i] == (entityID)) {     \
                (OUT_VEC) = spriteComponent.offset[_i];            \
                break;                                            \
            }                                                     \
        }                                                         \
    } while (0)



/* ============================================================
   ECS Sprite Component
   ============================================================ */
typedef struct {
    uint8_t              entityID[SPRITE_POOL_SIZE];
    const unsigned char* tileData[SPRITE_POOL_SIZE];  // pointer to tile data in ROM
    uint8_t              tileIndex[SPRITE_POOL_SIZE]; // tile index in VRAM
    uint8_t              width[SPRITE_POOL_SIZE];     // in tiles
    uint8_t              height[SPRITE_POOL_SIZE];    // in tiles
    vec2_i               offset[SPRITE_POOL_SIZE];    // offset relative to entity transform
    uint8_t              flags[SPRITE_POOL_SIZE];     // packed attribute bits
} SpriteComponent;


/* ============================================================
   Local Sprite (used during rendering)
   ============================================================ */
typedef struct {
    uint8_t              id;
    uint8_t              width;
    uint8_t              height;
    const unsigned char* tileData;
    uint8_t              tileIndex;
    vec2_i               offset;
    bool                 isWorld;
    bool                 visible;
    uint8_t              flags;
    uint8_t              flipProps;
} LocalSprite;


/* ============================================================
   Global instance
   ============================================================ */
extern SpriteComponent spriteComponent;


/* ============================================================
   Inline utility functions
   ============================================================ */

/* Sprite dimension helpers */
static inline uint8_t getSpriteWidth(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return spriteComponent.width[i];
    return 0;
}

static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.width[i] = width;
            return;
        }
}

static inline uint8_t getSpriteHeight(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return spriteComponent.height[i];
    return 0;
}

static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.height[i] = height;
            return;
        }
}

static inline void setSpriteTileData(uint8_t entityID, const unsigned char* tileData) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.tileData[i] = tileData;
            return;
        }
    }
}

/* Palette accessors (replace old Z-index accessors) */
static inline uint8_t getSpritePalette(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return SPRITE_GET_PALETTE(spriteComponent.flags[i]);
    return 0;
}

static inline void setSpritePalette(uint8_t entityID, uint8_t palette) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            SPRITE_SET_PALETTE(spriteComponent.flags[i], palette);
            return;
        }
}

static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.offset[i] = newOffset;
            return;
        }
}

/* World flag */
static inline bool getSpriteWorldFlag(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_WORLD) != 0;
    return false;
}

static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            if (isWorld)
                spriteComponent.flags[i] |= SPRF_WORLD;
            else
                spriteComponent.flags[i] &= ~SPRF_WORLD;
            return;
        }
}

/* Flip flags */
static inline bool getSpriteFlipX(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_FLIPX) != 0;
    return false;
}

static inline void setSpriteFlipX(uint8_t entityID, bool flip) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            if (flip)
                spriteComponent.flags[i] |= SPRF_FLIPX;
            else
                spriteComponent.flags[i] &= ~SPRF_FLIPX;
            return;
        }
}

static inline bool getSpriteFlipY(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_FLIPY) != 0;
    return false;
}

static inline void setSpriteFlipY(uint8_t entityID, bool flip) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            if (flip)
                spriteComponent.flags[i] |= SPRF_FLIPY;
            else
                spriteComponent.flags[i] &= ~SPRF_FLIPY;
            return;
        }
}

/* Active/visible helpers */
static inline bool getSpriteActive(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
    return false;
}

static inline void setSpriteActive(uint8_t entityID, bool active) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            if (active)
                spriteComponent.flags[i] |= SPRF_ACTIVE;
            else
                spriteComponent.flags[i] &= ~SPRF_ACTIVE;
            return;
        }
}

/* Build a local sprite snapshot */
static inline LocalSprite getLocalSprite(uint8_t entityID) {
    LocalSprite s = {0};
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            s.id        = spriteComponent.entityID[i];
            s.width     = spriteComponent.width[i];
            s.height    = spriteComponent.height[i];
            s.offset    = spriteComponent.offset[i];
            s.flags     = spriteComponent.flags[i];
            s.tileData  = spriteComponent.tileData[i];
            s.tileIndex = spriteComponent.tileIndex[i];
            s.isWorld   = (spriteComponent.flags[i] & SPRF_WORLD) != 0;
            s.visible   = (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
            s.flipProps = spriteComponent.flags[i] & (SPRF_FLIPX | SPRF_FLIPY);
            return s;
        }
    return s;
}

#endif /* SPRITE_COMPONENT_H */
