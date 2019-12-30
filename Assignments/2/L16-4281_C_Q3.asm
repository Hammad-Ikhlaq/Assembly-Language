[org 0x0100]

mov ax,0x4c8e
mov bx,0xf0f0
and bx,ax	;preserved odd nibbles
shr bx,4

mov cx,0x0f0f
and cx,ax	;preserved even nibbles
shl cx,4

mov ax,bx
add ax,cx	
mov ax,4c00h
int 21h