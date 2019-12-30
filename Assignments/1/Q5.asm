[org 0x0100]
	mov dx,-2
	mov si,-2
	mov cx,[columns]
outerloop:
	sub cx,1
	add dx,2
	mov bx,0
	add bx,dx
	mov di,0
innerloop:

	add di,1
	add si,2

	mov ax,[matrix+bx]
	mov [transpose+si],ax
	
	mov bp,[columns]
	add bp,bp
	add bx,bp	
	cmp di,[rows]
	jne innerloop
	cmp cx,0
	jne outerloop
	mov ax,0x4c00
	int 21h

matrix: dw 1,2,3,4,5,6,7,8,9,10
transpose: dw 0,0,0,0,0,0,0,0,0,0
rows: dw 3
columns: dw 3
