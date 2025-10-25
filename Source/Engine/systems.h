#ifndef SYSTEMS_H
#define SYSTEMS_H

#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "components.h"
#include "ECS.h"


/*────────────────────────────────────────────────*/
/*─ ███████╗██████╗ ██████╗ ██╗████████╗███████╗ ─*/
/*─ ██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝ ─*/
/*─ ███████╗██████╔╝██████╔╝██║   ██║   █████╗   ─*/
/*─ ╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝   ─*/
/*─ ███████║██║     ██║  ██║██║   ██║   ███████╗ ─*/
/*─ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝ ─*/
/*─────────── RENDER SPRITE SYSTEM ───────────────*/

//──────────────── RENDER SPRITE SYSTEM ─────────────────────//
//                                                           //
//───────────────── FUNCTION PROTOTYPES ─────────────────────//

// Render Sprites
void RenderSprites(void);

//──────────────── RENDER SPRITE SYSTEM ─────────────────────//
//                                                           //
//───────────────────────── END ─────────────────────────────//



/*────────────────────────────────────────────────*/
/*─ ███████╗██╗   ██╗███████╗███╗   ██╗████████╗ ─*/
/*─ ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝ ─*/
/*─ █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║    ─*/
/*─ ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║    ─*/
/*─ ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║    ─*/
/*─ ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ─*/
/*──────────────── EVENT SYSTEM ──────────────────*/

//───────────────────────── EVENT SYSTEM ─────────────────────────────//
//                                                                    //
//────────────────────── FUNCTION PROTOTYPES ─────────────────────────//

// Clear event pool
void ClearEventPool(void);

// Emit Event
void EmitEvent(Event event);

// Wrapper for EmitEvent. Removes need to construct an event
void Emit(uint8_t type, uint8_t arg1, uint8_t arg2);

// Process events
void ProcessEvents(void);

// Set event listener
void setEventListener(uint8_t entityID, EventType type, EventCallback callback);
    
// Add event listener
void addEventListener(uint8_t entityID, EventType type, EventCallback callback);
    
//───────────────────────── EVENT SYSTEM ─────────────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//

/*────────────────────────────────────────────────*/
/*─ ██╗ ███╗   ██╗ ██████╗  ██╗   ██╗ ████████╗  ─*/
/*─ ██║ ████╗  ██║ ██╔══██╗ ██║   ██║ ╚══██╔══╝  ─*/
/*─ ██║ ██╔██╗ ██║ ██████╔╝ ██║   ██║    ██║     ─*/
/*─ ██║ ██║╚██╗██║ ██╔═══╝  ██║   ██║    ██║     ─*/
/*─ ██║ ██║ ╚████║ ██║      ╚██████╔╝    ██║     ─*/
/*─ ╚═╝ ╚═╝  ╚═══╝ ╚═╝       ╚═════╝     ╚═╝     ─*/
/*───────────────── INPUT SYSTEM ─────────────────*/


//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//──────────────── GLOBAL DECLARATIONS ───────────────────────//

// Global variable for current held state
extern uint8_t buttonHeld;

//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//─────────────────────── MACROS ─────────────────────────────//

// Button Bitmask Setup
// Each bit represents a button's "held" state
#define BTN_UP      (1U << 0)
#define BTN_DOWN    (1U << 1)
#define BTN_LEFT    (1U << 2)
#define BTN_RIGHT   (1U << 3)
#define BTN_A       (1U << 4)
#define BTN_B       (1U << 5)
#define BTN_START   (1U << 6)
#define BTN_SELECT  (1U << 7)

// Button State Macros
// Check if a button was held in the previous frame
#define IS_HELD(btn)        (buttonHeld & (btn))
// Mark a button as held
#define SET_HELD(btn)       (buttonHeld |= (btn))
// Clear a button’s held state
#define CLEAR_HELD(btn)     (buttonHeld &= ~(btn))
// Toggle a button’s held state (optional)
#define TOGGLE_HELD(btn)    (buttonHeld ^= (btn))

//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//──────────────── FUNCTION PROTOTYPES ───────────────────────//

void ProcessInput(void);

//──────────────────── INPUT SYSTEM ──────────────────────────//
//                                                            //
//──────────────────────── END ───────────────────────────────//


/*──────────────────────────────────────────────────*/
/*─           ██████╗  ██████╗ ██╗  ██╗            ─*/
/*─           ██╔══██╗██╔═══██╗╚██╗██╔╝            ─*/
/*─           ██████╔╝██║   ██║ ╚███╔╝             ─*/
/*─           ██╔══██╗██║   ██║ ██╔██╗             ─*/
/*─           ██████╔╝╚██████╔╝██╔╝ ██╗            ─*/
/*─           ╚═════╝  ╚═════╝ ╚═╝  ╚═╝            ─*/
/*──────────── BOX COLLISION SYSTEM ────────────────*/

// Process Collisions
void ProcessCollisions(void);

//────────────────────── BOX COLLIDER SYSTEM ─────────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//

#endif