#include "event_system.h"

// Clear event pool
void ClearEventPool(void) {
    for (int i = 0; i < EVENT_POOL_SIZE; i++) {
        eventPool[i].type = 0;
        eventPool[i].entityID = 0;
        eventPool[i].arg1 = 0;
        eventPool[i].arg2 = 0;
    }
    eventCount = 0;
}

// Emit Event
void EmitEvent(Event event) {
    if (eventCount == EVENT_POOL_SIZE) return; // No slots available
    eventPool[eventCount] = event;
    eventCount++;
}

// Wrapper for EmitEvent. Removes need to construct an event
void Emit(uint8_t type, uint8_t entityID, uint8_t arg1, uint8_t arg2) {
    Event e = {type, entityID, arg1, arg2};
    EmitEvent(e);
}

// Process events
void ProcessEvents(void) {
    for (uint8_t i = 0; i < eventCount; i++) {
        Event* e = &eventPool[i];

        for (uint8_t j = 0; j < EVENT_LISTENER_POOL_SIZE; j++) {
            if (eventListenerComponent.type[j] == e->type &&
            (eventListenerComponent.entityID[j] == e->entityID ||
                eventListenerComponent.entityID[j] == 254)) {

                eventListenerComponent.callback[j](e);
            }
        }
    }
    ClearEventPool();

}

// Set event listener
void setEventListener(uint8_t entityID, EventType type, EventCallback callback) {
    // Look for an existing listener slot for this entity
    for (uint8_t i = 0; i < EVENT_LISTENER_POOL_SIZE; i++) {
        if (eventListenerComponent.entityID[i] == entityID &&
            eventListenerComponent.type[i] == 0) {  // uninitialized slot
            eventListenerComponent.type[i] = type;
            eventListenerComponent.callback[i] = callback;
            return;
        }
    }
}

