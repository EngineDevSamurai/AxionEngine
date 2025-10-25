#ifndef ECS_H
#define ECS_H

#include <stdint.h>
#include <stdbool.h>
#include "Libraries/vec2.h"  

// Defining our bits for the bitmask
#define TRANSFORM_COMPONENT      (1 << 0)
#define SPRITE_COMPONENT         (1 << 1)
#define EVENT_LISTENER_COMPONENT (1 << 2)
#define BOX_COLLIDER_COMPONENT   (1 << 3)

// Defining our entity struct
typedef struct {
    uint8_t ID;
    uint16_t components; // 2 byte bitmask
} Entity;

// Create an Entity
uint8_t CreateEntity(uint16_t components);

// Get next available entityID
uint8_t GetNextEntityID(void);

// Get next available entity index
uint8_t GetNextAvailableEntityIndex(void);


// Add a component to an entity
void EntityAddComponent (Entity *entity, uint16_t component);

// Remove a component
void EntityRemoveComponent(Entity *entity, uint16_t component);

// Check if entity has a component
bool EntityHasComponent(const Entity *entity, uint16_t component);

// Get the first entity index inside of a component pool
uint8_t FindEntityIndexInComponentPool(uint8_t entityID, uint8_t *poolPointer, uint8_t poolSize);


// Get the next available component pool slot
uint8_t GetNextAvailableComponentPoolSlot(uint8_t *poolPointer, uint8_t poolSize);

// Return a pointer to an entity for lookup by ID
Entity* getEntityById (uint8_t entityID);

// Kill Entity
void KillEntity(uint8_t entityID);

// Initialize Component Pools
void InitializeComponentPools(void);

#endif