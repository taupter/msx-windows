; Input
;   IX = base addr of this process slot on RAM
;   IY = base addr of variables area of this process


    ; ld      a, 8                    ; 8th line
    ; call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix

    ld      a, (BIOS_NEWKEY + 8)

    push    af
        
        bit     7, a    ; check if right key is pressed
        jp      z, .keyPressed_Right

        bit     4, a    ; check if left key is pressed
        jp      z, .keyPressed_Left

        bit     5, a    ; check if up key is pressed
        jp      z, .keyPressed_Up

        .continue:

    pop     af

    ; update old keyboard state
    ld      (iy + TETRA_VARS.OLD_KEYBOARD_LINE_8), a

    ; do below code only at each n frames
    ; ld      a, (BIOS_JIFFY)
    ; and     0011 1111 b
    ; jp      nz, .draw
    
    ld      a, (iy + TETRA_VARS.COUNTER)
    inc     a
    ld      (iy + TETRA_VARS.COUNTER), a
    cp      90 ; game speed (eg. 30 - 90)
    jp      nz, .draw

    xor     a
    ld      (iy + TETRA_VARS.COUNTER), a

    ; ---- drop piece
    ld      d, (iy + TETRA_VARS.PIECE_X)
    ld      e, (iy + TETRA_VARS.PIECE_Y)
    inc     e
    call    .isPiecePositionValid
    ret     z
    ;jp      z, .fixPiece ; TODO

    inc     (iy + TETRA_VARS.PIECE_Y)

.draw:
    ; call "Draw" event of this process
    ld      e, (ix + PROCESS_STRUCT_IX.drawAddr)         ; process.Draw addr (low)
    ld      d, (ix + PROCESS_STRUCT_IX.drawAddr + 1)     ; process.Draw addr (high)
    call    JP_DE

    ret

; ---------

.keyPressed_Right:
    ; check if key was previously released
    ld      a, (iy + TETRA_VARS.OLD_KEYBOARD_LINE_8)
    bit     7, a ; right key
    jp      z, .continue

    ; execute key pressed code here
    call    .piece_Right

    jp      .continue

.keyPressed_Left:
    ; check if key was previously released
    ld      a, (iy + TETRA_VARS.OLD_KEYBOARD_LINE_8)
    bit     4, a ; left key
    jp      z, .continue

    ; execute key pressed code here
    call    .piece_Left

    jp      .continue

.keyPressed_Up:
    ; check if key was previously released
    ld      a, (iy + TETRA_VARS.OLD_KEYBOARD_LINE_8)
    bit     5, a ; up key
    jp      z, .continue

    ; execute key pressed code here

    ; --- rotate piece

    ; HL = TETRA_VARS.CURRENT_PIECE
    push    iy
    pop     hl
    ld      de, TETRA_VARS.CURRENT_PIECE
    add     hl, de

    push    hl
        ; DE = TETRA_VARS.CURRENT_PIECE_TEMP
        push    iy
        pop     hl
        ld      de, TETRA_VARS.CURRENT_PIECE_TEMP
        add     hl, de
        ex      de, hl
    pop     hl


    ; if (CURRENT_PIECE_TYPE == PIECE_TYPE_SQUARE) ret
    ld      a, (iy + TETRA_VARS.CURRENT_PIECE_TYPE)
    cp      TETRA_CONSTANTS.PIECE_TYPE_SQUARE
    jp      z, .continue

    push    hl, de
        call    .RotatePiece_Right

        ; check if new piece position is valid
        ld      d, (iy + TETRA_VARS.PIECE_X)
        ld      e, (iy + TETRA_VARS.PIECE_Y)
        ld      bc, TETRA_VARS.CURRENT_PIECE_TEMP
        call    .isPiecePositionValid

    pop     hl, de ; invert HL & DE
    jp      z, .continue

    ; CURRENT_PIECE = CURRENT_PIECE_TEMP
    ld      bc, 4 * 4
    ldir

    jp      .continue

; ----------

.piece_Left:

    ld      d, (iy + TETRA_VARS.PIECE_X)
    dec     d
    ld      e, (iy + TETRA_VARS.PIECE_Y)
    ld      bc, TETRA_VARS.CURRENT_PIECE
    call    .isPiecePositionValid
    ret     z

    dec     (iy + TETRA_VARS.PIECE_X)

    ret

.piece_Right:

    ld      d, (iy + TETRA_VARS.PIECE_X)
    inc     d
    ld      e, (iy + TETRA_VARS.PIECE_Y)
    ld      bc, TETRA_VARS.CURRENT_PIECE
    call    .isPiecePositionValid
    ret     z

    inc     (iy + TETRA_VARS.PIECE_X)

    ret

