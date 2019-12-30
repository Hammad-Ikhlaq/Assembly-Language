[org 0x0100]

jmp start

n1: dw 100
n2: dw 50
hcf: dw 1

start:

		mov ax, [n1]
comparison1:
		cmp ax, [n2]
		ja swap
		jmp loop1

swap:	
		mov dx,ax
		mov ax, [n2]
		mov [n2],dx
		mov [n1],ax
loop1:
		mov cx,0
loopBody:	
		add cx,1	
		cmp cx,[n2]
		jne firstCond
		jmp Exit
firstCond:
		mov bx, [n1]
comparison2:
		cmp bx, cx
		jae subtract1
		jmp check1

subtract1:	
		sub bx,cx
		jmp comparison2
check1:
		cmp bx,0
		je secCond
		jmp loopBody
secCond:
		mov bx, [n2]
comparison3:
		cmp bx, cx
		jae subtract2
		jmp check2

subtract2:	
		sub bx,cx
		jmp comparison3
check2:
		cmp bx,0
		je assignment
		jmp loopBody		
				
assignment:	
		mov [hcf], cx
		jmp loopBody

Exit:
mov ax,0x4c00
int 21h	