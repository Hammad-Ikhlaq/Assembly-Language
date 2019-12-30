[org 0x0100]

jmp start

Month: dw 12
Day: dw 31
Year:dw 99

start:

mov ax,[Day]		;It will occupy 5 bits because 2^5=32
shl ax,4		;Month will occupy only 1 byte
add ax,[Month]
shl ax,7		;Its maximum value can be 99 which needs 7 bits because 2^7=128
add ax,[Year]

mov ax,4c00h
int 21h