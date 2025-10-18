#ifndef RENDER_SPRITE_SYSTEM_H
#define RENDER_SPRITE_SYSTEM_H


#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "../Components/sprite_component.h"
#include "../Components/transform_component.h"
#include "../ECS/ECS.h"
//#include "camera.h"  // assuming a global camera position vec2_i

void RenderSprites(void);

#endif