#include "input_system.h"

uint8_t buttonHeld = 0;

void ProcessInput(void) {
    uint8_t input = joypad();
    // UP
    if (input & J_UP) {
        if (IS_HELD(BTN_UP)) {
            Emit(ON_BUTTON_UP_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_UP);
            Emit(ON_BUTTON_UP_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_UP);
    }

    // DOWN
    if (input & J_DOWN) {
        if (IS_HELD(BTN_DOWN)) {
            Emit(ON_BUTTON_DOWN_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_DOWN);
            Emit(ON_BUTTON_DOWN_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_DOWN);
    }

    // LEFT
    if (input & J_LEFT) {
        if (IS_HELD(BTN_LEFT)) {
            Emit(ON_BUTTON_LEFT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_LEFT);
            Emit(ON_BUTTON_LEFT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_LEFT);
    }

    // RIGHT
    if (input & J_RIGHT) {
        if (IS_HELD(BTN_RIGHT)) {
            Emit(ON_BUTTON_RIGHT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_RIGHT);
            Emit(ON_BUTTON_RIGHT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_RIGHT);
    }

    // A
    if (input & J_A) {
        if (IS_HELD(BTN_A)) {
            Emit(ON_BUTTON_A_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_A);
            Emit(ON_BUTTON_A_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_A);
    }

    // B
    if (input & J_B) {
        if (IS_HELD(BTN_B)) {
            Emit(ON_BUTTON_B_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_B);
            Emit(ON_BUTTON_B_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_B);
    }

    // START
    if (input & J_START) {
        if (IS_HELD(BTN_START)) {
            Emit(ON_BUTTON_START_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_START);
            Emit(ON_BUTTON_START_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_START);
    }

    // SELECT
    if (input & J_SELECT) {
        if (IS_HELD(BTN_SELECT)) {
            Emit(ON_BUTTON_SELECT_HELD, GLOBAL_EVENT, 0, 0);
        } 
        else {
            SET_HELD(BTN_SELECT);
            Emit(ON_BUTTON_SELECT_PRESSED, GLOBAL_EVENT, 0, 0);
        }
    } 
    else {
        CLEAR_HELD(BTN_SELECT);
    }
}