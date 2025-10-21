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
#include "Systems/event_system.h"
#include "ECS/ECS.h"

void movePlayer3 (Event* e);

void main(void)
{
 
  uint8_t player = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT);
  uint8_t player2 = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT);
  uint8_t player3 = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT | EVENT_LISTENER_COMPONENT);

  setTransformPosition(player, F12(65), F12(65));
  setSpriteTileData(player, face);
  setSpriteWidth(player, 2);
  setSpriteHeight(player, 2);
  setSpriteWorldFlag(player, true);
  setSpriteActive(player, true);


  
  setTransformPosition(player2, F12(25), F12(95));
  setSpriteTileData(player2, smiley);
  setSpriteWidth(player2, 1);
  setSpriteHeight(player2, 1);
  setSpriteWorldFlag(player2, true);
  setSpriteActive(player2, true);

  setTransformPosition(player3, F12(36), F12(95));
  setSpriteTileData(player3, face);
  setSpriteWidth(player3, 2);
  setSpriteHeight(player3, 2);
  setSpriteWorldFlag(player3, true);
  setSpriteActive(player3, true);
  setEventListener(player3, ON_CREATE_ENTITY, movePlayer3);
  
  ClearEventPool();
  Emit(ON_CREATE_ENTITY, player3, player3, 0);

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

    moveEntity(player, 100, 2);
    moveEntity(player2, 10, -50);


    //Process Events
    ProcessEvents();
    

    // Render Function Calls Here
    RenderSprites();

    // Prevent screen tearing and runaway CPU usage
    wait_vbl_done();
  }
}

  void movePlayer3 (Event* e) {
  uint8_t id = e->entityID;
  setTransformPosition(id, 77, 77);
}