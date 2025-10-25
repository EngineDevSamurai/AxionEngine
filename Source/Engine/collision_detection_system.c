#include "collision_detection_system.h"
#include "systems.h"


// Process Collisions
void ProcessCollisions(void) {
    LocalCollider boxA;
    LocalCollider boxB;
    for (uint8_t i = 0; i < BOX_COLLIDER_POOL_SIZE; i++) 
    {
        if (boxColliderComponent.entityID[i] == 0) continue;
        boxA.entityID  = boxColliderComponent.entityID[i];
        boxA.layerMask = boxColliderComponent.layerMask[i];
        boxA.width     = boxColliderComponent.width[i];
        boxA.height    = boxColliderComponent.height[i];
        boxA.offset    = boxColliderComponent.offset[i];
        boxA.position  = *boxColliderComponent.position[i];
        boxA.position.x += F12(boxA.offset.x);
        boxA.position2.x = boxA.position.x + F12(boxA.width);
        boxA.position.y += F12(boxA.offset.y);
        boxA.position2.y = boxA.position.y + F12(boxA.height);

        for (uint8_t j = 0; j < BOX_COLLIDER_POOL_SIZE; j++) 
        {
            if (boxColliderComponent.entityID[j] == 0 || j <= i) continue;
            boxB.entityID  = boxColliderComponent.entityID[j];
            boxB.layerMask = boxColliderComponent.layerMask[j];
            boxB.width     = boxColliderComponent.width[j];
            boxB.height    = boxColliderComponent.height[j];
            boxB.offset    = boxColliderComponent.offset[j];
            boxB.position  = *boxColliderComponent.position[j];
            boxB.position.x += F12(boxB.offset.x);
            boxB.position2.x = boxB.position.x + F12(boxB.width);
            boxB.position.y += F12(boxB.offset.y);
            boxB.position2.y = boxB.position.y + F12(boxB.height);
                            
                
            boxB.position.x += F12(boxB.offset.x);
            boxB.position2.x = boxB.position.x + F12(boxB.width);
            boxB.position.y += F12(boxB.offset.y);
            boxB.position2.y = boxB.position.y + F12(boxB.height);

            if (boxA.position.x < boxB.position2.x &&
                boxA.position2.x > boxB.position.x &&
                boxA.position.y < boxB.position2.y &&
                boxA.position2.y > boxB.position.y) 
            {
                Emit(boxA.entityID, ON_COLLISION, boxB.entityID, 0);
                Emit(boxB.entityID, ON_COLLISION, boxA.entityID, 0);
            } 
        }
    }
}