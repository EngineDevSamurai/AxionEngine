#ifndef EVENT_LISTENER_COMPONENT_H
#define EVENT_LISTENER_COMPONENT_H

#include <stdint.h>
#include <stdbool.h>
#include <gb/gb.h>
#include "../../Asset_Manifests/event_manifest.h"
#include "../../settings.h"

// Struct for events
typedef struct {
    uint8_t type;
    uint8_t entityID;
    uint8_t arg1;
    uint8_t arg2;
} Event;

// Global event pool
extern Event eventPool[];

// For keeping track of active events
extern uint8_t eventCount;

// Callback function type for event listeners
typedef void (*EventCallback)(Event* e);

// Event Listener Component
typedef struct {
    uint8_t entityID[EVENT_LISTENER_POOL_SIZE];       // Owner of the listener
    EventType type[EVENT_LISTENER_POOL_SIZE];         // The event type it responds to
    EventCallback callback[EVENT_LISTENER_POOL_SIZE]; // The function to call
} EventListenerComponent;

extern EventListenerComponent eventListenerComponent;

#endif