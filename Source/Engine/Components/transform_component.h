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

#endif