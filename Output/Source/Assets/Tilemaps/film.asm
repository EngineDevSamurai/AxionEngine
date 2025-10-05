;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module film
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _film
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
	.area _CODE
_film:
	.dw (_door1_tiles + 0)
	.dw (_door2_tiles + 0)
	.dw (_door3_tiles + 0)
	.dw (_door4_tiles + 0)
	.dw (_door1_tiles + 12)
	.dw (_door2_tiles + 12)
	.dw (_door3_tiles + 12)
	.dw (_door4_tiles + 12)
	.dw (_door1_tiles + 24)
	.dw (_door2_tiles + 24)
	.dw (_door3_tiles + 24)
	.dw (_door4_tiles + 24)
	.dw (_door1_tiles + 36)
	.dw (_door2_tiles + 36)
	.dw (_door3_tiles + 36)
	.dw (_door4_tiles + 36)
	.dw (_door1_tiles + 48)
	.dw (_door2_tiles + 48)
	.dw (_door3_tiles + 48)
	.dw (_door4_tiles + 48)
	.dw (_door1_tiles + 60)
	.dw (_door2_tiles + 60)
	.dw (_door3_tiles + 60)
	.dw (_door4_tiles + 60)
	.dw (_door1_tiles + 72)
	.area _INITIALIZER
	.area _CABS (ABS)
