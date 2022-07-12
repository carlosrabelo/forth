		org	$8000

; NEXT
;

NEXT:
		nop

; *IF
;

W_STAR_IF:
		db	$03,"*IF"
		dw	$0000
C_STAR_IF:
		dw	$+2
		jp	NEXT

; *ELSE
;

W_STAR_ELSE:
		db	$05,"*ELSE"
		dw	W_STAR_IF
C_STAR_ELSE:
		dw	$+2
		jp	NEXT

; --------------
; *END
;

W_STAR_END:
		db	$04,"*END"
		dw	W_STAR_ELSE
C_STAR_END:
		dw	$+2
		jp	NEXT

; *WHILE
;

W_STAR_WHILE:
		db	$06,"*WHILE"
		dw	W_STAR_END
C_STAR_WHILE:
		dw	$+2
		jp      NEXT

; +!
;

W_PLUS_STORE:
		db	$02,"+!"
		dw	W_STAR_WHILE
C_PLUS_STORE:
		dw	$+2
		jp	NEXT

; 1+
;

W_ONE_PLUS:
		db	$02,"1+"
		dw	W_PLUS_STORE
C_ONE_PLUS:
		dw	$+2
		jp	NEXT

; 2+
;

W_TWO_PLUS:
		db	$02,"2+"
		dw	W_ONE_PLUS
C_TWO_PLUS:
		dw	$+2
		jp	NEXT

; 1-
;

W_ONE_MINUS:
		db	$02,"1+"
		dw	W_TWO_PLUS
C_ONE_MINU:
		dw	$+2
		jp	NEXT

; 2-
;

W_TWO_MINUS:
		db	$02,"2+"
		dw	W_ONE_MINUS
C_TWO_MINUS:
		dw	$+2
		jp	NEXT

; 2*
;

W_TWO_STAR:
		db	$02,"2+"
		dw	W_TWO_MINUS
C_TWO_STAR:
		dw	$+2
		jp	NEXT

; 2/
;

W_TWO_SLASH:
		db	$02,"2+"
		dw	W_TWO_STAR
C_TWO_SLASH:
		dw	$+2
		jp	NEXT

; C"

W_C_QUOTE:
		db	$02,"C",$22
		dw	W_TWO_SLASH
C_C_QUOTE:
		dw	$+2
		jp	NEXT

; C,
;

W_C_COMMA:
		db	 $02,"C,"
		dw	W_C_QUOTE
C_C_COMMA:
		dw	$+2
		jp	NEXT

; C!

W_C_STORE:
		db	$02,"C!"
		dw	W_C_COMMA
C_CSTORE:
		dw	$+2
		jp	NEXT

; OVER
;

W_OVER:
		db	$04,"OVER"
		dw	W_C_STORE
C_OVER:
		dw	$+2
		jp	NEXT

; CR
;

W_CR:
		db	$02,"CR"
		dw	W_OVER
C_CR:
		dw	$+2
		jp	NEXT

; HERE
;

W_HERE:
		db	$04,"HERE"
		dw	W_CR
C_HERE:
		dw	$+2
		jp	NEXT
