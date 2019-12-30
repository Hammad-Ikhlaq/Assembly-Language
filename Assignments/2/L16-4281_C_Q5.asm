[org 0x0100]

mov al,[startingBit]
mov ah,0
mov bl,8
div bl
mov dl,ah
mov ah,0
mov cl,4
mul cl
mov bx,ax
looping:
cmp dl,0
je exit
shl word[array+bx],1
rcl word[array+bx+2],1
dec dl
jmp looping
exit:
mov ax,[array+bx]
mov ax,4c00h
int 21h

array: dd -1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32
startingBit: db 204
