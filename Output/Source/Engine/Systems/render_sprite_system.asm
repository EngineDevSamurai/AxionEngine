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
	.globl _clearZIndexArray
	.globl _sortEntitiesByZIndex
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
_camera::
	.ds 2
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
;Source/Engine/Systems/../Components/sprite_component.h:60: static inline uint8_t getSpriteHeight(uint8_t entityID) {
;	---------------------------------
; Function getSpriteHeight
; ---------------------------------
_getSpriteHeight:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:61: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:62: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:63: return spriteComponent.height[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:61: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:66: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:67: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:70: static inline void setSpriteHeight(uint8_t entityID, uint8_t height) {
;	---------------------------------
; Function setSpriteHeight
; ---------------------------------
_setSpriteHeight:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:71: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:72: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:73: spriteComponent.height[i] = height;
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
;Source/Engine/Systems/../Components/sprite_component.h:74: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:71: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:77: }
	add	sp, #5
	ret
;Source/Engine/Systems/../Components/sprite_component.h:80: static inline uint8_t getSpriteZIndex(uint8_t entityID) {
;	---------------------------------
; Function getSpriteZIndex
; ---------------------------------
_getSpriteZIndex:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:81: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:82: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:83: return SPRITE_GET_Z(spriteComponent.flags[i]);
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
	and	a, #0x38
	ld	(hl), a
	swap	a
	rlca
	and	a, #0x1f
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:81: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:86: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:87: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:90: static inline vec2_i getSpriteOffset(uint8_t entityID) {
;	---------------------------------
; Function getSpriteOffset
; ---------------------------------
_getSpriteOffset:
	add	sp, #-3
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:91: vec2_i result = {0, 0};
	ld	(hl-), a
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:92: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00103$
;Source/Engine/Systems/../Components/sprite_component.h:93: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Systems/../Components/sprite_component.h:94: result = spriteComponent.offset[i];
	ld	a, c
	add	a, a
	add	a, #<((_spriteComponent + 300))
	ld	c, a
	ld	a, #0x00
	adc	a, #>((_spriteComponent + 300))
	ld	b, a
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	ld	hl, #0x0002
	push	hl
	call	___memcpy
;Source/Engine/Systems/../Components/sprite_component.h:95: return result;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:92: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:98: return result;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:99: }
	add	sp, #3
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/sprite_component.h:102: static inline bool getSpriteWorldFlag(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWorldFlag
; ---------------------------------
_getSpriteWorldFlag:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:103: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:104: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:105: return (spriteComponent.flags[i] & SPRITE_FLAG_WORLD) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:103: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:108: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:109: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:112: static inline bool getSpriteFlipX(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipX
; ---------------------------------
_getSpriteFlipX:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:113: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:114: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:115: return (spriteComponent.flags[i] & SPRITE_FLIP_X) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:113: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:118: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:119: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:122: static inline bool getSpriteFlipY(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipY
; ---------------------------------
_getSpriteFlipY:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:123: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:124: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:125: return (spriteComponent.flags[i] & SPRITE_FLIP_Y) != 0;
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
;Source/Engine/Systems/../Components/sprite_component.h:123: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:128: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:129: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:132: static inline bool getSpriteVisible(uint8_t entityID) {
;	---------------------------------
; Function getSpriteVisible
; ---------------------------------
_getSpriteVisible:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:134: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:135: return (spriteComponent.flags[i] & SPRITE_VISIBLE) != 0;
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
	and	a, #0x40
	ld	(hl), a
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:133: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:138: return false;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:139: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:142: static inline uint8_t getSpriteFlipProps(uint8_t entityID) {
;	---------------------------------
; Function getSpriteFlipProps
; ---------------------------------
_getSpriteFlipProps:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:143: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:144: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:145: return spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y);
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
	and	a, #0x06
	ld	(hl), a
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:143: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:148: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:149: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:152: static inline LocalSprite getLocalSprite(uint8_t entityID) {
;	---------------------------------
; Function getLocalSprite
; ---------------------------------
_getLocalSprite:
	add	sp, #-15
	ldhl	sp,	#14
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:153: LocalSprite s = {0};  // Initialize everything to zero / NULL
	ldhl	sp,	#0
	xor	a, a
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
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), #0x00
;Source/Engine/Systems/../Components/sprite_component.h:154: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#13
	ld	(hl), #0x00
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x32
	jp	NC, 00103$
;Source/Engine/Systems/../Components/sprite_component.h:155: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, b
	jp	NZ, 00106$
;Source/Engine/Systems/../Components/sprite_component.h:156: s.id        = spriteComponent.entityID[i];
	ld	de, #_spriteComponent
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:157: s.width     = spriteComponent.width[i];
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:158: s.height    = spriteComponent.height[i];
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:159: s.offset    = spriteComponent.offset[i];
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
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
	ld	hl, #5
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/../Components/sprite_component.h:160: s.flags     = spriteComponent.flags[i];
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:161: s.tileData  = spriteComponent.tileData[i];
	ld	bc, #_spriteComponent + 50
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/Systems/../Components/sprite_component.h:162: s.isWorld   = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	and	a, #0x01
	ld	c, a
	ldhl	sp,	#5
	ld	(hl), c
;Source/Engine/Systems/../Components/sprite_component.h:163: s.visible   = spriteComponent.flags[i] & SPRITE_VISIBLE;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	rlca
	rlca
	and	a, #0x01
	ld	c, a
	ldhl	sp,	#6
	ld	(hl), c
;Source/Engine/Systems/../Components/sprite_component.h:164: s.flipProps = spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y);
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	and	a, #0x06
	ldhl	sp,	#10
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:165: return s;
	ldhl	sp,	#17
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
	ld	a, (hl)
	ld	(bc), a
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:154: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	c
	ldhl	sp,	#13
	ld	(hl), c
	jp	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:169: s.visible = false;
	ldhl	sp,	#6
	ld	(hl), #0x00
;Source/Engine/Systems/../Components/sprite_component.h:170: return s;
	ldhl	sp,	#17
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
	ld	a, (hl)
	ld	(bc), a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:171: }
	add	sp, #15
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/sprite_component.h:176: static inline void setSpriteZIndex(uint8_t entityID, uint8_t z) {
;	---------------------------------
; Function setSpriteZIndex
; ---------------------------------
_setSpriteZIndex:
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:177: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:178: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:179: spriteComponent.flags[i] = SPRITE_SET_Z(spriteComponent.flags[i], z);
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
	add	a, a
	add	a, a
	add	a, a
	and	a, #0x38
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
;Source/Engine/Systems/../Components/sprite_component.h:180: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:177: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl-)
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:183: }
	add	sp, #7
	ret
;Source/Engine/Systems/../Components/sprite_component.h:186: static inline void setSpriteWorldFlag(uint8_t entityID, bool isWorld) {
;	---------------------------------
; Function setSpriteWorldFlag
; ---------------------------------
_setSpriteWorldFlag:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:187: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:188: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:190: spriteComponent.flags[i] |= SPRITE_FLAG_WORLD;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:189: if (isWorld) {
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:190: spriteComponent.flags[i] |= SPRITE_FLAG_WORLD;
	set	0, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:192: spriteComponent.flags[i] &= ~SPRITE_FLAG_WORLD;
	res	0, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:194: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:187: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:197: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:200: static inline void setSpriteFlipX(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipX
; ---------------------------------
_setSpriteFlipX:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:201: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:202: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:204: spriteComponent.flags[i] |= SPRITE_FLIP_X;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:203: if (flip) {
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:204: spriteComponent.flags[i] |= SPRITE_FLIP_X;
	set	1, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:206: spriteComponent.flags[i] &= ~SPRITE_FLIP_X;
	res	1, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:208: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:201: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:211: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:214: static inline void setSpriteFlipY(uint8_t entityID, bool flip) {
;	---------------------------------
; Function setSpriteFlipY
; ---------------------------------
_setSpriteFlipY:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:215: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:216: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:218: spriteComponent.flags[i] |= SPRITE_FLIP_Y;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:217: if (flip) {
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:218: spriteComponent.flags[i] |= SPRITE_FLIP_Y;
	set	2, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:220: spriteComponent.flags[i] &= ~SPRITE_FLIP_Y;
	res	2, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:222: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:215: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:225: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:228: static inline void setSpriteVisible(uint8_t entityID, bool visible) {
;	---------------------------------
; Function setSpriteVisible
; ---------------------------------
_setSpriteVisible:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;Source/Engine/Systems/../Components/sprite_component.h:229: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	b, #0x00
	ld	e, b
00108$:
	ld	a, e
	sub	a, #0x32
	jr	NC, 00110$
;Source/Engine/Systems/../Components/sprite_component.h:230: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00109$
;Source/Engine/Systems/../Components/sprite_component.h:232: spriteComponent.flags[i] |= SPRITE_VISIBLE;
	ld	a, #<((_spriteComponent + 400))
	add	a, b
	ld	e, a
	ld	a, #>((_spriteComponent + 400))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;Source/Engine/Systems/../Components/sprite_component.h:231: if (visible) {
	bit	0, c
	jr	Z, 00102$
;Source/Engine/Systems/../Components/sprite_component.h:232: spriteComponent.flags[i] |= SPRITE_VISIBLE;
	set	6, a
	ld	(de), a
	jr	00110$
00102$:
;Source/Engine/Systems/../Components/sprite_component.h:234: spriteComponent.flags[i] &= ~SPRITE_VISIBLE;
	res	6, a
	ld	(de), a
;Source/Engine/Systems/../Components/sprite_component.h:236: return;
	jr	00110$
00109$:
;Source/Engine/Systems/../Components/sprite_component.h:229: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	e
	ld	b, e
	jr	00108$
00110$:
;Source/Engine/Systems/../Components/sprite_component.h:239: }
	inc	sp
	ret
;Source/Engine/Systems/../Components/sprite_component.h:242: static inline void setSpriteOffset(uint8_t entityID, vec2_i newOffset) {
;	---------------------------------
; Function setSpriteOffset
; ---------------------------------
_setSpriteOffset:
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:243: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	e, #0x00
	ld	c, e
00105$:
	ld	a, c
	sub	a, #0x32
	jr	NC, 00107$
;Source/Engine/Systems/../Components/sprite_component.h:244: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Systems/../Components/sprite_component.h:245: spriteComponent.offset[i] = newOffset;
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
;Source/Engine/Systems/../Components/sprite_component.h:246: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:243: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	c
	ld	e, c
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:249: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/Systems/../Components/sprite_component.h:252: static inline uint8_t getSpriteWidth(uint8_t entityID) {
;	---------------------------------
; Function getSpriteWidth
; ---------------------------------
_getSpriteWidth:
	add	sp, #-4
	ldhl	sp,	#2
;Source/Engine/Systems/../Components/sprite_component.h:253: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:254: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:255: return spriteComponent.width[i];
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
;Source/Engine/Systems/../Components/sprite_component.h:253: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	jr	00105$
00103$:
;Source/Engine/Systems/../Components/sprite_component.h:258: return 0;
	xor	a, a
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:259: }
	add	sp, #4
	ret
;Source/Engine/Systems/../Components/sprite_component.h:262: static inline void setSpriteWidth(uint8_t entityID, uint8_t width) {
;	---------------------------------
; Function setSpriteWidth
; ---------------------------------
_setSpriteWidth:
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl-), a
;Source/Engine/Systems/../Components/sprite_component.h:263: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
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
;Source/Engine/Systems/../Components/sprite_component.h:264: if (spriteComponent.entityID[i] == entityID) {
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
;Source/Engine/Systems/../Components/sprite_component.h:265: spriteComponent.width[i] = width;
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
;Source/Engine/Systems/../Components/sprite_component.h:266: return;
	jr	00107$
00106$:
;Source/Engine/Systems/../Components/sprite_component.h:263: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	jr	00105$
00107$:
;Source/Engine/Systems/../Components/sprite_component.h:269: }
	add	sp, #5
	ret
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
;Source/Engine/Systems/render_sprite_system.c:11: void RenderSprites(void) {
;	---------------------------------
; Function RenderSprites
; ---------------------------------
_RenderSprites::
	add	sp, #-57
;Source/Engine/Systems/render_sprite_system.c:19: uint8_t spriteOAMIndex = 0;
	ldhl	sp,	#53
	ld	(hl), #0x00
;Source/Engine/Systems/render_sprite_system.c:25: spriteCount = sortEntitiesByZIndex();
	call	_sortEntitiesByZIndex
	ldhl	sp,	#47
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:28: for (uint8_t i = 0; i < spriteCount; i++) {
	ldhl	sp,	#54
	ld	(hl), #0x00
00134$:
	ldhl	sp,	#54
	ld	a, (hl)
	ldhl	sp,	#47
	sub	a, (hl)
	jp	NC, 00136$
;Source/Engine/Systems/render_sprite_system.c:29: id = spriteIDByZIndex[i];
	ld	de, #_spriteIDByZIndex
	ldhl	sp,	#54
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#50
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:30: e = getEntityById(id);
	ld	a, (hl)
	call	_getEntityById
	ldhl	sp,	#51
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/Systems/render_sprite_system.c:32: s = getLocalSprite(id);
	ldhl	sp,	#50
	ld	a, (hl)
	ldhl	sp,	#56
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:153: LocalSprite s = {0};  // Initialize everything to zero / NULL
	ldhl	sp,	#0
	xor	a, a
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
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), #0x00
;Source/Engine/Systems/../Components/sprite_component.h:154: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#55
	ld	(hl), #0x00
	ld	c, #0x00
00122$:
	ld	a, c
	sub	a, #0x32
	jp	NC, 00112$
;Source/Engine/Systems/../Components/sprite_component.h:155: if (spriteComponent.entityID[i] == entityID) {
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, b
	jp	NZ, 00123$
;Source/Engine/Systems/../Components/sprite_component.h:156: s.id        = spriteComponent.entityID[i];
	ld	de, #_spriteComponent
	ldhl	sp,	#55
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:157: s.width     = spriteComponent.width[i];
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#55
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:158: s.height    = spriteComponent.height[i];
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#55
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:159: s.offset    = spriteComponent.offset[i];
	ldhl	sp,	#55
	ld	a, (hl+)
	add	a, a
	ld	(hl), a
	ld	de, #(_spriteComponent + 300)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #3
	add	hl, sp
	ld	de, #0x0002
	push	de
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/../Components/sprite_component.h:160: s.flags     = spriteComponent.flags[i];
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#55
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#7
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:161: s.tileData  = spriteComponent.tileData[i];
	ldhl	sp,	#56
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #(_spriteComponent + 50)
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#57
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#56
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
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:162: s.isWorld   = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
	ld	a, (bc)
	and	a, #0x01
	ldhl	sp,	#5
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:163: s.visible   = spriteComponent.flags[i] & SPRITE_VISIBLE;
	ld	a, (bc)
	rlca
	rlca
	and	a, #0x01
	ldhl	sp,	#6
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:164: s.flipProps = spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y);
	ld	a, (bc)
	and	a, #0x06
	ldhl	sp,	#10
	ld	(hl), a
;Source/Engine/Systems/../Components/sprite_component.h:165: return s;
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #28
	add	hl, sp
	ld	de, #0x000b
	push	de
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00113$
00123$:
;Source/Engine/Systems/../Components/sprite_component.h:154: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	c
	ldhl	sp,	#55
	ld	(hl), c
	jp	00122$
00112$:
;Source/Engine/Systems/../Components/sprite_component.h:169: s.visible = false;
	ldhl	sp,	#6
;Source/Engine/Systems/../Components/sprite_component.h:170: return s;
	ld	de, #0x000b
	ld	(hl), d
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #30
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:32: s = getLocalSprite(id);
00113$:
	ld	de, #0x000b
	push	de
	ld	hl, #30
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #19
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:34: if (id != 0 && s.visible &&
	ldhl	sp,	#50
	ld	a, (hl)
	or	a, a
	jp	Z, 00135$
	ldhl	sp,	#23
	ld	c, (hl)
	bit	0, c
	jp	Z, 00135$
;Source/Engine/Systems/render_sprite_system.c:35: EntityHasComponent(e, TRANSFORM_COMPONENT)) {
	ld	bc, #0x0001
	ldhl	sp,	#51
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_EntityHasComponent
	ld	c, a
	bit	0, c
	jp	Z, 00135$
;Source/Engine/Systems/render_sprite_system.c:38: position = getTransformPosition(id);
	ldhl	sp,	#50
	ld	a, (hl)
	ldhl	sp,	#55
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#43
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#52
	ld	(hl), #0x00
	ldhl	sp,	#56
	ld	(hl), #0x00
00125$:
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00116$
;Source/Engine/Systems/../Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	de, #_transformComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#55
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
;Source/Engine/Systems/../Components/transform_component.h:20: result = transformComponent.position[i];
	ldhl	sp,	#52
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
	ld	hl, #43
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0004
	push	hl
	call	___memcpy
	pop	de
;Source/Engine/Systems/render_sprite_system.c:21: uint8_t tileDataIndex = 0;
	ld	hl, #39
	add	hl, sp
	ld	bc, #0x0004
	push	bc
	ld	c, e
	ld	b, d
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00117$
00126$:
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#56
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#52
	ld	(hl), a
	jr	00125$
00116$:
;Source/Engine/Systems/../Components/transform_component.h:24: return result;
	ld	hl, #43
	add	hl, sp
	ld	de, #0x0004
	push	de
	ld	c, l
	ld	b, h
	ld	hl, #41
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:38: position = getTransformPosition(id);
00117$:
	ld	de, #0x0004
	push	de
	ld	hl, #41
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #13
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:41: int16_t screenX = s.isWorld ? (TO_INT(position.x) - camera.x + s.offset.x) : position.x + s.offset.x;
	ldhl	sp,	#22
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#55
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#56
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#51
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	bit	0, c
	jr	Z, 00138$
	ldhl	sp,	#56
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
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, (hl+)
	ld	b, (hl)
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
	ldhl	sp,	#51
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	b, l
	jr	00139$
00138$:
	ldhl	sp,	#55
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#51
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	b, l
00139$:
	ldhl	sp,	#48
	ld	(hl), b
;Source/Engine/Systems/render_sprite_system.c:42: int16_t screenY = s.isWorld ? (TO_INT(position.y) - camera.y + s.offset.y) : position.y + s.offset.y;
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#51
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	bit	0, c
	jr	Z, 00140$
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, (#(_camera + 1) + 0)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#51
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	jr	00141$
00140$:
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#55
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#56
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#51
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
00141$:
	ldhl	sp,	#49
	ld	(hl), c
;Source/Engine/Systems/render_sprite_system.c:44: uint8_t numTiles = s.width * s.height;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
;Source/Engine/Systems/render_sprite_system.c:45: set_sprite_data(spriteOAMIndex, numTiles, s.tileData);
	call	__muluchar
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	b, a
	ld	h, (hl)
	ld	l, b
	push	hl
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#56
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;Source/Engine/Systems/render_sprite_system.c:49: for (uint8_t tx = 0; tx < s.width; tx++) {
	ldhl	sp,	#55
	ld	(hl), #0x00
00131$:
	ldhl	sp,	#18
	ld	c, (hl)
	ldhl	sp,	#55
	ld	a, (hl)
	sub	a, c
	jp	NC, 00135$
;Source/Engine/Systems/render_sprite_system.c:50: for (uint8_t ty = 0; ty < s.height; ty++) {
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#56
	ld	(hl), a
	ld	c, #0x00
00128$:
	ldhl	sp,	#19
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00132$
;Source/Engine/Systems/render_sprite_system.c:51: if (spriteOAMIndex >= 40) return; // Max hardware sprites
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x28
	jr	NC, 00136$
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#56
	ld	b, (hl)
	xor	a, a
	sla	b
	adc	a, a
	sla	b
	adc	a, a
	ldhl	sp,	#50
	ld	(hl), b
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#56
	ld	a, (hl)
	ld	(de), a
;Source/Engine/Systems/render_sprite_system.c:55: set_sprite_prop(spriteOAMIndex, s.flipProps);
	ldhl	sp,	#27
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	de, #_shadow_OAM
	ldhl	sp,	#50
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;Source/Engine/Systems/render_sprite_system.c:56: move_sprite(spriteOAMIndex, screenX + tx * 8, screenY + ty * 8);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#49
	add	a, (hl)
	ldhl	sp,	#52
	ld	(hl), a
	ldhl	sp,	#55
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#48
	add	a, (hl)
	ldhl	sp,	#53
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	ldhl	sp,	#50
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#52
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;Source/Engine/Systems/render_sprite_system.c:57: spriteOAMIndex++;
	ldhl	sp,	#56
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#53
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:50: for (uint8_t ty = 0; ty < s.height; ty++) {
	inc	c
	jr	00128$
00132$:
;Source/Engine/Systems/render_sprite_system.c:49: for (uint8_t tx = 0; tx < s.width; tx++) {
	ldhl	sp,	#55
	inc	(hl)
	jp	00131$
00135$:
;Source/Engine/Systems/render_sprite_system.c:28: for (uint8_t i = 0; i < spriteCount; i++) {
	ldhl	sp,	#54
	inc	(hl)
	jp	00134$
00136$:
;Source/Engine/Systems/render_sprite_system.c:62: }
	add	sp, #57
	ret
;Source/Engine/Systems/render_sprite_system.c:65: void clearZIndexArray(void) {
;	---------------------------------
; Function clearZIndexArray
; ---------------------------------
_clearZIndexArray::
;Source/Engine/Systems/render_sprite_system.c:67: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	c, #0x00
00102$:
;Source/Engine/Systems/render_sprite_system.c:68: spriteIDByZIndex[i] = 0;
	ld	hl, #_spriteIDByZIndex
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/Systems/render_sprite_system.c:67: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	c
	ld	a, c
	sub	a, #0x32
	jr	C, 00102$
;Source/Engine/Systems/render_sprite_system.c:70: }
	ret
;Source/Engine/Systems/render_sprite_system.c:73: uint8_t sortEntitiesByZIndex(void) {
;	---------------------------------
; Function sortEntitiesByZIndex
; ---------------------------------
_sortEntitiesByZIndex::
	add	sp, #-3
;Source/Engine/Systems/render_sprite_system.c:74: clearZIndexArray();
	call	_clearZIndexArray
;Source/Engine/Systems/render_sprite_system.c:76: entityCount = 0;
;Source/Engine/Systems/render_sprite_system.c:77: for (zIndex = 0; zIndex < 8; zIndex++) {
	ld	e, #0x00
	ld	c, e
;Source/Engine/Systems/render_sprite_system.c:78: for (entityID = 0; entityID < SPRITE_POOL_SIZE; entityID++) {
00112$:
	ld	b, e
	ldhl	sp,	#2
	ld	(hl), #0x00
00105$:
;Source/Engine/Systems/render_sprite_system.c:79: if (SPRITE_GET_Z(spriteComponent.flags[entityID]) == zIndex) {
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	and	a, #0x38
	swap	a
	rlca
	and	a, #0x1f
	sub	a, c
	jr	NZ, 00106$
;Source/Engine/Systems/render_sprite_system.c:80: spriteIDByZIndex[entityCount] = spriteComponent.entityID[entityID];
	ld	de, #_spriteIDByZIndex
	ld	l, b
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	de, #_spriteComponent
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:81: entityCount++;
	inc	b
00106$:
;Source/Engine/Systems/render_sprite_system.c:78: for (entityID = 0; entityID < SPRITE_POOL_SIZE; entityID++) {
	ldhl	sp,	#2
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x32
	jr	C, 00105$
;Source/Engine/Systems/render_sprite_system.c:77: for (zIndex = 0; zIndex < 8; zIndex++) {
	ld	e, b
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C, 00112$
;Source/Engine/Systems/render_sprite_system.c:85: return entityCount;
	ld	a, b
;Source/Engine/Systems/render_sprite_system.c:86: }
	add	sp, #3
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__camera:
	.db #0x00	;  0
	.db #0x00	;  0
	.area _CABS (ABS)
