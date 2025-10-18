;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module render_sprite_system
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getEntityById
	.globl _EntityHasComponent
	.globl _set_sprite_data
	.globl _camera
	.globl _RenderSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_oamList:
	.ds 350
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_camera::
	.ds 2
_oamCount:
	.ds 1
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:32: static inline void vec2_set(vec2 *v, int x, int y) {
;	---------------------------------
; Function vec2_set
; ---------------------------------
_vec2_set:
	ld	l, c
	ld	h, b
;Source/Engine/Systems/../Components/../Libraries/vec2.h:33: v->x = F12(x);
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:34: v->y = F12(y);
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:35: }
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/../Libraries/vec2.h:38: static inline void vec2_add(vec2 *a, const vec2 *b) {
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:39: a->x += b->x;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:40: a->y += b->y;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:41: }
	add	sp, #8
	ret
;Source/Engine/Systems/../Components/../Libraries/vec2.h:44: static inline void vec2_sub(vec2 *a, const vec2 *b) {
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:45: a->x -= b->x;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:46: a->y -= b->y;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:47: }
	add	sp, #6
	ret
;Source/Engine/Systems/../Components/../Libraries/vec2.h:50: static inline void vec2_scale(vec2 *a, f12 s) {
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:52: a->x = ((int32_t)a->x * s) >> 4;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:53: a->y = ((int32_t)a->y * s) >> 4;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:54: }
	add	sp, #14
	ret
