[org 0x0100]
		mov bx,1
		mov dx,[base]
		mov cx,[power]
outerloop:
		mov ax,0
innerloop:		
		add ax,dx
		sub bx,1
	jnz innerloop
		mov bx,[base]
		mov dx,ax
		sub cx,1
	jnz outerloop
		mov [z],ax

	mov ax,0x4c00
	int 0x21

base: dw 5
power: dw 3
z: dw 0