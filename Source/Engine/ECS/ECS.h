#ifndef ECS_H
#define ECS_H

#include <stdint.h>
#include <stdbool.h>
#include "../Libraries/vec2.h"  

// Defining our bits for the bitmask
#define TRANSFORM_COMPONENT (1 << 0)
#define SPRITE_COMPONENT    (1 << 1)

// Defining our entity struct
typedef struct {
    uint8_t ID;
    uint16_t components; // 2 byte bitmask
} Entity;

// Add a component to an entity
void EntityAddComponent (Entity *entity, uint16_t component);

// Remove a component
void EntityRemoveComponent(Entity *entity, uint16_t component);

// Check if entity has a component
bool EntityHasComponent(const Entity *entity, uint16_t component);

uint8_t GetNextAvailableComponentPoolSlot(uint8_t *poolPointer, uint8_t poolSize);

// Return a pointer to an entity for lookup by ID
Entity* getEntityById (uint8_t id);

#endif