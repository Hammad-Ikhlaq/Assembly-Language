[org 0x0100]

jmp start

multiplicand: dd 1234,5678,1234,5678		;128 bits
multiplier: dw 1111,2222,3333,4444		;64 bits
result: dd 0,0,0,0				;128 bits

start:
	mov cl,16
	mov dx,[multiplier+6]			;load least significant multiplier in dx
checkbit1:
	shr dx,1				;drop right most bit in carry
	jnc skip1				;skip addition if bit is zero
mov ax,[multiplicand]
add [result],ax					;add less significant word of first double
mov ax,[multiplicand+2]
adc [result+2],ax				;add most significant word of first double
mov ax,[multiplicand+4]
adc [result+4],ax				;add less significant word of second double
mov ax,[multiplicand+6]
adc [result+6],ax				;add most significant word of second double
mov ax,[multiplicand+8]
adc [result+8],ax				;add less significant word of third double
mov ax,[multiplicand+10]
add [result+10],ax				;add most significant word of third double
mov ax,[multiplicand+12]
adc [result+12],ax				;add less significant word of forth double				
mov ax,[multiplicand+14]
adc [result+14],ax				;add most significant word of forth double

skip1:	shl word[multiplicand],1
	rcl word[multiplicand+2],1
	rcl word[multiplicand+4],1
	rcl word[multiplicand+6],1
	rcl word[multiplicand+8],1
	rcl word[multiplicand+10],1
	rcl word[multiplicand+12],1
	rcl word[multiplicand+14],1
	dec cl
	jnz checkbit1

mov ax,0x4c00
int 21h	
	