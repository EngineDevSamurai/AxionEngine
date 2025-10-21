#ifndef BOX_COLLIDER_COMPONENT_H
#define BOX_COLLIDER_COMPONENT_H

#include "../Libraries/vec2.h"
#include "../../settings.h"

// ───────────────
// Collision Layers and Masks
// ───────────────
#define LAYER_0 0
#define LAYER_1 1
#define LAYER_2 2
#define LAYER_3 3
#define LAYER_4 4
#define LAYER_5 5
#define LAYER_6 6
#define LAYER_7 7

#define MASK_0 (1U << LAYER_0)
#define MASK_1 (1U << LAYER_1)
#define MASK_2 (1U << LAYER_2)
#define MASK_3 (1U << LAYER_3)
#define MASK_4 (1U << LAYER_4)
#define MASK_5 (1U << LAYER_5)
#define MASK_6 (1U << LAYER_6)
#define MASK_7 (1U << LAYER_7)

typedef struct {
    uint8_t entityID [BOX_COLLIDER_POOL_SIZE];
    uint8_t layerMask[BOX_COLLIDER_POOL_SIZE]; // bits 0–3: collision layer, bits 4–7: collision mask
    uint8_t width    [BOX_COLLIDER_POOL_SIZE];
    uint8_t height   [BOX_COLLIDER_POOL_SIZE];
    vec2_i  offset   [BOX_COLLIDER_POOL_SIZE];
} BoxColliderComponent;

extern BoxColliderComponent boxColliderComponent;

// Extract the collision layer (0–15)
static inline uint8_t getCollisionLayer(uint8_t entityID) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            return boxColliderComponent.layerMask[i] & 0x0F;
        }
    }
    return 0xFF;
}

// Extract the collision layerMask (upper nibble)
static inline uint8_t getCollisionMask(uint8_t entityID) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            return (boxColliderComponent.layerMask[i] >> 4) & 0x0F;
        }
    }
    return 0xFF;
}

// Set the collision layer (lower nibble)
static inline void setCollisionLayer(uint8_t entityID, uint8_t layer) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.layerMask[i] =
                (boxColliderComponent.layerMask[i] & 0xF0) | (layer & 0x0F);
            return;
        }
    }
}

// Set the collision mask (upper nibble)
static inline void setCollisionMask(uint8_t entityID, uint8_t mask) {
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) {
        if (boxColliderComponent.entityID[i] == entityID) {
            boxColliderComponent.layerMask[i] =
                ((mask & 0x0F) << 4) | (boxColliderComponent.layerMask[i] & 0x0F);
            return;
        }
    }
}

#endif
