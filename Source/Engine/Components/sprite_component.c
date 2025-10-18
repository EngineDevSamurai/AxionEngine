#include "sprite_component.h"

SpriteComponent spriteComponent = {
    .entityID = {0},
    .tileData = {0}, // Using zero for initialization even though this is actually a null pointer
    .tileIndex = {0},
    .width = {0},
    .height = {0},
    .offset = {{0,0}},
    .flags = {0},
};

