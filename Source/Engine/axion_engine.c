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
#include "Components/components.h"
#include "Systems/render_sprite_system.h"
#include "Systems/event_system.h"
#include "Systems/input_system.h"
#include "Systems/collision_detection_system.h"
#include "ECS/ECS.h"

void movePlayer3     (Event* e);
void movePlayer      (Event* e);
void killOtherEntity (Event* e);

int8_t player;
void main(void)
{
  InitializeComponentPools();
  player = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT | BOX_COLLIDER_COMPONENT);

  uint8_t player2 = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT | EVENT_LISTENER_COMPONENT | BOX_COLLIDER_COMPONENT);
  uint8_t player3 = CreateEntity(TRANSFORM_COMPONENT | SPRITE_COMPONENT | EVENT_LISTENER_COMPONENT | BOX_COLLIDER_COMPONENT);

  setTransformPosition(player, F12(65), F12(65));
  setSpriteTileData(player, face);
  setSpriteWidth(player, 2);
  setSpriteHeight(player, 2);
  setSpriteWorldFlag(player, true);
  setSpriteActive(player, true);
  addEventListener(player, ON_BUTTON_UP_PRESSED, movePlayer);
  addEventListener(player, ON_BUTTON_UP_HELD, movePlayer);
  addEventListener(player, ON_BUTTON_DOWN_PRESSED, movePlayer);
  addEventListener(player, ON_BUTTON_DOWN_HELD, movePlayer);
  addEventListener(player, ON_BUTTON_LEFT_PRESSED, movePlayer);
  addEventListener(player, ON_BUTTON_LEFT_HELD, movePlayer);
  addEventListener(player, ON_BUTTON_RIGHT_PRESSED, movePlayer);
  addEventListener(player, ON_BUTTON_RIGHT_HELD, movePlayer);
  addEventListener(player, ON_COLLISION, killOtherEntity);
  setCollisionLayer(player, 1);
  setCollisionMask(player, 1);
  setCollisionWidth(player, 16);
  setCollisionHeight(player, 16);


  
  setTransformPosition(player2, F12(25), F12(95));
  setSpriteTileData(player2, smiley);
  setSpriteWidth(player2, 1);
  setSpriteHeight(player2, 1);
  setSpriteWorldFlag(player2, true);
  setSpriteActive(player2, true);
  setCollisionLayer(player2, 1);
  setCollisionMask(player2, 1);
  setCollisionWidth(player2, 8);
  setCollisionHeight(player2, 8);


  setTransformPosition(player3, F12(36), F12(95));
  setSpriteTileData(player3, face);
  setSpriteWidth(player3, 2);
  setSpriteHeight(player3, 2);
  setSpriteWorldFlag(player3, true);
  setSpriteActive(player3, true);
  setEventListener(player3, ON_CREATE_ENTITY, movePlayer3);
  setCollisionLayer(player3, 1);
  setCollisionMask(player3, 1);
  setCollisionWidth(player3, 16);
  setCollisionHeight(player3, 16);
  
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

    // Process Collisions
    ProcessCollisions();

    // Process Input
    ProcessInput();

    // Process Events
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

void movePlayer (Event* e) {
  if (e->type == ON_BUTTON_UP_PRESSED || e->type == ON_BUTTON_UP_HELD)
  moveEntity(player, 0, -40);
  if (e->type == ON_BUTTON_DOWN_PRESSED || e->type == ON_BUTTON_DOWN_HELD)
  moveEntity(player, 0, 40);
  if (e->type == ON_BUTTON_LEFT_PRESSED || e->type == ON_BUTTON_LEFT_HELD)
  moveEntity(player, -40, 0);
  if (e->type == ON_BUTTON_RIGHT_PRESSED || e->type == ON_BUTTON_RIGHT_HELD)
  moveEntity(player, 40, 0);
}

void killOtherEntity(Event* e) {
  uint8_t entityToBeKilled = e->arg1;
  KillEntity(entityToBeKilled);
}