;Source/Engine/Systems/../Components/../Libraries/vec2.h:57: static inline void vec2_copy(vec2 *dest, const vec2 *src) {
;	---------------------------------
; Function vec2_copy
; ---------------------------------
_vec2_copy:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
;Source/Engine/Systems/../Components/../Libraries/vec2.h:58: dest->x = src->x;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:59: dest->y = src->y;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:60: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/../Libraries/vec2.h:63: static inline bool vec2_equal(const vec2 *a, const vec2 *b) {
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:64: return a->x == b->x && a->y == b->y;
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
;Source/Engine/Systems/../Components/../Libraries/vec2.h:65: }
	add	sp, #8
	ret
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
;Source/Engine/Systems/../Components/transform_component.h:16: static inline vec2 getTransformPosition(uint8_t entityID) {
;	---------------------------------
; Function getTransformPosition
; ---------------------------------
_getTransformPosition:
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/Systems/../Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Systems/../Components/transform_component.h:20: result = transformComponent.position[i];
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
;Source/Engine/Systems/../Components/transform_component.h:21: return result;
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
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/transform_component.h:24: return result;
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
;Source/Engine/Systems/../Components/transform_component.h:25: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/render_sprite_system.c:24: void RenderSprites(void) {
;	---------------------------------
; Function RenderSprites
; ---------------------------------
_RenderSprites::
	add	sp, #-64
;Source/Engine/Systems/render_sprite_system.c:26: uint8_t spriteOAMIndex = 0;
	ldhl	sp,	#59
	ld	(hl), #0x00
;Source/Engine/Systems/render_sprite_system.c:28: oamCount = 0;
	xor	a, a
	ld	(#_oamCount),a
;Source/Engine/Systems/render_sprite_system.c:31: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#63
	ld	(hl), #0x00
00146$:
;Source/Engine/Systems/render_sprite_system.c:35: LocalSprite s = getLocalSprite(id);
;Source/Engine/Systems/render_sprite_system.c:31: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#63
	ld	a, (hl)
	sub	a, #0x32
	jp	NC, 00108$
;Source/Engine/Systems/render_sprite_system.c:32: uint8_t id = spriteComponent.entityID[i];
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#63
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#62
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:33: if (id == 0) continue;
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
;Source/Engine/Systems/render_sprite_system.c:35: LocalSprite s = getLocalSprite(id);
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:263: LocalSprite s = {0};
	ldhl	sp,	#2
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
	ld	(hl), #0x00
;Source/Engine/Systems/../Components/sprite_component.h:264: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#58
	ld	(hl), #0x00
;Source/Engine/Systems/render_sprite_system.c:35: LocalSprite s = getLocalSprite(id);
	ld	c, #0x00
00137$:
	ld	a, c
	sub	a, #0x32
	jp	NC, 00123$
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#62
	ld	a, (hl)
	sub	a, b
	jp	NZ, 00138$
	ld	de, #_spriteComponent
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl), a
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#58
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#62
	ld	(hl), a
	ld	de, #(_spriteComponent + 300)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #10
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#62
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #(_spriteComponent + 50)
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#63
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#62
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
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ld	de, #(_spriteComponent + 150)
	ldhl	sp,	#58
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (bc)
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#10
	ld	(hl+), a
	ld	a, (bc)
	rlca
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	(hl+), a
	inc	hl
	ld	a, (bc)
	and	a, #0x06
	ld	(hl), a
	ld	de, #0x000c
	push	de
	ld	hl, #4
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #20
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00124$
00138$:
	inc	c
	ldhl	sp,	#58
	ld	(hl), c
	jp	00137$
00123$:
	ld	de, #0x000c
	push	de
	ld	hl, #4
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #20
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
00124$:
	ld	de, #0x000c
	push	de
	ld	hl, #20
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #32
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:36: if (!s.visible) continue;
	ldhl	sp,	#39
	ld	c, (hl)
	bit	0, c
	jp	Z, 00107$
;Source/Engine/Systems/render_sprite_system.c:38: Entity *e = getEntityById(id);
	ldhl	sp,	#60
	ld	a, (hl)
	call	_getEntityById
	ld	e, c
	ld	d, b
;Source/Engine/Systems/render_sprite_system.c:39: if (!EntityHasComponent(e, TRANSFORM_COMPONENT))
	ld	bc, #0x0001
	call	_EntityHasComponent
	ld	c, a
	bit	0, c
	jp	Z, 00107$
;Source/Engine/Systems/render_sprite_system.c:42: position = getTransformPosition(id);
	ldhl	sp,	#60
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#49
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#61
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00143$:
	ldhl	sp,	#62
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00127$
;Source/Engine/Systems/../Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	de, #_transformComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#58
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00144$
;Source/Engine/Systems/../Components/transform_component.h:20: result = transformComponent.position[i];
	ldhl	sp,	#61
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #(_transformComponent + 100)
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #49
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0004
	push	hl
	call	___memcpy
	pop	de
;Source/Engine/Systems/render_sprite_system.c:21: // Renders all visible sprites from the global sprite/transform pools.
	ld	bc, #0x0004
	push	bc
	ld	c, e
	ld	b, d
	ld	hl, #44
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00128$
00144$:
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#62
	inc	(hl)
	ld	a, (hl-)
	ld	(hl), a
	jr	00143$
00127$:
;Source/Engine/Systems/../Components/transform_component.h:24: return result;
	ld	de, #0x0004
	push	de
	ld	hl, #51
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #44
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:42: position = getTransformPosition(id);
00128$:
	ld	de, #0x0004
	push	de
	ld	hl, #44
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #16
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:44: int16_t screenX = s.isWorld ? (TO_INT(position.x) - camera.x + s.offset.x)
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#57
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#58
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#53
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#62
	bit	0, (hl)
	jr	Z, 00163$
	ldhl	sp,	#58
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
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (#_camera + 0)
	ldhl	sp,#61
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#55
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#55
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#53
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl), a
	jr	00164$
00163$:
	ldhl	sp,	#57
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#58
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#53
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl), a
00164$:
	ldhl	sp,	#57
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#58
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:46: int16_t screenY = s.isWorld ? (TO_INT(position.y) - camera.y + s.offset.y)
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#53
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#62
	bit	0, (hl)
	jr	Z, 00165$
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl), a
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
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (#(_camera + 1) + 0)
	ldhl	sp,#58
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#55
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#61
	ld	a, (hl)
	ldhl	sp,	#57
	ld	(hl), a
	ldhl	sp,	#62
	ld	a, (hl)
	ldhl	sp,	#58
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#55
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#62
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#53
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl), a
	jr	00166$
00165$:
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#53
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl), a
00166$:
	ldhl	sp,	#57
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl), a
	ldhl	sp,	#58
	ld	a, (hl)
	ldhl	sp,	#62
