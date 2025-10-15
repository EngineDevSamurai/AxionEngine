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
;Source/Engine/Components/transform_component.h:41: static inline vec2 getTransformPos(uint8_t entityID) {
;	---------------------------------
; Function getTransformPos
; ---------------------------------
_getTransformPos:
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/Components/transform_component.h:42: vec2 tmp = {0, 0};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/Components/transform_component.h:43: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/Components/transform_component.h:44: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/Components/transform_component.h:45: tmp = transformComponent.position[i];
	ld	de, #_transformComponent + 100
	ld	l, c
	ld	h, #0x00
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
;Source/Engine/Components/transform_component.h:46: break;
	jr	00103$
00106$:
;Source/Engine/Components/transform_component.h:43: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/Components/transform_component.h:49: return tmp;
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
;Source/Engine/Components/transform_component.h:50: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;Source/Engine/axion_engine.c:36: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
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
;Source/Engine/axion_engine.c:47: spriteComponent.flags[0] = SPRITE_FLAG_WORLD | SPRITE_VISIBLE;
	ld	hl, #_spriteComponent + 400
	ld	(hl), #0x41
;Source/Engine/axion_engine.c:50: Entity player2 =  { .ID = 2, .components = 0 }; // Write function to get next ID
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ld	(hl), #0x02
	ld	c, e
	ld	b, d
	inc	bc
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;Source/Engine/axion_engine.c:52: EntityAddComponent(&player2, TRANSFORM_COMPONENT);
	push	de
	ld	bc, #0x0001
	call	_EntityAddComponent
	pop	de
;Source/Engine/axion_engine.c:53: transformComponent.position[1].x = F12(45);
	ld	hl, #_transformComponent + 104
	ld	a, #0xd0
	ld	(hl+), a
	ld	(hl), #0x02
;Source/Engine/axion_engine.c:54: transformComponent.position[1].y = F12(95);
	ld	hl, #_transformComponent + 106
	ld	a, #0xf0
	ld	(hl+), a
	ld	(hl), #0x05
;Source/Engine/axion_engine.c:55: EntityAddComponent(&player2, SPRITE_COMPONENT);
	ld	bc, #0x0002
	call	_EntityAddComponent
;Source/Engine/axion_engine.c:56: spriteComponent.tileData[1] = smiley;
	ld	hl, #(_spriteComponent + 52)
	ld	(hl), #<(_smiley)
	inc	hl
	ld	(hl), #>(_smiley)
;Source/Engine/axion_engine.c:57: spriteComponent.width[1] = 1;
	ld	hl, #_spriteComponent + 201
	ld	(hl), #0x01
;Source/Engine/axion_engine.c:58: spriteComponent.height[1] = 1;
	ld	hl, #_spriteComponent + 251
	ld	(hl), #0x01
;Source/Engine/axion_engine.c:59: spriteComponent.flags[1] = SPRITE_FLAG_WORLD | SPRITE_VISIBLE;
	ld	hl, #_spriteComponent + 401
	ld	(hl), #0x41
;/opt/gbdk/include/gb/gb.h:811: __asm__("di");
	di
;Source/Engine/axion_engine.c:62: DISPLAY_OFF;
	call	_display_off
;Source/Engine/axion_engine.c:63: LCDC_REG = LCDCF_OFF | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_OBJON | LCDCF_BGON;
	ld	a, #0x63
	ldh	(_LCDC_REG + 0), a
;Source/Engine/axion_engine.c:78: BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;Source/Engine/axion_engine.c:81: set_bkg_data(0xFC, 0x04, std_data);
	ld	de, #_std_data
	push	de
	ld	hl, #0x4fc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;Source/Engine/axion_engine.c:82: set_bkg_data(0x00, 0x2D, bkg_data);
	ld	de, #_bkg_data
	push	de
	ld	hl, #0x2d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;Source/Engine/axion_engine.c:85: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:795: __asm__("ei");
	ei
;Source/Engine/axion_engine.c:88: while(true) {
00102$:
;Source/Engine/axion_engine.c:91: transformComponent.position[0].x += 10;
	ld	hl, #(_transformComponent + 100)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_transformComponent + 100)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;Source/Engine/axion_engine.c:94: RenderSprites();
	call	_RenderSprites
	jr	00102$
;Source/Engine/axion_engine.c:96: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
