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
#include "ECS.h"

void main(void)
{
  uint8_t i, j;

  Entity player =  { .ID = 1, .components = 0 }; // Write function to get next ID
  
  EntityAddComponent(&player, TRANSFORM_COMPONENT);
  EntityAddComponent(&player, SPRITE_COMPONENT);


  disable_interrupts();
  DISPLAY_OFF;
  LCDC_REG = LCDCF_OFF | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON;
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

  /* Initialize the sprite */
  set_sprite_data(0x00, 0x1C, earth_data);
  set_sprite_prop(0, 0x00);
  set_sprite_prop(1, 0x00);


  DISPLAY_ON;
  enable_interrupts();

  while(true) {
    // Systems Function Calls Here

    // Render Function Calls Here
  }
}
