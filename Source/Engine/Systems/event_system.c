#include "event_system.h"

// Clear event pool
void ClearEventPool(void) {
    for (int i = 0; i < eventCount; i++) {
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
    eventCount++;
    eventPool[eventCount] = event;
}

// Wrapper for EmitEvent. Removes need to construct an event
void Emit(uint8_t type, uint8_t entityID, uint8_t arg1, uint8_t arg2) {
    Event e = {type, entityID, arg1, arg2};
    EmitEvent(e);
}
