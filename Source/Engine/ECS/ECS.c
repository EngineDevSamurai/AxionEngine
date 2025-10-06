#include "ECS.h"
#include "../Components/transform_component.h"
#include "../Components/sprite_component.h"

// Global Entity Pool
Entity entity[MAX_ENTITIES];

// Add a component to an entity
void EntityAddComponent (Entity *entity, uint16_t component) {
    uint8_t nextPoolSlot;

    // Check if the entity already has the component and return if so
    if (EntityHasComponent(entity, component)){
        return;
    }
    // Set the bitmask for the component being added
    entity->components |= component;

    // Add the entity to the component pool
    switch (component) {
        case TRANSFORM_COMPONENT:
            nextPoolSlot = GetNextAvailableComponentPoolSlot(transformComponent.entityID, TRANSFORM_POOL_SIZE);
            if (nextPoolSlot != 255) {
                vec2_set(&transformComponent.position[nextPoolSlot], 0, 0);
                transformComponent.entityID[nextPoolSlot] = entity->ID;
            }
        break;
        case SPRITE_COMPONENT:
            nextPoolSlot = GetNextAvailableComponentPoolSlot(spriteComponent.entityID, SPRITE_POOL_SIZE);
            if (nextPoolSlot != 255) {
                spriteComponent.entityID[nextPoolSlot] = entity->ID;
                spriteComponent.tileData[nextPoolSlot] = 0; // Null pointer, but zero for consistency
                spriteComponent.tileIndex[nextPoolSlot] = 0;
                spriteComponent.width[nextPoolSlot] = 0;
                spriteComponent.height[nextPoolSlot] = 0;
                spriteComponent.offset[nextPoolSlot].x = 0;
                spriteComponent.offset[nextPoolSlot].y = 0;
                spriteComponent.flags[nextPoolSlot] = 0;
                spriteComponent.palette[nextPoolSlot] = 0;
            }
        break;
        default:

        break;

    }
}

// Remove a component
void EntityRemoveComponent(Entity *entity, uint16_t component) {
    uint8_t i;
    entity->components &= ~component;

    // Remove the entity from the component pool
    switch (component) {
        case TRANSFORM_COMPONENT:
            for (i = 0; i < TRANSFORM_POOL_SIZE; i++) {
                if (transformComponent.entityID[i] == entity -> ID)  {
                    vec2_set(&transformComponent.position[i], 0, 0);
                    transformComponent.entityID[i] = 0;
                    return;
                }
            }
        break;
        case SPRITE_COMPONENT:
            for (i = 0; i < SPRITE_POOL_SIZE; i++) {
                if (spriteComponent.entityID[i] == entity -> ID)  {
                    spriteComponent.entityID[i] = 0;
                    spriteComponent.tileData[i] = 0;
                    spriteComponent.tileIndex[i] = 0;
                    spriteComponent.width[i] = 0;
                    spriteComponent.height[i] = 0;
                    spriteComponent.offset[i].x = 0;
                    spriteComponent.offset[i].y = 0;
                    spriteComponent.flags[i] = 0;
                    spriteComponent.palette[i] = 0;
                    return;
                }
            }
        break;
        default:

        break;

    }
}

// Check if entity has a component
bool EntityHasComponent(const Entity *entity, uint16_t component) {
    return (entity->components & component) != 0;
}

uint8_t GetNextAvailableComponentPoolSlot(uint8_t *poolPointer, uint8_t poolSize) {
    uint8_t i;
    for (i = 0; i < poolSize; i++) {
        if (poolPointer[i] == 0) {
            return i;
        }
    }
    return 255;
}

Entity* getEntityById (uint8_t id) {
    for (int i = 0; i < MAX_ENTITIES; i++) {
        if (entity[i].ID == id) {
            return &entity[i];
        }
    }
    return 0;
}
