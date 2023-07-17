
; .PLAYFIELD_TILES:

;     db TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY, TILE_EMPTY
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
;     db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK

.TILE_pattern:
    db 00000000 b
    db 01111111 b
    db 01111111 b
    db 01111111 b
    db 01111111 b
    db 01111111 b
    db 01111111 b
    db 01111111 b

.TILE_BLUE_colors:
    db 0x47
    db 0x47
    db 0x47
    db 0x47
    db 0x47
    db 0x47
    db 0x47
    db 0x47

.TILE_RED_colors:
    db 0x89
    db 0x89
    db 0x89
    db 0x89
    db 0x89
    db 0x89
    db 0x89
    db 0x89

; -------------

.PIECE_SQUARE:
    db  1, 1, 0, 0
    db  1, 1, 0, 0
    db  0, 0, 0, 0
    db  0, 0, 0, 0

.PIECE_I:
    db  1, 0, 0, 0
    db  1, 0, 0, 0
    db  1, 0, 0, 0
    db  1, 0, 0, 0

.PIECE_L:
    db  1, 0, 0, 0
    db  1, 0, 0, 0
    db  1, 1, 0, 0
    db  0, 0, 0, 0

.PIECE_J:
    db  0, 1, 0, 0
    db  0, 1, 0, 0
    db  1, 1, 0, 0
    db  0, 0, 0, 0

.PIECE_T:
    db  0, 1, 0, 0
    db  1, 1, 1, 0
    db  0, 0, 0, 0
    db  0, 0, 0, 0

.PIECE_Z:
    db  0, 1, 0, 0
    db  1, 1, 0, 0
    db  1, 0, 0, 0
    db  0, 0, 0, 0

.PIECE_S:
    db  1, 0, 0, 0
    db  1, 1, 0, 0
    db  0, 1, 0, 0
    db  0, 0, 0, 0


; -------------------------

TETRA_VARS:
    .CURRENT_PIECE:         equ 0   ; 4 * 4 = 16 bytes
    .PIECE_X:               equ 16  ; 1 byte
    .PIECE_Y:               equ 17  ; 1 byte
    .OLD_KEYBOARD_LINE_8:   equ 18  ; 1 byte
    .COUNTER:               equ 19  ; 1 byte
    .CURRENT_PIECE_TYPE:    equ 20  ; 1 byte
    
    ; TODO: wasted space here

    .PLAYFIELD:             equ 40  ; 10 * 20 = 200 bytes ; TODO: if TETRA_CONSTANTS.PLAYFIELD_HEIGHT is less than 20, there will be some bytes wasted here
    
    .PLAYFIELD_BUFFER:      equ 240 ; 10 * 20 = 200 bytes
    
    .CURRENT_PIECE_TEMP:    equ 440 ; 4 * 4 = 16 bytes

;--------------------------

TETRA_CONSTANTS:
    .PLAYFIELD_WIDTH:       equ 10
    .PLAYFIELD_HEIGHT:      equ 18

    .PIECE_TYPE_SQUARE:     equ 0
    .PIECE_TYPE_I:          equ 1
    .PIECE_TYPE_L:          equ 2
    .PIECE_TYPE_J:          equ 3
    .PIECE_TYPE_T:          equ 4
    .PIECE_TYPE_Z:          equ 5
    .PIECE_TYPE_S:          equ 6
