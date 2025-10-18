;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module ECS
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _entity
	.globl _EntityAddComponent
	.globl _EntityRemoveComponent
	.globl _EntityHasComponent
	.globl _GetNextAvailableComponentPoolSlot
	.globl _getEntityById
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_entity::
	.ds 300
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;Source/Engine/ECS/../Libraries/vec2.h:32: static inline void vec2_set(vec2 *v, int x, int y) {
;	---------------------------------
; Function vec2_set
; ---------------------------------
_vec2_set:
	ld	l, c
	ld	h, b
;Source/Engine/ECS/../Libraries/vec2.h:33: v->x = F12(x);
	ld	c, e
	ld	b, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;Source/Engine/ECS/../Libraries/vec2.h:34: v->y = F12(y);
	inc	de
	inc	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	b, (hl)
	add	a, a
	rl	b
	add	a, a
	rl	b
	add	a, a
	rl	b
	add	a, a
	rl	b
	ld	c, a
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;Source/Engine/ECS/../Libraries/vec2.h:35: }
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/ECS/../Libraries/vec2.h:38: static inline void vec2_add(vec2 *a, const vec2 *b) {
;	---------------------------------
; Function vec2_add
; ---------------------------------
_vec2_add:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
;Source/Engine/ECS/../Libraries/vec2.h:39: a->x += b->x;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/ECS/../Libraries/vec2.h:40: a->y += b->y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;Source/Engine/ECS/../Libraries/vec2.h:41: }
	add	sp, #8
	ret
;Source/Engine/ECS/../Libraries/vec2.h:44: static inline void vec2_sub(vec2 *a, const vec2 *b) {
;	---------------------------------
; Function vec2_sub
; ---------------------------------
_vec2_sub:
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
;Source/Engine/ECS/../Libraries/vec2.h:45: a->x -= b->x;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/ECS/../Libraries/vec2.h:46: a->y -= b->y;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/ECS/../Libraries/vec2.h:47: }
	add	sp, #6
	ret
;Source/Engine/ECS/../Libraries/vec2.h:50: static inline void vec2_scale(vec2 *a, f12 s) {
;	---------------------------------
; Function vec2_scale
; ---------------------------------
_vec2_scale:
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
;Source/Engine/ECS/../Libraries/vec2.h:52: a->x = ((int32_t)a->x * s) >> 4;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	(hl), c
	inc	hl
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl+), a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mullong
	ld	a, #0x04
00103$:
	sra	d
	rr	e
	rr	b
	rr	c
	dec	a
	jr	NZ, 00103$
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/ECS/../Libraries/vec2.h:53: a->y = ((int32_t)a->y * s) >> 4;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mullong
	ld	a, #0x04
00105$:
	sra	d
	rr	e
	rr	b
	rr	c
	dec	a
	jr	NZ, 00105$
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/ECS/../Libraries/vec2.h:54: }
	add	sp, #14
	ret
