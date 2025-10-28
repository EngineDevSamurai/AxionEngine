#include "engine_globals.h"

/*──────────────────────────────────────────────────────────*/
/*─   ██████╗  █████╗ ███╗   ███╗███████╗██████╗  █████╗   ─*/
/*─  ██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔══██╗██╔══██╗  ─*/
/*─  ██║      ███████║██╔████╔██║█████╗  ██████╔╝███████║  ─*/
/*─  ██║      ██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║  ─*/
/*─  ╚██████╗ ██║  ██║██║ ╚═╝ ██║███████╗██║  ██║██║  ██║  ─*/
/*─   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝  ─*/
/*───────────────────── CAMERA GLOBAL ──────────────────────*/

// Camera
vec2 camera;

// Initialize Camera (must be called at startup)
void InitializeCamera(void) {
    camera.x = 0;
    camera.y = 0;
}

// Set Camera
void SetCamera(uint16_t x, uint16_t y) {
    camera.x = x;
    camera.y = y;
}

// Set Camera Using a Vec2
void SetCameraV(vec2 position) {
    camera = position;
}

// Move Camera
void MoveCamera(uint16_t dx, uint16_t dy) {
    camera.x += dx;
    camera.y += dy;
}

//───────────────────── CAMERA GLOBAL ──────────────────────//
//                                                          //
//────────────────────────── END ───────────────────────────//