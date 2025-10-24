#ifndef CONTROL_SYSTEM_H
#define CONTROL_SYSTEM_H

#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "../Components/components.h"
#include "../ECS/ECS.h"
#include "event_system.h"

// ───────────────
// Button Bitmask Setup
// ───────────────

// Each bit represents a button's "held" state
#define BTN_UP      (1U << 0)
#define BTN_DOWN    (1U << 1)
#define BTN_LEFT    (1U << 2)
#define BTN_RIGHT   (1U << 3)
#define BTN_A       (1U << 4)
#define BTN_B       (1U << 5)
#define BTN_START   (1U << 6)
#define BTN_SELECT  (1U << 7)

// Global variable for current held state
extern uint8_t buttonHeld;

// ───────────────
// Button State Macros
// ───────────────

// Check if a button was held in the previous frame
#define IS_HELD(btn)        (buttonHeld & (btn))

// Mark a button as held
#define SET_HELD(btn)       (buttonHeld |= (btn))

// Clear a button’s held state
#define CLEAR_HELD(btn)     (buttonHeld &= ~(btn))

// Toggle a button’s held state (optional)
#define TOGGLE_HELD(btn)    (buttonHeld ^= (btn))


void ProcessInput(void);

#endif