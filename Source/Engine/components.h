#ifndef COMPONENTS_H
#define COMPONENTS_H

#include <stdint.h>
#include <stdbool.h>
#include <gb/gb.h>                    
#include "../settings.h"
#include "Libraries/vec2.h"
#include "../Asset_Manifests/event_manifest.h"




/*────────────────────────────────────────────────*/
/*─ ███████╗██████╗ ██████╗ ██╗████████╗███████╗ ─*/
/*─ ██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝ ─*/
/*─ ███████╗██████╔╝██████╔╝██║   ██║   █████╗   ─*/
/*─ ╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝   ─*/
/*─ ███████║██║     ██║  ██║██║   ██║   ███████╗ ─*/
/*─ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝ ─*/
/*────────────── SPRITE COMPONENT ────────────────*/

//─────────────────── SPRITE COMPONENT ───────────────────────//
//                                                            //
//─────────────────────── MACROS ─────────────────────────────//

/* ------- Flag layout (1 byte) -------------------------------
   bit0 : WORLD (1=world, 0=UI)          [SPRF_WORLD]
   bit1 : FLIP X                         [SPRF_FLIPX]
   bit2 : FLIP Y                         [SPRF_FLIPY]
   bits3-5 : PALETTE index (0..7)        [SPRF_PAL_MASK / SHIFT]
   bit6 : OBJ->BG priority (behind BG)   [SPRF_BEHIND]
   bit7 : ACTIVE / visible               [SPRF_ACTIVE]
------------------------------------------------------------ */

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


//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//──────────────────── STRUCTS / TYPES ──────────────────────//

// Sprite Component
typedef struct {
    uint8_t              entityID [SPRITE_POOL_SIZE];
    const unsigned char* tileData [SPRITE_POOL_SIZE]; // pointer to tile data in ROM
    uint8_t              tileIndex[SPRITE_POOL_SIZE]; // tile index in VRAM
    uint8_t              width    [SPRITE_POOL_SIZE]; // in tiles
    uint8_t              height   [SPRITE_POOL_SIZE]; // in tiles
    vec2_i               offset   [SPRITE_POOL_SIZE]; // offset relative to entity transform
    uint8_t              flags    [SPRITE_POOL_SIZE]; // packed attribute bits
} SpriteComponent;


// Local Sprite
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


//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//────────────────── GLOBAL DECLARATIONS ────────────────────//
extern SpriteComponent spriteComponent;


//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//─────────────── INLINE / STATIC FUNCTIONS ─────────────────//

// Get Sprite Width
static inline uint8_t getSpriteWidth(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return spriteComponent.width[i];
    return 0;
}

// Get Sprite Height
static inline uint8_t getSpriteHeight(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return spriteComponent.height[i];
    return 0;
}

// Get Sprite Palette
static inline uint8_t getSpritePalette(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return SPRITE_GET_PALETTE(spriteComponent.flags[i]);
    return 0;
}

// Get Sprite World Flag
static inline bool getSpriteWorldFlag(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_WORLD) != 0;
    return false;
}

// Get Sprite Flip X
static inline bool getSpriteFlipX(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_FLIPX) != 0;
    return false;
}

// Get Sprite Flip Y
static inline bool getSpriteFlipY(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_FLIPY) != 0;
    return false;
}

// Get Sprite Active
static inline bool getSpriteActive(uint8_t entityID) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID)
            return (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
    return false;
}

// Get Local Sprite
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

// Set Sprite Width
static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
    {
        if (spriteComponent.entityID[i] == entityID) 
        {
            spriteComponent.width[i] = width;
            return;
        }
    }
}

// Set Sprite Height
static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
    {
        if (spriteComponent.entityID[i] == entityID) 
        {
            spriteComponent.height[i] = height;
            return;
        }
    }
}

// Set Sprite Tile Data
static inline void setSpriteTileData(uint8_t entityID, const unsigned char* tileData) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.tileData[i] = tileData;
            return;
        }
    }
}

// Set Sprite Palette
static inline void setSpritePalette(uint8_t entityID, uint8_t palette) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            SPRITE_SET_PALETTE(spriteComponent.flags[i], palette);
            return;
        }
}

// Set Sprite Offset
static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
        if (spriteComponent.entityID[i] == entityID) {
            spriteComponent.offset[i] = newOffset;
            return;
        }
}

// Set Sprite World Flag
static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (isWorld) {
                spriteComponent.flags[i] |= SPRF_WORLD;
            } else {
                spriteComponent.flags[i] &= ~SPRF_WORLD;
            }
            return;
        }
    }
}

