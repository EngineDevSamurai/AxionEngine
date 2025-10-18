/*
Axion Engine
MIT License

Copyright (c) 2025 Levi Johnston

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. */

#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>


#include "../Asset_Manifests/tile_manifest.h"
#include "../Asset_Manifests/tilemap_manifest.h"
#include "Components/component_manifest.h"
#include "Systems/render_sprite_system.h"
#include "ECS/ECS.h"

void main(void)
{
  Entity player =  { .ID = 1, .components = 0 }; // Write function to get next ID
  
  EntityAddComponent(&player, TRANSFORM_COMPONENT);
  transformComponent.position[0].x = F12(65);
  transformComponent.position[0].y = F12(65);
  EntityAddComponent(&player, SPRITE_COMPONENT);
  spriteComponent.tileData[0] = face;
  spriteComponent.width[0] = 2;
  spriteComponent.height[0] = 2;
  spriteComponent.flags[0] = SPRF_WORLD | SPRF_ACTIVE;


  Entity player2 =  { .ID = 2, .components = 0 }; // Write function to get next ID
  
  EntityAddComponent(&player2, TRANSFORM_COMPONENT);
  transformComponent.position[1].x = F12(25);
  transformComponent.position[1].y = F12(95);
  EntityAddComponent(&player2, SPRITE_COMPONENT);
  spriteComponent.tileData[1] = smiley;
  spriteComponent.width[1] = 1;
  spriteComponent.height[1] = 1;
  spriteComponent.flags[1] = SPRF_WORLD | SPRF_ACTIVE;

  Entity player3 =  { .ID = 3, .components = 0 }; // Write function to get next ID
  
  EntityAddComponent(&player3, TRANSFORM_COMPONENT);
  transformComponent.position[2].x = F12(36);
  transformComponent.position[2].y = F12(95);
  EntityAddComponent(&player3, SPRITE_COMPONENT);
  spriteComponent.tileData[2] = face;
  spriteComponent.width[2] = 2;
  spriteComponent.height[2] = 2;
  spriteComponent.flags[2] = SPRF_WORLD | SPRF_ACTIVE;

  disable_interrupts();
  DISPLAY_OFF;
  LCDC_REG = LCDCF_OFF | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_OBJON | LCDCF_BGON;
  /*
   * LCD        = Off
   * WindowBank = 0x9C00
   * Window     = On
   * BG Chr     = 0x8800
   * BG Bank    = 0x9800
   * OBJ        = 8x16
   * OBJ        = On
   * BG         = On
   */



  /* Set palettes */
  BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;

  /* Initialize the background */
  set_bkg_data(0xFC, 0x04, std_data);
  set_bkg_data(0x00, 0x2D, bkg_data);


  DISPLAY_ON;
  enable_interrupts();

  while(true) {
    // Systems Function Calls Here

    transformComponent.position[0].x += 100;
    transformComponent.position[1].x += 10;

    // Render Function Calls Here
    RenderSprites();
  }
}
