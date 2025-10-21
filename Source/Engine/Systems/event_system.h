#ifndef EVENT_SYSTEM_H
#define EVENT_SYSTEM_H


#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "../Components/component_manifest.h"
#include "../../settings.h"



// Clear event pool
void ClearEventPool(void);

// Emit Event
void EmitEvent(Event event);

// Wrapper for EmitEvent. Removes need to construct an event
void Emit(uint8_t type, uint8_t entityID, uint8_t arg1, uint8_t arg2);

// Process events
void ProcessEvents(void);

// Set event listener
void setEventListener(uint8_t entityID, EventType type, EventCallback callback);
    

#endif