// Set Sprite Flip X
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

// Set Sprite Flip Y
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

// Set Sprite Active
static inline void setSpriteActive(uint8_t entityID, bool active) {
    for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
        if (spriteComponent.entityID[i] == entityID) {
            if (active) {
                spriteComponent.flags[i] |= SPRF_ACTIVE;
            } else {
                spriteComponent.flags[i] &= ~SPRF_ACTIVE;
            }
            return;
        }
    }
}



//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//───────────────── FUNCTION PROTOTYPES ─────────────────────//

// Initialize Sprite Component Pool
void initializeSpritePool(void);

//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//───────────────────────── END ─────────────────────────────//




/*───────────────────────────────────────────────────────────────────────────────────*/
/*─ ████████╗██████╗ █████╗  ███╗   ██╗███████╗███████╗ ██████╗ ██████╗ ███╗   ███╗ ─*/
/*─ ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗████╗ ████║ ─*/
/*─    ██║   ██████╔╝███████║██╔██╗ ██║███████╗█████╗  ██║   ██║██████╔╝██╔████╔██║ ─*/
/*─    ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║ ─*/
/*─    ██║   ██║  ██║██║  ██║██║ ╚████║███████║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║ ─*/
/*─    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝══╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ─*/
/*───────────────────────── TRANSFORM COMPONENT ─────────────────────────────────────*/



//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//───────────────────── STRUCTS / TYPES ─────────────────────────//

// Transform Component
typedef struct {
    uint8_t entityID [TRANSFORM_POOL_SIZE];
    vec2 position [TRANSFORM_POOL_SIZE];  // vec2 with f12 fixed-point
} TransformComponent;


//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//─────────────────── GLOBAL DECLARATIONS ───────────────────────//

// Global Transform Component Pool
extern TransformComponent transformComponent;

//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//──────────────── INLINE / STATIC FUNCTIONS ────────────────────//

// Get Transform Position
static inline vec2 getTransformPosition(uint8_t entityID) {
    vec2 result = {0, 0};
    for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
        if (transformComponent.entityID[i] == entityID) {
            result = transformComponent.position[i];
            return result;
        }
    }
    return result;
}

// Set Transform Position
static inline void setTransformPosition(uint8_t entityID, int16_t x, int16_t y) {
    for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
        if (transformComponent.entityID[i] == entityID) {
            transformComponent.position[i].x = x;
            transformComponent.position[i].y = y;
            return;
        }
    }
}

// Move Entity
static inline void moveEntity(uint8_t entityID, int16_t x, int16_t y) {
    for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
        if (transformComponent.entityID[i] == entityID) {
            transformComponent.position[i].x += x;
            transformComponent.position[i].y += y;
            return;
        }
    }
}




//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//─────────────────── FUNCTION PROTOTYPES ───────────────────────//

// Initialize Transform Component Pool
void initializeTransformPool(void);

//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//───────────────────────── END ─────────────────────────────────//



/*────────────────────────────────────────────────*/
/*─ ███████╗██╗   ██╗███████╗███╗   ██╗████████╗ ─*/
/*─ ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝ ─*/
/*─ █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║    ─*/
/*─ ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║    ─*/
/*─ ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║    ─*/
/*─ ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ─*/
/*─────────── EVENT LISTENER COMPONENT ───────────*/

//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//─────────────────────── STRUCTS / TYPES ────────────────────────────//

// Event
typedef struct {
    uint8_t type;
    uint8_t arg1;
    uint8_t arg2;
} Event;

// Callback function type for event listeners
typedef void (*EventCallback)(Event* e);

// Event Listener Component
typedef struct {
    uint8_t entityID[EVENT_LISTENER_POOL_SIZE];       // Owner of the listener
    EventType type[EVENT_LISTENER_POOL_SIZE];         // The event type it responds to
    EventCallback callback[EVENT_LISTENER_POOL_SIZE]; // The function to call
} EventListenerComponent;


//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//────────────────────── GLOBAL DECLARATIONS ─────────────────────────//

// Global event pool
extern Event eventPool[];

// For keeping track of active events
extern uint8_t eventCount;

// Global Event Listener Pool
extern EventListenerComponent eventListenerComponent;


//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//────────────────────── FUNCTION PROTOTYPES ─────────────────────────//

// Initialize Event Listener Component Pool
void initializeEventListenerPool(void);

//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//



