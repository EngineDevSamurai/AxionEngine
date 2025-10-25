#include "components.h"
#include <string.h>

/*────────────────────────────────────────────────*/
/*─ ███████╗██████╗ ██████╗ ██╗████████╗███████╗ ─*/
/*─ ██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝ ─*/
/*─ ███████╗██████╔╝██████╔╝██║   ██║   █████╗   ─*/
/*─ ╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝   ─*/
/*─ ███████║██║     ██║  ██║██║   ██║   ███████╗ ─*/
/*─ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝ ─*/
/*────────────── SPRITE COMPONENT ────────────────*/

//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//────────────────── GLOBAL DECLARATIONS ────────────────────//

// Global Sprite Component Pool
SpriteComponent spriteComponent;


//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//───────────────── FUNCTION PROTOTYPES ─────────────────────//

// Initialize Sprite Component Pool
void initializeSpritePool(void) {
    memset(&spriteComponent, 0, sizeof(spriteComponent));
}

//─────────────────── SPRITE COMPONENT ──────────────────────//
//                                                           //
//───────────────────────── END ─────────────────────────────//



/*───────────────────────────────────────────────────────────────────────────────────*/
/*─ ████████╗██████╗ █████╗  ███╗   ██╗███████╗███████╗ ██████╗ ██████╗ ███╗   ███╗ ─*/
/*─ ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗████╗ ████║ ─*/
/*─    ██║   ██████╔╝███████║██╔██╗ ██║███████╗█████╗  ██║   ██║██████╔╝██╔████╔██║ ─*/
/*─    ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║ ─*/
/*─    ██║   ██║  ██║██║  ██║██║ ╚████║███████║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║ ─*/
/*─    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝══╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ─*/
/*───────────────────────── TRANSFORM COMPONENT ─────────────────────────────────────*/

//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//─────────────────── GLOBAL DECLARATIONS ───────────────────────//

// Global Transform Component Pool
TransformComponent transformComponent;


//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//─────────────────── FUNCTION PROTOTYPES ───────────────────────//

// Initialize Transform Component Pool
void initializeTransformPool(void){
    memset(&transformComponent, 0, sizeof(transformComponent));
}

//─────────────────── TRANSFORM COMPONENT ───────────────────────//
//                                                               //
//───────────────────────── END ─────────────────────────────────//



/*────────────────────────────────────────────────*/
/*─ ███████╗██╗   ██╗███████╗███╗   ██╗████████╗ ─*/
/*─ ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝ ─*/
/*─ █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║    ─*/
/*─ ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║    ─*/
/*─ ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║    ─*/
/*─ ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ─*/
/*─────────── EVENT LISTENER COMPONENT ───────────*/

//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//────────────────────── GLOBAL DECLARATIONS ─────────────────────────//

// Global event pool
Event eventPool[EVENT_POOL_SIZE];

// For keeping track of active events
uint8_t eventCount = 0;

// Global Event Listener Pool
EventListenerComponent eventListenerComponent;


//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//────────────────────── FUNCTION PROTOTYPES ─────────────────────────//

// Initialize Event Listener Component Pool
void initializeEventListenerPool(void) {
    memset(&eventListenerComponent, 0, sizeof(eventListenerComponent));
}

//─────────────────── EVENT LISTENER COMPONENT ───────────────────────//
//                                                                    //
//───────────────────────────── END ──────────────────────────────────//



/*──────────────────────────────────────────────────*/
/*─           ██████╗  ██████╗ ██╗  ██╗            ─*/
/*─           ██╔══██╗██╔═══██╗╚██╗██╔╝            ─*/
/*─           ██████╔╝██║   ██║ ╚███╔╝             ─*/
/*─           ██╔══██╗██║   ██║ ██╔██╗             ─*/
/*─           ██████╔╝╚██████╔╝██╔╝ ██╗            ─*/
/*─           ╚═════╝  ╚═════╝ ╚═╝  ╚═╝            ─*/
/*──────────── BOX COLLIDER COMPONENT ──────────────*/

//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//─────────────────── GLOBAL DECLARATIONS ─────────────────────────//

// Global Box Collider Pool
BoxColliderComponent boxColliderComponent;


//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//──────────────────── FUNCTION PROTOTYPES ────────────────────────//

// Initialize Box Collider Component Pool
void initializeBoxColliderPool(void) {
    memset(&boxColliderComponent, 0, sizeof(boxColliderComponent));
}

//────────────────── BOX COLLIDER COMPONENT ───────────────────────//
//                                                                 //
//───────────────────────────── END ───────────────────────────────//