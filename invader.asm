;;;
;;;Space invader in 510 bytes!! of qemu real mode x86
;;;
org 7C00h

;VGA 13 mode 320x200
mov ax, 0013h
int 10h

;vid mem
push 0A000h
pop es

; game loop
game_loop:
	mov al, 04h ; RED
	mov cx, 320*200
	xor di, di
	rep stosb
	;delay
	delay_timer:
		mov ax, [046CH] ;ticks since midnight
		inc ax
		.wait:
			cmp [046CH], ax
			jl .wait
 
jmp game_loop

;game over and reset (TODO)
game_over:
	cli
	hlt
	
times 510-($-$$) db 0
;section boot_signature start=7DFEh
;;; boot signature
dw 0AA55h
