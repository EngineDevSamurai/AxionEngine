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
;Source/Engine/Systems/render_sprite_system.c:10: void RenderSprites(void) {
;	---------------------------------
; Function RenderSprites
; ---------------------------------
_RenderSprites::
	add	sp, #-32
;Source/Engine/Systems/render_sprite_system.c:18: uint8_t spriteOAMIndex = 0;
	ldhl	sp,	#27
;Source/Engine/Systems/render_sprite_system.c:23: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00127$:
	ldhl	sp,	#28
	ld	a, (hl)
	sub	a, #0x32
	jp	NC, 00129$
;Source/Engine/Systems/render_sprite_system.c:24: id = spriteComponent.entityID[i];
	ld	de, #_spriteComponent
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#31
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:25: e = getEntityById(id);
	ld	a, (hl)
	call	_getEntityById
;Source/Engine/Systems/render_sprite_system.c:26: if (id != 0 &&
	ldhl	sp,	#31
	ld	a, (hl)
	or	a, a
	jp	Z, 00128$
;Source/Engine/Systems/render_sprite_system.c:27: (spriteComponent.flags[i] & SPRITE_VISIBLE) &&
	ld	de, #(_spriteComponent + 400)
	ldhl	sp,	#28
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	6, a
	jp	Z, 00128$
;Source/Engine/Systems/render_sprite_system.c:28: EntityHasComponent(id, TRANSFORM_COMPONENT)) {
	ldhl	sp,	#31
	ld	e, (hl)
	xor	a, a
	ld	bc, #0x0001
	ld	d, a
	call	_EntityHasComponent
	ld	c, a
	bit	0, c
	jp	Z, 00128$
;Source/Engine/Systems/render_sprite_system.c:31: position = getTransformPosition(id);
;Source/Engine/Systems/../Components/transform_component.h:17: vec2 result = {0, 0};
	xor	a, a
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00118$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00112$
;Source/Engine/Systems/../Components/transform_component.h:19: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00119$
;Source/Engine/Systems/../Components/transform_component.h:20: result = transformComponent.position[i];
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #(_transformComponent + 100)
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #12
	add	hl, sp
	push	hl
	ld	de, #0x0004
	push	de
	ld	e, l
	ld	d, h
	call	___memcpy
	pop	hl
;Source/Engine/Systems/render_sprite_system.c:21: int tileDataIndex = 0;
	ld	de, #0x0004
	push	de
	ld	c, l
	ld	b, h
	ld	hl, #10
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	jr	00113$
00119$:
;Source/Engine/Systems/../Components/transform_component.h:18: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00118$
00112$:
;Source/Engine/Systems/../Components/transform_component.h:24: return result;
	ld	hl, #12
	add	hl, sp
	ld	de, #0x0004
	push	de
	ld	c, l
	ld	b, h
	ld	hl, #10
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:31: position = getTransformPosition(id);
00113$:
	ld	de, #0x0004
	push	de
	ld	hl, #10
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:35: offset = spriteComponent.offset[i];
	ld	bc, #_spriteComponent + 300
	ldhl	sp,	#28
	ld	a, (hl+)
	inc	hl
	add	a, a
	ld	(hl), a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #8
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;Source/Engine/Systems/render_sprite_system.c:38: isWorld = spriteComponent.flags[i] & SPRITE_FLAG_WORLD;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	and	a, #0x01
	ldhl	sp,	#29
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:39: int16_t screenX = isWorld ? (TO_INT(position.x) - camera.x + offset.x) : position.x + offset.x;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#29
	bit	0, (hl)
	jr	Z, 00131$
	ldhl	sp,	#26
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
	ldhl	sp,#29
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#19
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#24
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
	jr	00132$
00131$:
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
00132$:
	ldhl	sp,	#25
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:40: int16_t screenY = isWorld ? (TO_INT(position.y) - camera.y + offset.y) : position.y + offset.y;
	ldhl	sp,	#31
	bit	0, (hl)
	jr	Z, 00133$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#26
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
	ldhl	sp,#31
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
	jr	00134$
00133$:
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#25
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#26
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
00134$:
	ldhl	sp,	#25
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:42: uint8_t numTiles = spriteComponent.width[i] * spriteComponent.height[i];
	ld	de, #(_spriteComponent + 200)
	ldhl	sp,	#28
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl), a
	ld	de, #(_spriteComponent + 250)
	ldhl	sp,	#28
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, c
;Source/Engine/Systems/render_sprite_system.c:43: set_sprite_data(spriteOAMIndex, numTiles, spriteComponent.tileData[i]);
	call	__muluchar
	ldhl	sp,	#31
	ld	(hl), c
	ld	de, #(_spriteComponent + 50)
	ldhl	sp,	#30
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#33
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#30
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;Source/Engine/Systems/render_sprite_system.c:47: for (uint8_t tx = 0; tx < spriteComponent.width[i]; tx++) {
	ldhl	sp,	#29
	ld	(hl), #0x00
00124$:
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, c
	jp	NC, 00128$
;Source/Engine/Systems/render_sprite_system.c:48: for (uint8_t ty = 0; ty < spriteComponent.height[i]; ty++) {
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl+), a
	ld	(hl), #0x00
00121$:
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, c
	jp	NC, 00125$
;Source/Engine/Systems/render_sprite_system.c:49: if (spriteOAMIndex >= 40) return; // Max hardware sprites
	dec	hl
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00129$
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#30
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#30
	ld	a, (hl)
	ld	(bc), a
;Source/Engine/Systems/render_sprite_system.c:53: set_sprite_prop(spriteOAMIndex, spriteComponent.flags[i] & (SPRITE_FLIP_X | SPRITE_FLIP_Y));
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	and	a, #0x06
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
;Source/Engine/Systems/render_sprite_system.c:55: move_sprite(spriteOAMIndex, screenX + tx * 8, screenY + ty * 8);
	ldhl	sp,	#31
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#19
	add	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#29
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#18
	add	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#28
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#27
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#24
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,#26
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
	ldhl	sp,	#25
	ld	a, (hl)
	ld	(de), a
;Source/Engine/Systems/render_sprite_system.c:56: spriteOAMIndex++;
	ldhl	sp,	#30
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
;Source/Engine/Systems/render_sprite_system.c:48: for (uint8_t ty = 0; ty < spriteComponent.height[i]; ty++) {
	ldhl	sp,	#31
	inc	(hl)
	jp	00121$
00125$:
;Source/Engine/Systems/render_sprite_system.c:47: for (uint8_t tx = 0; tx < spriteComponent.width[i]; tx++) {
	ldhl	sp,	#29
	inc	(hl)
	jp	00124$
00128$:
;Source/Engine/Systems/render_sprite_system.c:23: for (uint8_t i = 0; i < SPRITE_POOL_SIZE; i++) {
	ldhl	sp,	#28
	inc	(hl)
	jp	00127$
00129$:
;Source/Engine/Systems/render_sprite_system.c:61: }
	add	sp, #32
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__camera:
	.db #0x00	;  0
	.db #0x00	;  0
	.area _CABS (ABS)