;Source/Engine/ECS/../Libraries/vec2.h:57: static inline void vec2_copy(vec2 *dest, const vec2 *src) {
;	---------------------------------
; Function vec2_copy
; ---------------------------------
_vec2_copy:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
;Source/Engine/ECS/../Libraries/vec2.h:58: dest->x = src->x;
	ld	a, d
	ld	(hl-), a
	inc	sp
	inc	sp
	push	bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;Source/Engine/ECS/../Libraries/vec2.h:59: dest->y = src->y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;Source/Engine/ECS/../Libraries/vec2.h:60: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Libraries/vec2.h:63: static inline bool vec2_equal(const vec2 *a, const vec2 *b) {
;	---------------------------------
; Function vec2_equal
; ---------------------------------
_vec2_equal:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
;Source/Engine/ECS/../Libraries/vec2.h:64: return a->x == b->x && a->y == b->y;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, l
	sub	a, c
	jr	NZ, 00103$
	ld	a, h
	sub	a, b
	jr	NZ, 00103$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00115$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00104$
00115$:
00103$:
	xor	a, a
	jr	00105$
00104$:
	ld	a, #0x01
00105$:
;Source/Engine/ECS/../Libraries/vec2.h:65: }
	add	sp, #8
	ret
;Source/Engine/ECS/../Components/transform_component.h:16: static inline vec2 getTransformPosition(uint8_t entityID) {
;	---------------------------------
; Function getTransformPosition
; ---------------------------------
_getTransformPosition:
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/ECS/../Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/ECS/../Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/transform_component.h:20: result = transformComponent.position[i];
	ld	de, #_transformComponent + 100
	ld	l, c
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0004
	push	hl
	call	___memcpy
;Source/Engine/ECS/../Components/transform_component.h:21: return result;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/transform_component.h:24: return result;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
00107$:
;Source/Engine/ECS/../Components/transform_component.h:25: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/ECS/../Components/sprite_component.h:132: static inline uint8_t getSpriteWidth(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWidth
; ---------------------------------
_getSpriteWidth:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:134: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:135: return spriteComponent.width[i];
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:136: return 0;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:137: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:139: static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
;	---------------------------------
; Function setSpriteWidth
; ---------------------------------
_setSpriteWidth:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/ECS/../Components/sprite_component.h:140: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	a, e
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/ECS/../Components/sprite_component.h:141: if (spriteComponent.entityID[i] == entityID) {
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:142: spriteComponent.width[i] = width;
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:143: return;
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:140: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:145: }
	add	sp, #5
	ret
;Source/Engine/ECS/../Components/sprite_component.h:147: static inline uint8_t getSpriteHeight(uint8_t entityID) {
;	---------------------------------
; Function getSpriteHeight
; ---------------------------------
_getSpriteHeight:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:148: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:149: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:150: return spriteComponent.height[i];
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:148: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:151: return 0;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:152: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:154: static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
;	---------------------------------
; Function setSpriteHeight
; ---------------------------------
_setSpriteHeight:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/ECS/../Components/sprite_component.h:155: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	a, e
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/ECS/../Components/sprite_component.h:156: if (spriteComponent.entityID[i] == entityID) {
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:157: spriteComponent.height[i] = height;
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:158: return;
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:155: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:160: }
	add	sp, #5
	ret
;Source/Engine/ECS/../Components/sprite_component.h:163: static inline uint8_t getSpritePalette(uint8_t entityID) {
;	---------------------------------
; Function getSpritePalette
; ---------------------------------
_getSpritePalette:
	add	sp, #-6
	ldhl	sp,	#4
;Source/Engine/ECS/../Components/sprite_component.h:164: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:165: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:166: return SPRITE_GET_PALETTE(spriteComponent.flags[i]);
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	and	a, #0x38
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl+), a
	ld	(hl), #0x00
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:164: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:167: return 0;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:168: }
	add	sp, #6
	ret
;Source/Engine/ECS/../Components/sprite_component.h:170: static inline void setSpritePalette(uint8_t entityID, uint8_t palette) {
;	---------------------------------
; Function setSpritePalette
; ---------------------------------
_setSpritePalette:
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl-), a
;Source/Engine/ECS/../Components/sprite_component.h:171: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	a, e
	ld	(hl-), a
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00105$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/ECS/../Components/sprite_component.h:172: if (spriteComponent.entityID[i] == entityID) {
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:173: SPRITE_SET_PALETTE(spriteComponent.flags[i], palette);
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl-), a
	dec	hl
	and	a, #0xc7
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	and	a, #0x07
	ld	(hl), a
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	or	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl)
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:174: return;
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:171: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl-)
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:176: }
	add	sp, #7
	ret
;Source/Engine/ECS/../Components/sprite_component.h:187: static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
;	---------------------------------
; Function setSpriteOffset
; ---------------------------------
_setSpriteOffset:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:188: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	e, #0x00
	ld	c, e
00105$:
	ld	a, c
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/ECS/../Components/sprite_component.h:189: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:190: spriteComponent.offset[i] = newOffset;
	ldhl	sp,	#3
	ld	c, l
	ld	b, h
	ld	a, e
	add	a, a
	add	a, #<((_spriteComponent + 300))
	ld	e, a
	ld	a, #0x00
	adc	a, #>((_spriteComponent + 300))
	ld	d, a
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;Source/Engine/ECS/../Components/sprite_component.h:191: return;
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:188: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	c
	ld	e, c
	jr	00105$
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:193: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/ECS/../Components/sprite_component.h:196: static inline bool getSpriteWorldFlag(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWorldFlag
; ---------------------------------
_getSpriteWorldFlag:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:197: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:198: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:199: return (spriteComponent.flags[i] & SPRF_WORLD) != 0;
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	and	a, #0x01
	ld	(hl), a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:197: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:200: return false;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:201: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:203: static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
;	---------------------------------
; Function setSpriteWorldFlag
; ---------------------------------
_setSpriteWorldFlag:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/ECS/../Components/sprite_component.h:204: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/ECS/../Components/sprite_component.h:205: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/ECS/../Components/sprite_component.h:207: spriteComponent.flags[i] |= SPRF_WORLD;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/ECS/../Components/sprite_component.h:206: if (isWorld)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/ECS/../Components/sprite_component.h:207: spriteComponent.flags[i] |= SPRF_WORLD;
	set	0, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/ECS/../Components/sprite_component.h:209: spriteComponent.flags[i] &= ~SPRF_WORLD;
	res	0, a
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:210: return;
	jr	00110$
00109$:
;Source/Engine/ECS/../Components/sprite_component.h:204: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/ECS/../Components/sprite_component.h:212: }
	inc	sp
	ret
