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
;Source/Engine/ECS/../Components/transform_component.h:41: static inline vec2 getTransformPos(uint8_t entityID) {
;	---------------------------------
; Function getTransformPos
; ---------------------------------
_getTransformPos:
	add	sp, #-5
	ldhl	sp,	#4
	ld	(hl), a
;Source/Engine/ECS/../Components/transform_component.h:42: vec2 tmp = {0, 0};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/../Components/transform_component.h:43: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/ECS/../Components/transform_component.h:44: if (transformComponent.entityID[i] == entityID) {
	ld	hl, #_transformComponent
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00106$
;Source/Engine/ECS/../Components/transform_component.h:45: tmp = transformComponent.position[i];
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
;Source/Engine/ECS/../Components/transform_component.h:46: break;
	jr	00103$
00106$:
;Source/Engine/ECS/../Components/transform_component.h:43: for (uint8_t i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	e
	ld	c, e
	jr	00105$
00103$:
;Source/Engine/ECS/../Components/transform_component.h:49: return tmp;
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
;Source/Engine/ECS/../Components/transform_component.h:50: }
	add	sp, #5
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
;Source/Engine/ECS/ECS.c:39: spriteComponent.palette[nextPoolSlot] = 0;
	ld	de, #(_spriteComponent + 450)
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
;Source/Engine/ECS/ECS.c:46: }
00112$:
;Source/Engine/ECS/ECS.c:47: }
	add	sp, #11
	ret
