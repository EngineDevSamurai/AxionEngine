#include "event_listener_component.h"

// Global event pool
Event eventPool[EVENT_POOL_SIZE];

// For keeping track of active events
uint8_t eventCount = 0;

// Event Listener Component
EventListenerComponent eventListenerComponent = {
    .entityID = {0},
    .type = {0},
    .callback = {0}
};