; Check if new piece position is valid
; Inputs:
;   BC: delta addr of 4x4 piece matrix (TETRA_VARS.CURRENT_PIECE or TETRA_VARS.CURRENT_PIECE_TEMP)
;   D: piece x
;   E: piece y
; Output:
;   Z: not valid
;   NZ: valid
.isPiecePositionValid:

    ; --- loop through all tiles of the 4x4 current piece matrix
    ; ld      bc, TETRA_VARS.CURRENT_PIECE
    push    iy ; HL = IY
    pop     hl
    add     hl, bc

    ld      b, 0 ; matrix line counter 
.isPiecePositionValid_outerLoop:
        ld      c, 0 ; matrix column counter
    .isPiecePositionValid_innerLoop:
        ; check if this matrix position position has tile or is empty
        ld      a, (hl)
        or      a
        jp      z, .isPiecePositionValid_next

        ; check if tile is inside playfield boundaries
        
        ; --- check X
        ld      a, d
        add     c

        ; if ((D + C) > 9) .return_Z
        cp      9 + 1
        jp      nc, .return_Z

        ; if ((D + C) < 0) .return_Z
        cp      0
        jp      c, .return_Z
        ; cp      -1
        ; jp      z, .return_Z

        ; --- check Y
        ; if ((E + B) >= PLAYFIELD_HEIGHT) .return_Z
        ld      a, b
        add     e
        cp      TETRA_CONSTANTS.PLAYFIELD_HEIGHT
        jp      nc, .return_Z

    .isPiecePositionValid_next:
        inc     hl ; next piece matrix position

        inc     c
        ld      a, c
        cp      4
        jp      z, .isPiecePositionValid_nextLine

        jp      .isPiecePositionValid_innerLoop


.isPiecePositionValid_nextLine:
    inc     b
    ld      a, b
    cp      4
    jp      nz, .isPiecePositionValid_outerLoop

    ; if passed by all lines and columns and not found any invalid, return valid

    ; return NZ (piece position is valid)
    xor     a
    inc     a
    ret

.return_Z:
    xor     a
    ret

; ---------------------------------

; Inputs:
;	HL: source addr (matrix of 4x4 blocks)
;	DE: destiny addr (matrix of 4x4 blocks)
.RotatePiece_Right:

    ; if (CURRENT_PIECE_TYPE == PIECE_TYPE_I) rotatePiece_4x4 else rotatePiece_3x3
    ld      a, (iy + TETRA_VARS.CURRENT_PIECE_TYPE)
    cp      TETRA_CONSTANTS.PIECE_TYPE_I
    jp      nz, .rotatePiece_3x3_Right

	; --- Rotate piece 4x4
    push	ix, iy

        ; IX: source
        ; IY: dest
		push	hl ; IX = HL
		pop	    ix
		push	de ; IY = DE
		pop	    iy

		; line 0 to column 3
        ld      bc, 3 ; IY += 3
        add     iy, bc
		call	.RotatePiece_LineToCol

        inc     c ; BC = 4

		; line 1 to column 2
        add     ix, bc ; IX += 4
		dec	    iy ; IY--
		call	.RotatePiece_LineToCol

		; line 2 to column 1
        add     ix, bc ; IX += 4
		dec	    iy ; IY--
		call	.RotatePiece_LineToCol

		; line 3 to column 0
        add     ix, bc ; IX += 4
		dec	    iy ; IY--
		call	.RotatePiece_LineToCol

	pop	    iy, ix

	ret

.rotatePiece_3x3_Right:
	; --- Rotate piece 3x3
    push	ix, iy

        ; IX: source
        ; IY: dest
		push	hl ; IX = HL
		pop	    ix
		push	de ; IY = DE
		pop	    iy

		; line 0 to column 2
        ld      bc, 2 ; IY += 2
        add     iy, bc
		call	.RotatePiece_3x3_LineToCol

        inc     c ; BC = 4
        inc     c

		; line 1 to column 1
        add     ix, bc ; IX += 4
		dec	    iy ; IY--
		call	.RotatePiece_3x3_LineToCol

		; line 2 to column 0
        add     ix, bc ; IX += 4
		dec	    iy ; IY--
		call	.RotatePiece_3x3_LineToCol

	pop	    iy, ix
    
    ; TODO:
    ; if first column is empty shift left the piece
    ; (piece should always be top-left aligned)

    ret


.RotatePiece_LineToCol:
	ld	    a, (ix + 0)
	ld	    (iy + 0), a

	ld	    a, (ix + 1)
	ld	    (iy + 4), a

	ld	    a, (ix + 2)
	ld	    (iy + 8), a

	ld	    a, (ix + 3)
	ld	    (iy + 12), a

	ret

.RotatePiece_3x3_LineToCol:
	ld	    a, (ix + 0)
	ld	    (iy + 0), a

	ld	    a, (ix + 1)
	ld	    (iy + 4), a

	ld	    a, (ix + 2)
	ld	    (iy + 8), a

	ret