/*──────────────────────────────────────────────────*/
/*─           ██████╗  ██████╗ ██╗  ██╗            ─*/
/*─           ██╔══██╗██╔═══██╗╚██╗██╔╝            ─*/
/*─           ██████╔╝██║   ██║ ╚███╔╝             ─*/
/*─           ██╔══██╗██║   ██║ ██╔██╗             ─*/
/*─           ██████╔╝╚██████╔╝██╔╝ ██╗            ─*/
/*─           ╚═════╝  ╚═════╝ ╚═╝  ╚═╝            ─*/
/*──────────── BOX COLLIDER COMPONENT ──────────────*/

//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//────────────────────────── MACROS ───────────────────────────────//

// Collision Layers
#define LAYER_0 0
#define LAYER_1 1
#define LAYER_2 2
#define LAYER_3 3
#define LAYER_4 4
#define LAYER_5 5
#define LAYER_6 6
#define LAYER_7 7

// Collision Masks
#define MASK_0 (1U << LAYER_0)
#define MASK_1 (1U << LAYER_1)
#define MASK_2 (1U << LAYER_2)
#define MASK_3 (1U << LAYER_3)
#define MASK_4 (1U << LAYER_4)
#define MASK_5 (1U << LAYER_5)
#define MASK_6 (1U << LAYER_6)
#define MASK_7 (1U << LAYER_7)

//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//────────────────────── STRUCTS / TYPES ──────────────────────────//

// Box Collider Component
typedef struct {
    uint8_t entityID [BOX_COLLIDER_POOL_SIZE];
    uint8_t layerMask[BOX_COLLIDER_POOL_SIZE]; // bits 0–3: collision layer, bits 4–7: collision mask
    uint8_t width    [BOX_COLLIDER_POOL_SIZE];
    uint8_t height   [BOX_COLLIDER_POOL_SIZE];
    vec2_i  offset   [BOX_COLLIDER_POOL_SIZE];
    vec2*   position [BOX_COLLIDER_POOL_SIZE]; // 🔥 pointer to that entity’s position
} BoxColliderComponent;

// Local Collider
typedef struct {
    uint8_t entityID;
    uint8_t layerMask; 
    uint8_t width;
    uint8_t height;
    vec2_i  offset;
    vec2    position;
    vec2    position2;
} LocalCollider;


//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//─────────────────── GLOBAL DECLARATIONS ─────────────────────────//

// Global Box Collider Pool
extern BoxColliderComponent boxColliderComponent;


//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//──────────────── INLINE / STATIC FUNCTIONS ──────────────────────//

// Get Collision Layer (0–15)
static inline uint8_t getCollisionLayer(uint8_t entityID) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            return boxColliderComponent.layerMask[i] & 0x0F;
        }
    }
    return 0xFF;
}

// Get Collision Mask (upper nibble)
static inline uint8_t getCollisionMask(uint8_t entityID) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            return (boxColliderComponent.layerMask[i] >> 4) & 0x0F;
        }
    }
    return 0xFF;
}

// Set Collision Layer (lower nibble)
static inline void setCollisionLayer(uint8_t entityID, uint8_t layer) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.layerMask[i] =
                (boxColliderComponent.layerMask[i] & 0xF0) | (layer & 0x0F);
            return;
        }
    }
}

// Set Collision Mask (upper nibble)
static inline void setCollisionMask(uint8_t entityID, uint8_t mask) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.layerMask[i] =
                ((mask & 0x0F) << 4) | (boxColliderComponent.layerMask[i] & 0x0F);
            return;
        }
    }
}

// Set Collision Width
static inline void setCollisionWidth(uint8_t entityID, uint8_t width) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.width[i] = width;
            return;
        }
    }
}

// Set Collision Height
static inline void setCollisionHeight(uint8_t entityID, uint8_t height) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.height[i] = height;
            return;
        }
    }
}

// Set Collision Offset
static inline void setCollisionOffset(uint8_t entityID, uint8_t x, uint8_t y) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.offset[i].x = x;
            boxColliderComponent.offset[i].y = y;
            return;
        }
    }
}

// Set Collision Offset Using a vec2_i
static inline void setCollisionOffsetV(uint8_t entityID, vec2_i offset) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.offset[i] = offset;
            return;
        }
    }
}




//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//──────────────────── FUNCTION PROTOTYPES ────────────────────────//

// Initialize Box Collider Component Pool
void initializeBoxColliderPool(void);

//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//───────────────────────────── END ───────────────────────────────//

#endif