;Source/Engine/ECS/../Components/sprite_component.h:215: static inline bool getSpriteFlipX(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipX
; ---------------------------------
_getSpriteFlipX:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:216: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:217: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:218: return (spriteComponent.flags[i] & SPRF_FLIPX) != 0;
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	and	a, #0x02
	ld	(hl), a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:216: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:219: return false;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:220: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:222: static inline void setSpriteFlipX(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipX
; ---------------------------------
_setSpriteFlipX:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/ECS/../Components/sprite_component.h:223: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/ECS/../Components/sprite_component.h:224: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/ECS/../Components/sprite_component.h:226: spriteComponent.flags[i] |= SPRF_FLIPX;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/ECS/../Components/sprite_component.h:225: if (flip)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/ECS/../Components/sprite_component.h:226: spriteComponent.flags[i] |= SPRF_FLIPX;
	set	1, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/ECS/../Components/sprite_component.h:228: spriteComponent.flags[i] &= ~SPRF_FLIPX;
	res	1, a
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:229: return;
	jr	00110$
00109$:
;Source/Engine/ECS/../Components/sprite_component.h:223: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/ECS/../Components/sprite_component.h:231: }
	inc	sp
	ret
;Source/Engine/ECS/../Components/sprite_component.h:233: static inline bool getSpriteFlipY(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipY
; ---------------------------------
_getSpriteFlipY:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:234: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:235: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:236: return (spriteComponent.flags[i] & SPRF_FLIPY) != 0;
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	and	a, #0x04
	ld	(hl), a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:234: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:237: return false;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:238: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:240: static inline void setSpriteFlipY(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipY
; ---------------------------------
_setSpriteFlipY:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/ECS/../Components/sprite_component.h:241: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/ECS/../Components/sprite_component.h:242: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/ECS/../Components/sprite_component.h:244: spriteComponent.flags[i] |= SPRF_FLIPY;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/ECS/../Components/sprite_component.h:243: if (flip)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/ECS/../Components/sprite_component.h:244: spriteComponent.flags[i] |= SPRF_FLIPY;
	set	2, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/ECS/../Components/sprite_component.h:246: spriteComponent.flags[i] &= ~SPRF_FLIPY;
	res	2, a
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:247: return;
	jr	00110$
00109$:
;Source/Engine/ECS/../Components/sprite_component.h:241: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/ECS/../Components/sprite_component.h:249: }
	inc	sp
	ret
;Source/Engine/ECS/../Components/sprite_component.h:252: static inline bool getSpriteActive(uint8_t entityID) {
;	---------------------------------
; Function getSpriteActive
; ---------------------------------
_getSpriteActive:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/ECS/../Components/sprite_component.h:253: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	(hl-), a
	xor	a, a
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00105$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:254: if (spriteComponent.entityID[i] == entityID)
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:255: return (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	and	a, #0x80
	ld	(hl), a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:253: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:256: return false;
	xor	a, a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:257: }
	add	sp, #4
	ret
;Source/Engine/ECS/../Components/sprite_component.h:259: static inline void setSpriteActive(uint8_t entityID, bool active) {
;	---------------------------------
; Function setSpriteActive
; ---------------------------------
_setSpriteActive:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/ECS/../Components/sprite_component.h:260: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/ECS/../Components/sprite_component.h:261: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/ECS/../Components/sprite_component.h:263: spriteComponent.flags[i] |= SPRF_ACTIVE;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/ECS/../Components/sprite_component.h:262: if (active)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/ECS/../Components/sprite_component.h:263: spriteComponent.flags[i] |= SPRF_ACTIVE;
	set	7, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/ECS/../Components/sprite_component.h:265: spriteComponent.flags[i] &= ~SPRF_ACTIVE;
	res	7, a
	ld	(de), a
;Source/Engine/ECS/../Components/sprite_component.h:266: return;
	jr	00110$
00109$:
;Source/Engine/ECS/../Components/sprite_component.h:260: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/ECS/../Components/sprite_component.h:268: }
	inc	sp
	ret
;Source/Engine/ECS/../Components/sprite_component.h:271: static inline LocalSprite getLocalSprite(uint8_t entityID) {
;	---------------------------------
; Function getLocalSprite
; ---------------------------------
_getLocalSprite:
	add	sp, #-16
	ldhl	sp,	#15
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:272: LocalSprite s = {0};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;Source/Engine/ECS/../Components/sprite_component.h:273: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x32
	jp	NC, 00103$
;Source/Engine/ECS/../Components/sprite_component.h:274: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, b
	jp	NZ, 00106$
;Source/Engine/ECS/../Components/sprite_component.h:275: s.id        = spriteComponent.entityID[i];
	ld	de, #_spriteComponent
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:276: s.width     = spriteComponent.width[i];
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:277: s.height    = spriteComponent.height[i];
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:278: s.offset    = spriteComponent.offset[i];
	ldhl	sp,	#12
	ld	a, (hl+)
	inc	hl
	add	a, a
	ld	(hl), a
	ld	de, #(_spriteComponent + 300)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #8
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/ECS/../Components/sprite_component.h:279: s.flags     = spriteComponent.flags[i];
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:280: s.tileData  = spriteComponent.tileData[i];
	ld	de, #(_spriteComponent + 50)
	ldhl	sp,	#14
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:281: s.tileIndex = spriteComponent.tileIndex[i];
	ld	de, #(_spriteComponent + 150)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:282: s.isWorld   = (spriteComponent.flags[i] & SPRF_WORLD) != 0;
	ld	a, (bc)
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#8
;Source/Engine/ECS/../Components/sprite_component.h:283: s.visible   = (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
	ld	(hl+), a
	ld	a, (bc)
	and	a, #0x80
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
;Source/Engine/ECS/../Components/sprite_component.h:284: s.flipProps = spriteComponent.flags[i] & (SPRF_FLIPX | SPRF_FLIPY);
	ld	(hl+), a
	inc	hl
	ld	a, (bc)
	and	a, #0x06
	ld	(hl), a
;Source/Engine/ECS/../Components/sprite_component.h:285: return s;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00107$
00106$:
;Source/Engine/ECS/../Components/sprite_component.h:273: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	c
	ldhl	sp,	#12
	ld	(hl), c
	jp	00105$
00103$:
;Source/Engine/ECS/../Components/sprite_component.h:287: return s;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
00107$:
;Source/Engine/ECS/../Components/sprite_component.h:288: }
	add	sp, #16
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/ECS/ECS.c:9: void EntityAddComponent (Entity *entity, uint16_t component) {
;	---------------------------------
; Function EntityAddComponent
; ---------------------------------
_EntityAddComponent::
	add	sp, #-11
	ldhl	sp,	#9
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
;Source/Engine/ECS/ECS.c:13: if (EntityHasComponent(entity, component)){
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EntityHasComponent
	ldhl	sp,#6
	ld	(hl), a
	bit	0, (hl)
;Source/Engine/ECS/ECS.c:14: return;
	jp	NZ, 00112$
;Source/Engine/ECS/ECS.c:17: entity->components |= component;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,	(hl-)
	ld	l, (hl)
	push	af
	ld	a, l
	push	hl
	ldhl	sp,	#11
	or	a, (hl)
	pop	hl
	ld	e, a
	pop	af
	ldhl	sp,	#8
	or	a, (hl)
;Source/Engine/ECS/ECS.c:25: transformComponent.entityID[nextPoolSlot] = entity->ID;
	inc	hl
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;Source/Engine/ECS/ECS.c:20: switch (component) {
	ldhl	sp,	#7
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	Z, 00103$
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jp	Z, 00106$
	jp	00112$
;Source/Engine/ECS/ECS.c:21: case TRANSFORM_COMPONENT:
00103$:
;Source/Engine/ECS/ECS.c:22: nextPoolSlot = GetNextAvailableComponentPoolSlot(transformComponent.entityID, TRANSFORM_POOL_SIZE);
	ld	a, #0x64
	ld	de, #_transformComponent
	call	_GetNextAvailableComponentPoolSlot
;Source/Engine/ECS/ECS.c:23: if (nextPoolSlot != 255) {
	ldhl	sp,#0
	ld	(hl), a
	inc	a
	jp	Z, 00112$
;Source/Engine/ECS/ECS.c:24: vec2_set(&transformComponent.position[nextPoolSlot], 0, 0);
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00152$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00152$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #(_transformComponent + 100)
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
;Source/Engine/ECS/../Libraries/vec2.h:33: v->x = F12(x);
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/../Libraries/vec2.h:34: v->y = F12(y);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:25: transformComponent.entityID[nextPoolSlot] = entity->ID;
	ld	de, #_transformComponent
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;Source/Engine/ECS/ECS.c:27: break;
	jp	00112$
;Source/Engine/ECS/ECS.c:28: case SPRITE_COMPONENT:
00106$:
;Source/Engine/ECS/ECS.c:29: nextPoolSlot = GetNextAvailableComponentPoolSlot(spriteComponent.entityID, SPRITE_POOL_SIZE);
	ld	a, #0x32
	ld	de, #_spriteComponent
	call	_GetNextAvailableComponentPoolSlot
;Source/Engine/ECS/ECS.c:30: if (nextPoolSlot != 255) {
	ldhl	sp,#3
	ld	(hl), a
	inc	a
	jp	Z, 00112$
;Source/Engine/ECS/ECS.c:31: spriteComponent.entityID[nextPoolSlot] = entity->ID;
	ld	de, #_spriteComponent
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;Source/Engine/ECS/ECS.c:32: spriteComponent.tileData[nextPoolSlot] = 0; // Null pointer, but zero for consistency
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#6
	ld	(hl), a
	ld	de, #(_spriteComponent + 50)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:33: spriteComponent.tileIndex[nextPoolSlot] = 0;
	ld	de, #(_spriteComponent + 150)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:34: spriteComponent.width[nextPoolSlot] = 0;
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:35: spriteComponent.height[nextPoolSlot] = 0;
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:36: spriteComponent.offset[nextPoolSlot].x = 0;
	ld	de, #(_spriteComponent + 300)
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:37: spriteComponent.offset[nextPoolSlot].y = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:38: spriteComponent.flags[nextPoolSlot] = 0;
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:45: }
00112$:
;Source/Engine/ECS/ECS.c:46: }
	add	sp, #11
	ret
;Source/Engine/ECS/ECS.c:49: void EntityRemoveComponent(Entity *entity, uint16_t component) {
;	---------------------------------
; Function EntityRemoveComponent
; ---------------------------------
_EntityRemoveComponent::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
;Source/Engine/ECS/ECS.c:51: entity->components &= ~component;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, c
	cpl
	ld	e, a
	ld	a, b
	cpl
	ld	d, a
	ld	a, l
	and	a, e
	push	hl
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	and	a, d
	ldhl	sp,	#3
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
;Source/Engine/ECS/ECS.c:57: if (transformComponent.entityID[i] == entity -> ID)  {
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;Source/Engine/ECS/ECS.c:54: switch (component) {
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x02
	or	a, b
	jr	Z, 00105$
	jp	00116$
;Source/Engine/ECS/ECS.c:55: case TRANSFORM_COMPONENT:
00101$:
;Source/Engine/ECS/ECS.c:56: for (i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#3
	ld	(hl), #0x00
	ld	c, #0x00
00112$:
;Source/Engine/ECS/ECS.c:57: if (transformComponent.entityID[i] == entity -> ID)  {
	ld	hl, #_transformComponent
	ld	b, #0x00
	add	hl, bc
	ld	a, (de)
	ld	b, (hl)
	sub	a, b
	jr	NZ, 00113$
;Source/Engine/ECS/ECS.c:58: vec2_set(&transformComponent.position[i], 0, 0);
	ld	bc, #_transformComponent + 100
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, bc
;Source/Engine/ECS/../Libraries/vec2.h:33: v->x = F12(x);
	xor	a, a
	ld	(hl+), a
	ld	(hl-), a
;Source/Engine/ECS/../Libraries/vec2.h:34: v->y = F12(y);
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:59: transformComponent.entityID[i] = 0;
	ld	de, #_transformComponent
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;Source/Engine/ECS/ECS.c:60: return;
	jr	00116$
00113$:
;Source/Engine/ECS/ECS.c:56: for (i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	c
	ldhl	sp,	#3
	ld	a,c
	ld	(hl),a
	sub	a, #0x64
	jr	C, 00112$
;Source/Engine/ECS/ECS.c:63: break;
	jr	00116$
;Source/Engine/ECS/ECS.c:64: case SPRITE_COMPONENT:
00105$:
;Source/Engine/ECS/ECS.c:65: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	bc, #0x0
00114$:
;Source/Engine/ECS/ECS.c:66: if (spriteComponent.entityID[i] == entity -> ID)  {
	ld	a, #<(_spriteComponent)
	add	a, b
	ld	l, a
	ld	a, #>(_spriteComponent)
	adc	a, #0x00
	ld	h, a
	ld	a, (de)
	ld	l, (hl)
	sub	a, l
	jr	NZ, 00115$
;Source/Engine/ECS/ECS.c:67: spriteComponent.entityID[i] = 0;
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:68: spriteComponent.tileData[i] = 0;
	ld	hl, #_spriteComponent + 50
	ld	a, c
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:69: spriteComponent.tileIndex[i] = 0;
	ld	hl, #_spriteComponent + 150
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:70: spriteComponent.width[i] = 0;
	ld	hl, #_spriteComponent + 200
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:71: spriteComponent.height[i] = 0;
	ld	hl, #_spriteComponent + 250
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:72: spriteComponent.offset[i].x = 0;
	ld	hl, #_spriteComponent + 300
	ld	d, #0x00
	add	hl, de
;Source/Engine/ECS/ECS.c:73: spriteComponent.offset[i].y = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:74: spriteComponent.flags[i] = 0;
	ld	hl, #(_spriteComponent + 400)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:75: return;
	jr	00116$
00115$:
;Source/Engine/ECS/ECS.c:65: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	b
	ld	c, b
	ld	a, b
	sub	a, #0x32
	jr	C, 00114$
;Source/Engine/ECS/ECS.c:83: }
00116$:
;Source/Engine/ECS/ECS.c:84: }
	add	sp, #6
	ret
;Source/Engine/ECS/ECS.c:87: bool EntityHasComponent(const Entity *entity, uint16_t component) {
;	---------------------------------
; Function EntityHasComponent
; ---------------------------------
_EntityHasComponent::
;Source/Engine/ECS/ECS.c:88: return (entity->components & component) != 0;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl+)
	ld	l, (hl)
	and	a, c
	ld	c, a
	ld	a, l
	and	a, b
	or	a, c
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
;Source/Engine/ECS/ECS.c:89: }
	ret
;Source/Engine/ECS/ECS.c:91: uint8_t GetNextAvailableComponentPoolSlot(uint8_t *poolPointer, uint8_t poolSize) {
;	---------------------------------
; Function GetNextAvailableComponentPoolSlot
; ---------------------------------
_GetNextAvailableComponentPoolSlot::
	dec	sp
	ld	c, a
;Source/Engine/ECS/ECS.c:93: for (i = 0; i < poolSize; i++) {
	ldhl	sp,	#0
	ld	(hl), #0x00
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, c
	jr	NC, 00103$
;Source/Engine/ECS/ECS.c:94: if (poolPointer[i] == 0) {
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;Source/Engine/ECS/ECS.c:95: return i;
	ldhl	sp,	#0
	ld	a, (hl)
	jr	00107$
00106$:
;Source/Engine/ECS/ECS.c:93: for (i = 0; i < poolSize; i++) {
	inc	b
	ldhl	sp,	#0
	ld	(hl), b
	jr	00105$
00103$:
;Source/Engine/ECS/ECS.c:98: return 255;
	ld	a, #0xff
00107$:
;Source/Engine/ECS/ECS.c:99: }
	inc	sp
	ret
;Source/Engine/ECS/ECS.c:101: Entity* getEntityById (uint8_t id) {
;	---------------------------------
; Function getEntityById
; ---------------------------------
_getEntityById::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/ECS/ECS.c:102: for (int i = 0; i < MAX_ENTITIES; i++) {
	ld	bc, #0x0000
00105$:
	ld	a, c
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/ECS/ECS.c:103: if (entity[i].ID == id) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_entity)
	ld	e, a
	ld	a, h
	adc	a, #>(_entity)
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00106$
;Source/Engine/ECS/ECS.c:104: return &entity[i];
	ld	c, e
	ld	b, d
	jr	00107$
00106$:
;Source/Engine/ECS/ECS.c:102: for (int i = 0; i < MAX_ENTITIES; i++) {
	inc	bc
	jr	00105$
00103$:
;Source/Engine/ECS/ECS.c:107: return 0;
	ld	bc, #0x0000
00107$:
;Source/Engine/ECS/ECS.c:108: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
