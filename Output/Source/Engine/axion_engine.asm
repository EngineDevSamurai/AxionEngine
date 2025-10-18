;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module axion_engine
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _RenderSprites
	.globl _EntityAddComponent
	.globl _set_bkg_data
	.globl _display_off
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;Source/Engine/Components/../Libraries/vec2.h:32: static inline void vec2_set(vec2 *v, int x, int y) {
;	---------------------------------
; Function vec2_set
; ---------------------------------
_vec2_set:
	ld	l, c
	ld	h, b
;Source/Engine/Components/../Libraries/vec2.h:33: v->x = F12(x);
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
;Source/Engine/Components/../Libraries/vec2.h:34: v->y = F12(y);
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
;Source/Engine/Components/../Libraries/vec2.h:35: }
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Components/../Libraries/vec2.h:38: static inline void vec2_add(vec2 *a, const vec2 *b) {
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
;Source/Engine/Components/../Libraries/vec2.h:39: a->x += b->x;
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
;Source/Engine/Components/../Libraries/vec2.h:40: a->y += b->y;
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
;Source/Engine/Components/../Libraries/vec2.h:41: }
	add	sp, #8
	ret
;Source/Engine/Components/../Libraries/vec2.h:44: static inline void vec2_sub(vec2 *a, const vec2 *b) {
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
;Source/Engine/Components/../Libraries/vec2.h:45: a->x -= b->x;
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
;Source/Engine/Components/../Libraries/vec2.h:46: a->y -= b->y;
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
;Source/Engine/Components/../Libraries/vec2.h:47: }
	add	sp, #6
	ret
;Source/Engine/Components/../Libraries/vec2.h:50: static inline void vec2_scale(vec2 *a, f12 s) {
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
;Source/Engine/Components/../Libraries/vec2.h:52: a->x = ((int32_t)a->x * s) >> 4;
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
;Source/Engine/Components/../Libraries/vec2.h:53: a->y = ((int32_t)a->y * s) >> 4;
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
;Source/Engine/Components/../Libraries/vec2.h:54: }
	add	sp, #14
	ret
;Source/Engine/Components/../Libraries/vec2.h:57: static inline void vec2_copy(vec2 *dest, const vec2 *src) {
;	---------------------------------
; Function vec2_copy
; ---------------------------------
_vec2_copy:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
;Source/Engine/Components/../Libraries/vec2.h:58: dest->x = src->x;
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
;Source/Engine/Components/../Libraries/vec2.h:59: dest->y = src->y;
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
;Source/Engine/Components/../Libraries/vec2.h:60: }
	add	sp, #4
	ret
;Source/Engine/Components/../Libraries/vec2.h:63: static inline bool vec2_equal(const vec2 *a, const vec2 *b) {
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
;Source/Engine/Components/../Libraries/vec2.h:64: return a->x == b->x && a->y == b->y;
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
;Source/Engine/Components/../Libraries/vec2.h:65: }
	add	sp, #8
	ret
