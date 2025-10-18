;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module frame_tiles
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _frame_tiles
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
_frame_tiles:
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xfd	; 253
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x82	; 130
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0x90	; 144
	.db #0x8e	; 142
	.db #0x91	; 145
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0x92	; 146
	.db #0x8d	; 141
	.db #0x93	; 147
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x87	; 135
	.db #0x94	; 148
	.area _INITIALIZER
	.area _CABS (ABS)
