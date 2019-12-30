[org 0x0100]

mov ax,0x4c8e
mov bx,0xaaaa
and bx,ax	;preserved odd bits
shr bx,1

mov cx,0x5555
and cx,ax	;preserved even bits
shl cx,1

mov ax,bx
add ax,cx	
mov ax,4c00h
int 21h