;Source/Engine/ECS/ECS.c:50: void EntityRemoveComponent(Entity *entity, uint16_t component) {
;	---------------------------------
; Function EntityRemoveComponent
; ---------------------------------
_EntityRemoveComponent::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
;Source/Engine/ECS/ECS.c:52: entity->components &= ~component;
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
;Source/Engine/ECS/ECS.c:58: if (transformComponent.entityID[i] == entity -> ID)  {
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;Source/Engine/ECS/ECS.c:55: switch (component) {
	ld	a, c
	dec	a
	or	a, b
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x02
	or	a, b
	jr	Z, 00105$
	jp	00116$
;Source/Engine/ECS/ECS.c:56: case TRANSFORM_COMPONENT:
00101$:
;Source/Engine/ECS/ECS.c:57: for (i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	ldhl	sp,	#3
	ld	(hl), #0x00
	ld	c, #0x00
00112$:
;Source/Engine/ECS/ECS.c:58: if (transformComponent.entityID[i] == entity -> ID)  {
	ld	hl, #_transformComponent
	ld	b, #0x00
	add	hl, bc
	ld	a, (de)
	ld	b, (hl)
	sub	a, b
	jr	NZ, 00113$
;Source/Engine/ECS/ECS.c:59: vec2_set(&transformComponent.position[i], 0, 0);
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
;Source/Engine/ECS/ECS.c:60: transformComponent.entityID[i] = 0;
	ld	de, #_transformComponent
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;Source/Engine/ECS/ECS.c:61: return;
	jr	00116$
00113$:
;Source/Engine/ECS/ECS.c:57: for (i = 0; i < TRANSFORM_POOL_SIZE; i++) {
	inc	c
	ldhl	sp,	#3
	ld	a,c
	ld	(hl),a
	sub	a, #0x64
	jr	C, 00112$
;Source/Engine/ECS/ECS.c:64: break;
	jr	00116$
;Source/Engine/ECS/ECS.c:65: case SPRITE_COMPONENT:
00105$:
;Source/Engine/ECS/ECS.c:66: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	ld	bc, #0x0
00114$:
;Source/Engine/ECS/ECS.c:67: if (spriteComponent.entityID[i] == entity -> ID)  {
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
;Source/Engine/ECS/ECS.c:68: spriteComponent.entityID[i] = 0;
	ld	hl, #_spriteComponent
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:69: spriteComponent.tileData[i] = 0;
	ld	hl, #_spriteComponent + 50
	ld	a, c
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:70: spriteComponent.tileIndex[i] = 0;
	ld	hl, #_spriteComponent + 150
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:71: spriteComponent.width[i] = 0;
	ld	hl, #_spriteComponent + 200
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:72: spriteComponent.height[i] = 0;
	ld	hl, #_spriteComponent + 250
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:73: spriteComponent.offset[i].x = 0;
	ld	hl, #_spriteComponent + 300
	ld	d, #0x00
	add	hl, de
;Source/Engine/ECS/ECS.c:74: spriteComponent.offset[i].y = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;Source/Engine/ECS/ECS.c:75: spriteComponent.flags[i] = 0;
	ld	hl, #(_spriteComponent + 400)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:76: spriteComponent.palette[i] = 0;
	ld	hl, #(_spriteComponent + 450)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;Source/Engine/ECS/ECS.c:77: return;
	jr	00116$
00115$:
;Source/Engine/ECS/ECS.c:66: for (i = 0; i < SPRITE_POOL_SIZE; i++) {
	inc	b
	ld	c, b
	ld	a, b
	sub	a, #0x32
	jr	C, 00114$
;Source/Engine/ECS/ECS.c:85: }
00116$:
;Source/Engine/ECS/ECS.c:86: }
	add	sp, #6
	ret
;Source/Engine/ECS/ECS.c:89: bool EntityHasComponent(const Entity *entity, uint16_t component) {
;	---------------------------------
; Function EntityHasComponent
; ---------------------------------
_EntityHasComponent::
;Source/Engine/ECS/ECS.c:90: return (entity->components & component) != 0;
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
;Source/Engine/ECS/ECS.c:91: }
	ret
;Source/Engine/ECS/ECS.c:93: uint8_t GetNextAvailableComponentPoolSlot(uint8_t *poolPointer, uint8_t poolSize) {
;	---------------------------------
; Function GetNextAvailableComponentPoolSlot
; ---------------------------------
_GetNextAvailableComponentPoolSlot::
	dec	sp
	ld	c, a
;Source/Engine/ECS/ECS.c:95: for (i = 0; i < poolSize; i++) {
	ldhl	sp,	#0
	ld	(hl), #0x00
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, c
	jr	NC, 00103$
;Source/Engine/ECS/ECS.c:96: if (poolPointer[i] == 0) {
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;Source/Engine/ECS/ECS.c:97: return i;
	ldhl	sp,	#0
	ld	a, (hl)
	jr	00107$
00106$:
;Source/Engine/ECS/ECS.c:95: for (i = 0; i < poolSize; i++) {
	inc	b
	ldhl	sp,	#0
	ld	(hl), b
	jr	00105$
00103$:
;Source/Engine/ECS/ECS.c:100: return 255;
	ld	a, #0xff
00107$:
;Source/Engine/ECS/ECS.c:101: }
	inc	sp
	ret
;Source/Engine/ECS/ECS.c:103: Entity* getEntityById (uint8_t id) {
;	---------------------------------
; Function getEntityById
; ---------------------------------
_getEntityById::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;Source/Engine/ECS/ECS.c:104: for (int i = 0; i < MAX_ENTITIES; i++) {
	ld	bc, #0x0000
00105$:
	ld	a, c
	sub	a, #0x64
	jr	NC, 00103$
;Source/Engine/ECS/ECS.c:105: if (entity[i].ID == id) {
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
;Source/Engine/ECS/ECS.c:106: return &entity[i];
	ld	c, e
	ld	b, d
	jr	00107$
00106$:
;Source/Engine/ECS/ECS.c:104: for (int i = 0; i < MAX_ENTITIES; i++) {
	inc	bc
	jr	00105$
00103$:
;Source/Engine/ECS/ECS.c:109: return 0;
	ld	bc, #0x0000
00107$:
;Source/Engine/ECS/ECS.c:110: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
