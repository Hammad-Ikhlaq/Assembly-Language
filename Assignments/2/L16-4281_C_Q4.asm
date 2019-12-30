[org 0x0100]

mov dx,-1
mov cx,1
mov bx,0x4cef
mov ax,bx
looping:
cmp bx,0
je comp

add dx,1
shr bx,1
jc looping
jmp exception

exception:
sub dx,1
jmp looping

comp:
dec dx
xor ax,cx
shl cx,1
cmp dx,-1
je exit
jmp comp
exit:	
mov bx,ax
mov ax,4c00h
int 21h