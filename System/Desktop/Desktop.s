_DRAW_TASKBAR:

;     ld      hl, OS.mouseSpriteAttributes
;     ld      c, PORT_0
;     ld      b, 8
; .loop_1:
;     outi
;     jp      nz, .loop_1 ; this uses exactly 29 cycles (t-states)

;     ; draw taskbar top
;     ld      hl, NAMTBL + (32 * 22)
;     call    BIOS_SETWRT
;     ld      c, PORT_0
;     ld      b, 32
; .loop:
;     ld      a, TILE_TASKBAR_TOP ; looks like waste, but it is necessary to keep 29 states apart from consecutive OUT's
;     out     (c), a
;     djnz    .loop

;     ; draw empty black tiles on the last line of screen
;     ld      hl, NAMTBL + (32 * 23)      ; start of last line of screen
;     call    BIOS_SETWRT
;     ld      c, PORT_0
;     ld      b, 32
; .loop_1:
;     ld      a, b
;     cp      31                          ; check if it is the second column
;     ld      a, TILE_EMPTY_BLACK
;     jp      nz, .tile_empty
;     ld      a, TILE_HOME_ICON
; .tile_empty:
;     out     (c), a
;     djnz    .loop_1

    ; TODO:
    ; draw system time on right of taskbar

    ; draw tasKbar
    ld		hl, TASKBAR             ; RAM address (source)
    ld		de, NAMTBL + (32 * 22)  ; VRAM address (destiny)
    ld		bc, 64	                ; Block length
    call 	BIOS_LDIRVM        	    ; Block transfer to VRAM from memory

    ret

TASKBAR:
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP
    db TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP, TILE_TASKBAR_TOP

    db TILE_EMPTY_BLACK, TILE_HOME_ICON, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK
    db TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK, TILE_EMPTY_BLACK