;Source/Engine/Components/transform_component.h:16: static inline vec2 getTransformPosition(uint8_t entityID) {
;	---------------------------------
; Function getTransformPosition
; ---------------------------------
_getTransformPosition:
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Components/transform_component.h:20: result = transformComponent.position[i];
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
;Source/Engine/Components/transform_component.h:21: return result;
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
;Source/Engine/Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/Components/transform_component.h:24: return result;
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
;Source/Engine/Components/transform_component.h:25: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/sprite_component.h:132: static inline uint8_t getSpriteWidth(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWidth
; ---------------------------------
_getSpriteWidth:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:134: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:135: return spriteComponent.width[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:136: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:137: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:139: static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
;	---------------------------------
; Function setSpriteWidth
; ---------------------------------
_setSpriteWidth:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:140: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:141: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:142: spriteComponent.width[i] = width;
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
;Source/Engine/Systems/../Components/sprite_component.h:143: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:140: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:145: }
	add	sp, #5
	ret
;Source/Engine/Systems/../Components/sprite_component.h:147: static inline uint8_t getSpriteHeight(uint8_t entityID) {
;	---------------------------------
; Function getSpriteHeight
; ---------------------------------
_getSpriteHeight:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:148: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:149: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:150: return spriteComponent.height[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:148: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:151: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:152: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:154: static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
;	---------------------------------
; Function setSpriteHeight
; ---------------------------------
_setSpriteHeight:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:155: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:156: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:157: spriteComponent.height[i] = height;
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
;Source/Engine/Systems/../Components/sprite_component.h:158: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:155: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:160: }
	add	sp, #5
	ret
;Source/Engine/Systems/../Components/sprite_component.h:163: static inline uint8_t getSpritePalette(uint8_t entityID) {
;	---------------------------------
; Function getSpritePalette
; ---------------------------------
_getSpritePalette:
	add	sp, #-6
	ldhl	sp,	#4
;Source/Engine/Systems/../Components/sprite_component.h:164: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:165: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:166: return SPRITE_GET_PALETTE(spriteComponent.flags[i]);
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
;Source/Engine/Systems/../Components/sprite_component.h:164: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:167: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:168: }
	add	sp, #6
	ret
;Source/Engine/Systems/../Components/sprite_component.h:170: static inline void setSpritePalette(uint8_t entityID, uint8_t palette) {
;	---------------------------------
; Function setSpritePalette
; ---------------------------------
_setSpritePalette:
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:171: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:172: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:173: SPRITE_SET_PALETTE(spriteComponent.flags[i], palette);
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
;Source/Engine/Systems/../Components/sprite_component.h:174: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:171: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl-)
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:176: }
	add	sp, #7
	ret
;Source/Engine/Systems/../Components/sprite_component.h:178: static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
;	---------------------------------
; Function setSpriteOffset
; ---------------------------------
_setSpriteOffset:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:179: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	e, #0x00
	ld	c, e
00105$:
	ld	a, c
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/Systems/../Components/sprite_component.h:180: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Systems/../Components/sprite_component.h:181: spriteComponent.offset[i] = newOffset;
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
;Source/Engine/Systems/../Components/sprite_component.h:182: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:179: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	c
	ld	e, c
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:184: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/sprite_component.h:187: static inline bool getSpriteWorldFlag(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWorldFlag
; ---------------------------------
_getSpriteWorldFlag:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:188: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:189: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:190: return (spriteComponent.flags[i] & SPRF_WORLD) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:188: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:191: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:192: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:194: static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
;	---------------------------------
; Function setSpriteWorldFlag
; ---------------------------------
_setSpriteWorldFlag:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:195: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:196: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:198: spriteComponent.flags[i] |= SPRF_WORLD;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:197: if (isWorld)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:198: spriteComponent.flags[i] |= SPRF_WORLD;
	set	0, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:200: spriteComponent.flags[i] &= ~SPRF_WORLD;
	res	0, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:201: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:195: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:203: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:206: static inline bool getSpriteFlipX(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipX
; ---------------------------------
_getSpriteFlipX:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:207: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:208: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:209: return (spriteComponent.flags[i] & SPRF_FLIPX) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:207: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:210: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:211: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:213: static inline void setSpriteFlipX(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipX
; ---------------------------------
_setSpriteFlipX:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:214: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:215: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:217: spriteComponent.flags[i] |= SPRF_FLIPX;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:216: if (flip)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:217: spriteComponent.flags[i] |= SPRF_FLIPX;
	set	1, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:219: spriteComponent.flags[i] &= ~SPRF_FLIPX;
	res	1, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:220: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:214: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:222: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:224: static inline bool getSpriteFlipY(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipY
; ---------------------------------
_getSpriteFlipY:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:225: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:226: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:227: return (spriteComponent.flags[i] & SPRF_FLIPY) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:225: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:228: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:229: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:231: static inline void setSpriteFlipY(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipY
; ---------------------------------
_setSpriteFlipY:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:232: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:233: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:235: spriteComponent.flags[i] |= SPRF_FLIPY;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:234: if (flip)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:235: spriteComponent.flags[i] |= SPRF_FLIPY;
	set	2, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:237: spriteComponent.flags[i] &= ~SPRF_FLIPY;
	res	2, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:238: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:232: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:240: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:243: static inline bool getSpriteActive(uint8_t entityID) {
;	---------------------------------
; Function getSpriteActive
; ---------------------------------
_getSpriteActive:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:244: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
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
;Source/Engine/Systems/../Components/sprite_component.h:245: if (spriteComponent.entityID[i] == entityID)
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
;Source/Engine/Systems/../Components/sprite_component.h:246: return (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:244: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:247: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:248: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:250: static inline void setSpriteActive(uint8_t entityID, bool active) {
;	---------------------------------
; Function setSpriteActive
; ---------------------------------
_setSpriteActive:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:251: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:252: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:254: spriteComponent.flags[i] |= SPRF_ACTIVE;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:253: if (active)
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:254: spriteComponent.flags[i] |= SPRF_ACTIVE;
	set	7, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:256: spriteComponent.flags[i] &= ~SPRF_ACTIVE;
	res	7, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:257: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:251: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:259: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:262: static inline LocalSprite getLocalSprite(uint8_t entityID) {
;	---------------------------------
; Function getLocalSprite
; ---------------------------------
_getLocalSprite:
	add	sp, #-16
	ldhl	sp,	#15
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:263: LocalSprite s = {0};
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
;Source/Engine/Systems/../Components/sprite_component.h:264: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x32
	jp	NC, 00103$
;Source/Engine/Systems/../Components/sprite_component.h:265: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, b
	jp	NZ, 00106$
;Source/Engine/Systems/../Components/sprite_component.h:266: s.id        = spriteComponent.entityID[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:267: s.width     = spriteComponent.width[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:268: s.height    = spriteComponent.height[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:269: s.offset    = spriteComponent.offset[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:270: s.flags     = spriteComponent.flags[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:271: s.tileData  = spriteComponent.tileData[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:272: s.tileIndex = spriteComponent.tileIndex[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:273: s.isWorld   = (spriteComponent.flags[i] & SPRF_WORLD) != 0;
	ld	a, (bc)
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#8
;Source/Engine/Systems/../Components/sprite_component.h:274: s.visible   = (spriteComponent.flags[i] & SPRF_ACTIVE) != 0;
	ld	(hl+), a
	ld	a, (bc)
	and	a, #0x80
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
;Source/Engine/Systems/../Components/sprite_component.h:275: s.flipProps = spriteComponent.flags[i] & (SPRF_FLIPX | SPRF_FLIPY);
	ld	(hl+), a
	inc	hl
	ld	a, (bc)
	and	a, #0x06
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:276: return s;
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
;Source/Engine/Systems/../Components/sprite_component.h:264: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	inc	c
	ldhl	sp,	#12
	ld	(hl), c
	jp	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:278: return s;
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
;Source/Engine/Systems/../Components/sprite_component.h:279: }
	add	sp, #16
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/axion_engine.c:36: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-9
;Source/Engine/axion_engine.c:38: Entity player =  { .ID = 1, .components = 0 }; // Write function to get next ID
	ldhl	sp,	#0
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/axion_engine.c:40: EntityAddComponent(&player, TRANSFORM_COMPONENT);
	ld	bc, #0x0001
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:41: transformComponent.position[0].x = F12(65);
	ld	hl, #(_transformComponent + 100)
	ld	a, #0x10
	ld	(hl+), a
;Source/Engine/axion_engine.c:42: transformComponent.position[0].y = F12(65);
	ld	a, #0x04
	ld	(hl+), a
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x04
;Source/Engine/axion_engine.c:43: EntityAddComponent(&player, SPRITE_COMPONENT);
	ld	bc, #0x0002
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:44: spriteComponent.tileData[0] = face;
	ld	hl, #(_spriteComponent + 50)
	ld	(hl), #<(_face)
	inc	hl
	ld	(hl), #>(_face)
;Source/Engine/axion_engine.c:45: spriteComponent.width[0] = 2;
	ld	hl, #_spriteComponent + 200
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:46: spriteComponent.height[0] = 2;
	ld	hl, #_spriteComponent + 250
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:47: spriteComponent.flags[0] = SPRF_WORLD | SPRF_ACTIVE;
	ld	hl, #_spriteComponent + 400
	ld	(hl), #0x81
;Source/Engine/axion_engine.c:50: Entity player2 =  { .ID = 2, .components = 0 }; // Write function to get next ID
	ldhl	sp,	#3
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/axion_engine.c:52: EntityAddComponent(&player2, TRANSFORM_COMPONENT);
	ld	bc, #0x0001
	ld	hl, #3
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:53: transformComponent.position[1].x = F12(25);
	ld	hl, #(_transformComponent + 104)
	ld	a, #0x90
	ld	(hl+), a
;Source/Engine/axion_engine.c:54: transformComponent.position[1].y = F12(95);
	ld	a, #0x01
	ld	(hl+), a
	ld	a, #0xf0
	ld	(hl+), a
	ld	(hl), #0x05
;Source/Engine/axion_engine.c:55: EntityAddComponent(&player2, SPRITE_COMPONENT);
	ld	bc, #0x0002
	ld	hl, #3
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:56: spriteComponent.tileData[1] = smiley;
	ld	hl, #(_spriteComponent + 52)
	ld	a, #<(_smiley)
	ld	(hl+), a
	ld	(hl), #>(_smiley)
;Source/Engine/axion_engine.c:57: spriteComponent.width[1] = 1;
	ld	hl, #_spriteComponent + 201
	ld	(hl), #0x01
;Source/Engine/axion_engine.c:58: spriteComponent.height[1] = 1;
	ld	hl, #_spriteComponent + 251
	ld	(hl), #0x01
;Source/Engine/axion_engine.c:59: spriteComponent.flags[1] = SPRF_WORLD | SPRF_ACTIVE;
	ld	hl, #_spriteComponent + 401
	ld	(hl), #0x81
;Source/Engine/axion_engine.c:61: Entity player3 =  { .ID = 3, .components = 0 }; // Write function to get next ID
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ld	(hl), #0x03
	ld	c, e
	ld	b, d
	inc	bc
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;Source/Engine/axion_engine.c:63: EntityAddComponent(&player3, TRANSFORM_COMPONENT);
	push	de
	ld	bc, #0x0001
	call	_EntityAddComponent
	pop	de
;Source/Engine/axion_engine.c:64: transformComponent.position[2].x = F12(36);
	ld	hl, #_transformComponent + 108
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:65: transformComponent.position[2].y = F12(95);
	ld	hl, #_transformComponent + 110
	ld	a, #0xf0
	ld	(hl+), a
	ld	(hl), #0x05
;Source/Engine/axion_engine.c:66: EntityAddComponent(&player3, SPRITE_COMPONENT);
	ld	bc, #0x0002
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:67: spriteComponent.tileData[2] = face;
	ld	hl, #(_spriteComponent + 54)
	ld	(hl), #<(_face)
	inc	hl
	ld	(hl), #>(_face)
;Source/Engine/axion_engine.c:68: spriteComponent.width[2] = 2;
	ld	hl, #_spriteComponent + 202
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:69: spriteComponent.height[2] = 2;
	ld	hl, #_spriteComponent + 252
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:70: spriteComponent.flags[2] = SPRF_WORLD | SPRF_ACTIVE;
	ld	hl, #_spriteComponent + 402
	ld	(hl), #0x81
;/opt/gbdk/include/gb/gb.h:811: __asm__("di");
	di
;Source/Engine/axion_engine.c:73: DISPLAY_OFF;
	call	_display_off
;Source/Engine/axion_engine.c:74: LCDC_REG = LCDCF_OFF | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_OBJON | LCDCF_BGON;
	ld	a, #0x63
	ldh	(_LCDC_REG + 0), a
;Source/Engine/axion_engine.c:89: BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;Source/Engine/axion_engine.c:92: set_bkg_data(0xFC, 0x04, std_data);
	ld	de, #_std_data
	push	de
	ld	hl, #0x4fc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;Source/Engine/axion_engine.c:93: set_bkg_data(0x00, 0x2D, bkg_data);
	ld	de, #_bkg_data
	push	de
	ld	hl, #0x2d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;Source/Engine/axion_engine.c:96: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:795: __asm__("ei");
	ei
;Source/Engine/axion_engine.c:99: while(true) {
00102$:
;Source/Engine/axion_engine.c:102: transformComponent.position[0].x += 100;
	ld	hl, #(_transformComponent + 100)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0064
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_transformComponent + 100)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/axion_engine.c:103: transformComponent.position[1].x += 10;
	ld	hl, #(_transformComponent + 104)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_transformComponent + 104)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/axion_engine.c:106: RenderSprites();
	call	_RenderSprites
	jr	00102$
;Source/Engine/axion_engine.c:108: }
	add	sp, #9
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
