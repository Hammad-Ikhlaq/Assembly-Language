[org 0x0100]

jmp start

numerator: db 25
denominator: db 13

start:
		mov ah,0
		mov al,0
		mov bh, [numerator]
comparison:
		cmp bh, [denominator]
		jae subtract
		jmp assignment

subtract:	
		sub bh,[denominator]
		add al,1
		jmp comparison
assignment:
		mov ah, bh
mov ax,0x4c00
int 21h	