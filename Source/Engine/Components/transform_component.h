#ifndef TRANSFORM_COMPONENT_H
#define TRANSFORM_COMPONENT_H

#include "../Libraries/vec2.h"
#include "../../settings.h"

typedef struct {
    uint8_t entityID [TRANSFORM_POOL_SIZE];
    vec2 position [TRANSFORM_POOL_SIZE];  // vec2 with f12 fixed-point
} TransformComponent;

// Declare the global instance
extern TransformComponent transformComponent;

// Inline function for returning transform position
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

// Inline function for setting transform position
static inline void setTransformPosition(uint8_t entityID, int16_t x, int16_t y) {
    for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
        if (transformComponent.entityID[i] == entityID) {
            transformComponent.position[i].x = x;
            transformComponent.position[i].y = y;
            return;
        }
    }
}

// Inline function for moving entity
static inline void moveEntity(uint8_t entityID, int16_t x, int16_t y) {
    for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
        if (transformComponent.entityID[i] == entityID) {
            transformComponent.position[i].x += x;
            transformComponent.position[i].y += y;
            return;
        }
    }
}


#endif