;Source/Engine/Systems/render_sprite_system.c:50: entry.entityID = id;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#46
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:51: entry.screenX  = screenX;
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#47
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#48
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:52: entry.screenY  = screenY;
	ldhl	sp,	#61
	ld	a, (hl)
	ldhl	sp,	#49
	ld	(hl), a
	ldhl	sp,	#62
	ld	a, (hl)
	ldhl	sp,	#50
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:53: entry.orderKey = (uint16_t)((screenX << 1) | (id & 1));
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#57
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	and	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#61
	ld	a, (hl)
	ldhl	sp,	#55
	or	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,	#62
	ld	a, (hl)
	ldhl	sp,	#58
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl), a
	ldhl	sp,	#58
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#51
	ld	(hl), a
	ldhl	sp,	#62
	ld	a, (hl)
	ldhl	sp,	#52
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:55: oamList[oamCount++] = entry;
	ld	a, (_oamCount)
	ld	c, a
	ld	hl, #_oamCount
	inc	(hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_oamList
	add	hl, de
	ld	e, l
	ld	d, h
	ld	bc, #0x0007
	push	bc
	ld	hl, #48
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
00107$:
;Source/Engine/Systems/render_sprite_system.c:31: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#63
	inc	(hl)
	jp	00146$
00108$:
;Source/Engine/Systems/render_sprite_system.c:61: for (uint8_t i = 0; i < oamCount; i++) {
	ldhl	sp,	#62
	ld	(hl), #0x00
00151$:
	ldhl	sp,	#62
	ld	a, (hl)
	ld	hl, #_oamCount
	sub	a, (hl)
	jp	NC, 00112$
;Source/Engine/Systems/render_sprite_system.c:62: for (uint8_t j = i + 1; j < oamCount; j++) {
	ldhl	sp,	#62
	ld	a, (hl+)
	inc	a
	ld	(hl-), a
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_oamList
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#55
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#54
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#57
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#56
	ld	(hl), a
00148$:
	ldhl	sp,	#63
	ld	a, (hl)
	ld	hl, #_oamCount
	sub	a, (hl)
	jp	NC, 00152$
;Source/Engine/Systems/render_sprite_system.c:63: if (oamList[j].screenX < oamList[i].screenX) {
	ldhl	sp,	#63
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc, #_oamList
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#55
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00414$
	bit	7, d
	jr	NZ, 00415$
	cp	a, a
	jr	00415$
00414$:
	bit	7, d
	jr	Z, 00415$
	scf
00415$:
	jr	NC, 00149$
;Source/Engine/Systems/render_sprite_system.c:64: OAMEntry tmp = oamList[i];
	ldhl	sp,	#53
	ld	a, (hl)
	ldhl	sp,	#60
	ld	(hl), a
	ldhl	sp,	#54
	ld	a, (hl)
	ldhl	sp,	#61
	ld	(hl-), a
	ld	de, #0x0007
	push	de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #48
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:65: oamList[i] = oamList[j];
	ldhl	sp,	#57
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	push	de
	ld	bc, #0x0007
	push	bc
	ld	c, e
	ld	b, d
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	___memcpy
	pop	de
;Source/Engine/Systems/render_sprite_system.c:66: oamList[j] = tmp;
	ld	bc, #0x0007
	push	bc
	ld	hl, #48
	add	hl, sp
	ld	c, l
	ld	b, h
	call	___memcpy
00149$:
;Source/Engine/Systems/render_sprite_system.c:62: for (uint8_t j = i + 1; j < oamCount; j++) {
	ldhl	sp,	#63
	inc	(hl)
	jp	00148$
00152$:
;Source/Engine/Systems/render_sprite_system.c:61: for (uint8_t i = 0; i < oamCount; i++) {
	ldhl	sp,	#62
	inc	(hl)
	jp	00151$
00112$:
;Source/Engine/Systems/render_sprite_system.c:72: for (uint8_t n = 0; n < oamCount; n++) {
	ldhl	sp,	#60
	ld	(hl), #0x00
00160$:
	ldhl	sp,	#60
	ld	a, (hl)
	ld	hl, #_oamCount
	sub	a, (hl)
	jp	NC, 00161$
;Source/Engine/Systems/render_sprite_system.c:73: uint8_t id = oamList[n].entityID;
	ldhl	sp,	#60
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#63
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#62
	ld	(hl), a
	ld	de, #_oamList
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#55
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:263: LocalSprite s = {0};
	ldhl	sp,	#41
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
	ld	(hl), #0x00
;Source/Engine/Systems/../Components/sprite_component.h:264: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++)
	ldhl	sp,	#56
	ld	(hl), #0x00
;Source/Engine/Systems/render_sprite_system.c:74: LocalSprite s = getLocalSprite(id);
	ldhl	sp,	#63
	ld	(hl), #0x00
00140$:
	ldhl	sp,	#63
	ld	a, (hl)
	sub	a, #0x32
	jp	NC, 00131$
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#55
	ld	a, (hl)
	sub	a, c
	jp	NZ, 00141$
	ld	de, #_spriteComponent
	ldhl	sp,	#56
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#41
	ld	(hl), a
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#56
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#42
	ld	(hl), a
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#56
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#43
	ld	(hl), a
	ldhl	sp,	#56
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#63
	ld	(hl), a
	ld	de, #(_spriteComponent + 300)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #49
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#56
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#51
	ld	(hl), a
	ld	de, #(_spriteComponent + 50)
	ldhl	sp,	#63
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
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
	ldhl	sp,	#46
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#45
	ld	(hl), a
	ld	de, #(_spriteComponent + 150)
	ldhl	sp,	#56
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#46
	ld	(hl), a
	ld	a, (bc)
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#49
	ld	(hl+), a
	ld	a, (bc)
	rlca
	and	a, #0x01
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	(hl+), a
	inc	hl
	ld	a, (bc)
	and	a, #0x06
	ld	(hl), a
	ld	hl, #41
	add	hl, sp
	ld	de, #0x000c
	push	de
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00132$
00141$:
	ldhl	sp,	#63
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#56
	ld	(hl), a
	jp	00140$
00131$:
	ld	de, #0x000c
	push	de
	ld	hl, #43
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
00132$:
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #29
	add	hl, sp
	ld	de, #0x000c
	push	de
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:75: if (!s.visible) continue;
	ldhl	sp,	#38
	ld	c, (hl)
	bit	0, c
	jp	Z, 00119$
;Source/Engine/Systems/render_sprite_system.c:77: uint8_t numTiles = s.width * s.height;
	ldhl	sp,	#30
	ld	a, (hl+)
	ld	e, (hl)
;Source/Engine/Systems/render_sprite_system.c:78: set_sprite_data(spriteOAMIndex, numTiles, s.tileData);
	call	__muluchar
	ldhl	sp,	#32
	ld	a, (hl+)
	ld	b, a
	ld	h, (hl)
	ld	l, b
	push	hl
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#62
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;Source/Engine/Systems/render_sprite_system.c:80: for (uint8_t tx = 0; tx < s.width; tx++) {
	ld	de, #_oamList
	ldhl	sp,	#61
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#55
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#54
	ld	(hl), a
	ldhl	sp,	#61
	ld	(hl), #0x00
00157$:
	ldhl	sp,	#30
	ld	c, (hl)
	ldhl	sp,	#61
	ld	a, (hl)
	sub	a, c
	jp	NC, 00119$
;Source/Engine/Systems/render_sprite_system.c:81: for (uint8_t ty = 0; ty < s.height; ty++) {
	ldhl	sp,#53
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#57
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#56
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#59
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#58
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#62
	ld	(hl+), a
	ld	(hl), #0x00
00154$:
	ldhl	sp,	#31
	ld	c, (hl)
	ldhl	sp,	#63
	ld	a, (hl)
	sub	a, c
	jp	NC, 00158$
;Source/Engine/Systems/render_sprite_system.c:82: if (spriteOAMIndex >= 40) return; // Max hardware sprites
	dec	hl
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00161$
;Source/Engine/Systems/render_sprite_system.c:85: uint8_t props = SPRITE_PROPS_FROM_FLAGS(s.flags);
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#59
	ld	(hl), a
	push	hl
	bit	1, (hl)
	pop	hl
	ld	a, #0x20
	jr	NZ, 00168$
	xor	a, a
00168$:
	push	hl
	ldhl	sp,	#61
	bit	2, (hl)
	pop	hl
	ld	c, #0x40
	jr	NZ, 00170$
	ld	c, #0x00
00170$:
	or	a, c
	push	hl
	ldhl	sp,	#61
	bit	6, (hl)
	pop	hl
	ld	c, #0x80
	jr	NZ, 00172$
	ld	c, #0x00
00172$:
	or	a, c
	ld	c, a
	ldhl	sp,	#59
	ld	a, (hl)
	and	a, #0x38
	ld	e, a
	ld	d, #0x00
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	rrca
	jr	NC, 00173$
	ld	a, #0x10
	jr	00174$
00173$:
	xor	a, a
00174$:
	or	a, c
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#62
	ld	c, (hl)
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	push	hl
	ldhl	sp,	#64
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	inc	hl
	ld	(hl), e
;Source/Engine/Systems/render_sprite_system.c:91: oamList[n].screenY + ty * 8);
	ldhl	sp,#55
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#63
	ld	e, (hl)
	push	af
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	pop	af
	add	a, e
	ldhl	sp,	#59
;Source/Engine/Systems/render_sprite_system.c:90: oamList[n].screenX + tx * 8,
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#61
	ld	e, (hl)
	push	af
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	pop	af
	add	a, e
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#59
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;Source/Engine/Systems/render_sprite_system.c:92: spriteOAMIndex++;
	ldhl	sp,	#62
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#59
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:81: for (uint8_t ty = 0; ty < s.height; ty++) {
	ldhl	sp,	#63
	inc	(hl)
	jp	00154$
00158$:
;Source/Engine/Systems/render_sprite_system.c:80: for (uint8_t tx = 0; tx < s.width; tx++) {
	ldhl	sp,	#61
	inc	(hl)
	jp	00157$
00119$:
;Source/Engine/Systems/render_sprite_system.c:72: for (uint8_t n = 0; n < oamCount; n++) {
	ldhl	sp,	#60
	inc	(hl)
	jp	00160$
00161$:
;Source/Engine/Systems/render_sprite_system.c:96: }
	add	sp, #64
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__camera:
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__oamCount:
	.db #0x00	; 0
	.area _CABS (ABS)
