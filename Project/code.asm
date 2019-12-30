[org 0x100]
	jmp start
power1x: dw 64
power1y: dw 3
power2x: dw 4
power2y: dw 3
power3x: dw 44
power3y: dw 5
power4x: dw 74
power4y: dw 1
power1flag: db 0 ; shooter
power3flag: db 0 ; xray
life: db 3
bColor: dw 1
points: db 0
theEndStr: db 'The End!', 0
bonusStr: db 'You Got 20 Bonus Points!', 0
tPointStr: db 'Total Points: ', 0
flag: db 0
tickcount: dw 0
timeDelay: db 0 
oldisr: dd 0
timeStr: db 'Time:   /120', 0
livesStr: db 'Lives:  /3', 0
pointsStr: db 'Points: ', 0
pow1str: db 'Power: SHOOTER!', 0
pow2str: db 'Power: LIFE UP!', 0
pow3str: db 'Power: X-Ray!', 0
pow4str: db 'Power: BIGGER BAR!', 0
nameStr: db ' BRICK BREAKER-The Game ', 0
namesStr: db 'Made by Hammad Ikhlaq & Muhammad Fakhar-E-Alam', 0
rightStr: db ' All Rights Reserved.', 0
presstoCont: db 'Press Any Key To Continue...', 0
barLength: dw 12
movementOfBar: dw 4
barX: dw 36
barY: dw 23
bricks: db 0xdb,0xdb,0xdb,0xdb,0xdb,0xdb,0xdb,0xdb,0xdb,0
brick1x: dw 0
brick1y: dw 1
brick2x: dw 10
brick2y: dw 1
brick3x: dw 20
brick3y: dw 1
brick4x: dw 30
brick4y: dw 1
brick5x: dw 40
brick5y: dw 1
brick6x: dw 50
brick6y: dw 1
brick7x: dw 60
brick7y: dw 1
brick8x: dw 70
brick8y: dw 1
brick9x: dw 0
brick9y: dw 3
brick10x: dw 10
brick10y: dw 3
brick11x: dw 20
brick11y: dw 3
brick12x: dw 30
brick12y: dw 3
brick13x: dw 40
brick13y: dw 3
brick14x: dw 50
brick14y: dw 3
brick15x: dw 60
brick15y: dw 3
brick16x: dw 70
brick16y: dw 3
brick17x: dw 0
brick17y: dw 5
brick18x: dw 10
brick18y: dw 5
brick19x: dw 20
brick19y: dw 5
brick20x: dw 30
brick20y: dw 5
brick21x: dw 40
brick21y: dw 5
brick22x: dw 50
brick22y: dw 5
brick23x: dw 60
brick23y: dw 5
brick24x: dw 70
brick24y: dw 5
;FOR CHECKING BOUNDARIES
checkboundaries:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push si
	mov si,[bp+4]	;si has address
	mov cx,0	;cx has starting address of upper line
	mov ax,160	;ax has starting address of left line
	mov bx,3840	;bx has starting address of lower line
	mov dx,318	;dx has starting address of right line
uppercheck:
	cmp si,cx	;if the ball has touched the upper wall
	je up
	add cx,2
	cmp cx,158	;if the end of line has reached
	je leftcheck
	jmp uppercheck
leftcheck:
	cmp si,ax	;if the ball has touched the left wall
	je left
	add ax,160
	cmp ax,3840	;if the end of line has reached
	je lowercheck
	jmp leftcheck
lowercheck:
	cmp si,bx	;if the ball has touched the lower wall
	je down
	add bx,2
	cmp bx,3998	;if the end of line has reached
	je rightcheck
	jmp lowercheck
rightcheck:
	cmp si,dx	;if the ball has touched the right wall
	je right
	add dx,160
	cmp dx,3998	;if the end of line has reached
	je end
	jmp rightcheck
up:
	mov word[bp+6],2
	jmp end
down:
	mov word[bp+6],-1
	jmp end
right:
	mov word[bp+6],3
	jmp end
left:
	mov word[bp+6],1
	jmp end
end:	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
;BRICKS PRINTING
printBricks:
	push bp
	mov bp,sp
	push ax
	mov ax, [bp+8] ; x-axis
	push ax
	mov ax, [bp+6] ; y-axis
	push ax
	mov ax, [bp+4] ; attribute
	push ax
	mov ax, bricks
	push ax
	call printstr
	pop ax
	pop bp
	ret 6
printingBricks:
	; 1st row
	mov ax, [cs:brick1x]
	push ax
	mov ax, [cs:brick1y]
	push ax
	push 1 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick2x]
	push ax
	mov ax, [cs:brick2y]
	push ax
	push 2
	call printBricks
	mov ax, [cs:brick3x]
	push ax
	mov ax, [cs:brick3y]
	push ax
	push 3 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick4x]
	push ax
	mov ax, [cs:brick4y]
	push ax
	push 4
	call printBricks
	mov ax, [cs:brick5x]
	push ax
	mov ax, [cs:brick5y]
	push ax
	push 5 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick5x]
	push ax
	mov ax, [cs:brick5y]
	push ax
	push 6
	call printBricks
	mov ax, [cs:brick6x]
	push ax
	mov ax, [cs:brick6y]
	push ax
	push 8 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick7x]
	push ax
	mov ax, [cs:brick7y]
	push ax
	push 9 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick8x]
	push ax
	mov ax, [cs:brick8y]
	push ax
	push 10 ; attribute for a brick
	call printBricks
	; 2nd row
	mov ax, [cs:brick9x]
	push ax
	mov ax, [cs:brick9y]
	push ax
	push 15 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick10x]
	push ax
	mov ax, [cs:brick10y]
	push ax
	push 14
	call printBricks
	mov ax, [cs:brick11x]
	push ax
	mov ax, [cs:brick11y]
	push ax
	push 13 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick12x]
	push ax
	mov ax, [cs:brick12y]
	push ax
	push 12
	call printBricks
	mov ax, [cs:brick13x]
	push ax
	mov ax, [cs:brick13y]
	push ax
	push 11 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick14x]
	push ax
	mov ax, [cs:brick14y]
	push ax
	push 10
	call printBricks
	mov ax, [cs:brick15x]
	push ax
	mov ax, [cs:brick15y]
	push ax
	push 9 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick16x]
	push ax
	mov ax, [cs:brick16y]
	push ax
	push 8 ; attribute for a brick
	call printBricks
	; 3rd row
	mov ax, [cs:brick17x]
	push ax
	mov ax, [cs:brick17y]
	push ax
	push 1 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick18x]
	push ax
	mov ax, [cs:brick18y]
	push ax
	push 2
	call printBricks
	mov ax, [cs:brick19x]
	push ax
	mov ax, [cs:brick19y]
	push ax
	push 3 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick20x]
	push ax
	mov ax, [cs:brick20y]
	push ax
	push 4
	call printBricks
	mov ax, [cs:brick21x]
	push ax
	mov ax, [cs:brick21y]
	push ax
	push 5 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick22x]
	push ax
	mov ax, [cs:brick22y]
	push ax
	push 6
	call printBricks
	mov ax, [cs:brick23x]
	push ax
	mov ax, [cs:brick23y]
	push ax
	push 8 ; attribute for a brick
	call printBricks
	mov ax, [cs:brick24x]
	push ax
	mov ax, [cs:brick24y]
	push ax
	push 9 ; attribute for a brick
	call printBricks
	ret
; STRING LENGTH FUNCTION
strlen:
	push bp
	mov bp,sp
	push es
	push di
	push ax
	les di, [bp+4]
	mov cx, 0xffff
	xor al,al
	repne scasb
	mov ax, 0xffff
	sub ax,cx
	mov cx, ax
	dec cx	;	for excluding null
	pop ax
	pop di
	pop es
	pop bp
	ret 4
;FOR PRINTING STRINGS
printstr:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	push ds ;push segment of string
	mov cx, [bp+4]
	push cx ; offset of string
	call strlen

	cmp cx, 0
	jz exit ; no printing if string is null
printing:	
	mov ax, 0xb800
	mov es, ax
	mov al, 80 ; col per row
	mul byte[bp+8] ; multiply with y position
	add ax, [bp+10] ; add x position
	shl ax, 1 
	mov di, ax ; load location in di
	mov si,[bp+4]
	mov ah, [bp+6]
	cld
nextchar:
	lodsb
	stosw
	loop nextchar
exit:
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 8
;FOR PRINTING NUMBERS
printnum: 
	push bp 
	mov bp, sp 
	push es 
	push ax 
	push bx 
	push cx 
	push dx 
	push di 
	mov ax, 0xb800 
	mov es, ax ; point es to video base 
	mov ax, [bp+4] ; load number in ax 
	mov bx, 10 ; use base 10 for division 
	mov cx, 0 ; initialize count of digits 
nextdigit: 
	mov dx, 0 ; zero upper half of dividend 
	div bx ; divide by 10 
	add dl, 0x30 ; convert digit into ascii value 
	push dx ; save ascii value on stack 
	inc cx ; increment count of values 
	cmp ax, 0 ; is the quotient zero 
	jnz nextdigit ; if no divide it again 
	mov di, [bp+6] ; point di to 70th column 
nextpos: 
	pop dx ; remove a digit from the stack 
	mov dh, 0x07 ; use normal attribute 
	mov [es:di], dx ; print char on screen 
	add di, 2 ; move to next screen location 
	loop nextpos ; repeat for all digits on stack 
	pop di 
	pop dx 
	pop cx 
	pop bx 
	pop ax 
	pop es 
	pop bp 
	ret 4
clrscr:
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax
	xor di, di 
	mov ax, 0x0720
	mov cx, 2000
	cld 
	rep stosw
	pop di
	pop cx
	pop ax
	pop es
	ret
; FOR A SPACE
printSpace:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di		
	mov cx, [cs:movementOfBar] ; length of movement of bar
	mov ax, 0xb800
	mov es, ax
	mov al, 80 ; col per row
	mul byte[bp+8] ; multiply with y position
	add ax, [bp+10] ; add x position
	shl ax, 1 
	mov di, ax ; load location in di
	mov al,[bp+4]
	mov ah, [bp+6]
	cld
nes:	
	stosw
	loop nes
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 8
; FOR PRINTING bar
barPrint:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di	
	mov cx, [cs:barLength] ; length of bar
	mov ax, 0xb800
	mov es, ax
	mov al, 80 ; col per row
	mul byte[bp+8] ; multiply with y position
	add ax, [bp+10] ; add x position
	shl ax, 1 
	mov di, ax ; load location in di
	mov al,[bp+4]
	mov ah, [bp+6]
	cld
next:
	stosw
	loop next
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 8
;DELAY	
delay:
	push cx
	mov cx ,0xf000
loop_:
	loop loop_
	pop cx
	ret
;TO CLEAR THE SPECIFIC BRICK
clearbrick:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push dx
	push si
	push di	

	mov ax,0xb800
	mov es,ax
	mov ax,[bp+4]
	cmp ax, 1
	je wr1
	cmp ax,2
	je wr2
	cmp ax,3
	je wr3
	cmp ax,4
	je wr4
	cmp ax,5
	je wr5
	cmp ax,6
	je wr6
	cmp ax,7
	je wr7
	cmp ax,8
	je wr8
	cmp ax,9
	je wr9
	cmp ax,10
	je wr10
	cmp ax,11
	je wr11
	cmp ax,12
	je wr12
	cmp ax,13
	je wr13
	cmp ax,14
	je wr14
	cmp ax,15
	je wr15
	cmp ax,16
	je wr16
	cmp ax,17
	je wr17
	cmp ax,18
	je wr18
	cmp ax,19
	je wr19
	cmp ax,20
	je wr20
	cmp ax,21
	je wr21
	cmp ax,22
	je wr22
	cmp ax,23
	je wr23
	cmp ax,24
	je wr24
	jmp exitcb
wr1:	jmp cbrick1
wr2:	jmp cbrick2
wr3:	jmp cbrick3
wr4:	jmp cbrick4
wr5:	jmp cbrick5
wr6:	jmp cbrick6
wr7:	jmp cbrick7
wr8:	jmp cbrick8
wr9:	jmp cbrick9
wr10:	jmp cbrick10
wr11:	jmp cbrick11
wr12:	jmp cbrick12
wr13:	jmp cbrick13
wr14:	jmp cbrick14
wr15:	jmp cbrick15
wr16:	jmp cbrick16
wr17:	jmp cbrick17
wr18:	jmp cbrick18
wr19:	jmp cbrick19
wr20:	jmp cbrick20
wr21:	jmp cbrick21
wr22:	jmp cbrick22
wr23:	jmp cbrick23
wr24:	jmp cbrick24
cbrick1:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick1y] 		; multiply with y position
	add ax, [cs:brick1x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick1x],-1 
again1:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again1
	jmp exitcb
cbrick2:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick2y] 		; multiply with y position
	add ax, [cs:brick2x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick2x],-1
again2:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again2
	jmp exitcb
cbrick3:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick3y] 		; multiply with y position
	add ax, [cs:brick3x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick3x],-1
again3:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again3
	jmp exitcb
cbrick4:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick4y] 		; multiply with y position
	add ax, [cs:brick4x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick4x],-1
again4:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again4
	jmp exitcb
cbrick5:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick5y] 		; multiply with y position
	add ax, [cs:brick5x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick5x],-1
again5:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again5
	jmp exitcb
cbrick6:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick6y] 		; multiply with y position
	add ax, [cs:brick6x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick6x],-1
again6:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again6
	jmp exitcb
cbrick7:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick7y] 		; multiply with y position
	add ax, [cs:brick7x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick7x],-1
again7:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again7
	jmp exitcb
cbrick8:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick8y] 		; multiply with y position
	add ax, [cs:brick8x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick8x],-1
again8:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again8
	mov al, 80		; col per row
	mul byte[cs:power4y] 		; multiply with y position
	add ax, [cs:power4x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ah,[cs:bColor]
	mov al,61
againp8:
	call delay
	call delay
	call delay
	mov word[es:di],0x720
	add di,160
	mov [es:di],ax
	push 0
	push di
	call checkboundaries
	pop dx
	cmp dx,-1		;if the lower wall has been touched
	je eegain8
	push 0
	push di		;position of power up
	call checkbar
	pop dx
	cmp dx,1
	jne againp8
	push 60
	push 0
	mov ax, 135
	push ax
	mov ax, pow4str
	push ax
	call printstr
	mov word[es:di],0x720
	add word[cs:barLength], 4
	add word[cs:movementOfBar], 4
	mov ax, [cs:barX] ; x position, even
	push ax
	mov ax, [cs:barY] ; y position, odd
	push ax
	mov ax, [cs:bColor] ; attribute
	push ax
	mov ax, 0xdb ; ascii
	push ax
	call barPrint
eegain8:
	jmp exitcb
cbrick9:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick9y] 		; multiply with y position
	add ax, [cs:brick9x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick9x],-1
again9:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again9
	mov al, 80		; col per row
	mul byte[cs:power2y] 		; multiply with y position
	add ax, [cs:power2x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ah,4
	mov al,3
againp2:
	call delay
	call delay
	call delay
	mov word[es:di],0x720
	add di,160
	mov [es:di],ax
	push 0
	push di
	call checkboundaries
	pop dx
	cmp dx,-1		;if the lower wall has been touched
	je eegain1
	push 0
	push di		;position of power up
	call checkbar
	pop dx
	cmp dx,1
	jne againp2
	push 22
	push 0
	mov ax, 135
	push ax
	mov ax, pow2str
	push ax
	call printstr
	mov word[es:di],0x720
	add byte[cs:life], 1
	push 3 ; print updated lives
	push 24
	mov ax, 0x7
	push ax
	mov ax, livesStr ; lives
	push ax
	call printstr
	
	push 3860
	xor ax, ax
	mov al, [cs:life]
	push ax
	call printnum
eegain1:
	jmp exitcb
cbrick10:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick10y] 		; multiply with y position
	add ax, [cs:brick10x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick10x],-1
again10:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again10
	jmp exitcb
cbrick11:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick11y] 		; multiply with y position
	add ax, [cs:brick11x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick11x],-1
again11:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again11
	jmp exitcb
cbrick12:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick12y] 		; multiply with y position
	add ax, [cs:brick12x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick12x],-1
again12:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again12

	jmp exitcb
cbrick13:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick13y] 		; multiply with y position
	add ax, [cs:brick13x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick13x],-1
again13:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again13
	jmp exitcb
cbrick14:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick14y] 		; multiply with y position
	add ax, [cs:brick14x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick14x],-1
again14:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again14
	jmp exitcb
cbrick15:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick15y] 		; multiply with y position
	add ax, [cs:brick15x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick15x],-1
again15:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again15
	mov al, 80		; col per row
	mul byte[cs:power1y] 		; multiply with y position
	add ax, [cs:power1x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	
	mov ah,7
	mov al,'*'

againp:
	call delay
	call delay
	call delay
	mov word[es:di],0x720
	add di,160
	mov [es:di],ax
	push 0
	push di
	call checkboundaries
	pop dx
	cmp dx,-1		;if the lower wall has been touched
	je eagain
	push 0
	push di		;position of power up
	call checkbar
	pop dx
	cmp dx, 1
	jne againp
	mov byte[cs:power1flag],1
	push 0
	push 0
	mov ax, 135
	push ax
	mov ax, pow1str
	push ax
	call printstr
eagain:	
	mov word[es:di],0x720
	jmp exitcb
cbrick16:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick16y] 		; multiply with y position
	add ax, [cs:brick16x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick16x],-1
again16:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again16
	jmp exitcb
cbrick17:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick17y] 		; multiply with y position
	add ax, [cs:brick17x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick17x],-1 
again17:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again17
	jmp exitcb
cbrick18:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick18y] 		; multiply with y position
	add ax, [cs:brick18x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick18x],-1
again18:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again18
	jmp exitcb
cbrick19:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick19y] 		; multiply with y position
	add ax, [cs:brick19x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick19x],-1
again19:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again19
	jmp exitcb
cbrick20:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick20y] 		; multiply with y position
	add ax, [cs:brick20x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick20x],-1
again20:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again20
	jmp exitcb
cbrick21:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick21y] 		; multiply with y position
	add ax, [cs:brick21x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick21x],-1
again21:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again21
	mov al, 80		; col per row
	mul byte[cs:power3y] 		; multiply with y position
	add ax, [cs:power3x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ah,2
	mov al,4
againp21:
	call delay
	call delay
	call delay
	mov word[es:di],0x720
	add di,160
	mov [es:di],ax
	push 0
	push di
	call checkboundaries
	pop dx
	cmp dx,-1		;if the lower wall has been touched
	je eegain21
	push 0
	push di		;position of power up
	call checkbar
	pop dx
	cmp dx,1
	jne againp21
	push 42
	push 0
	mov ax, 135
	push ax
	mov ax, pow3str
	push ax
	call printstr
	mov word[es:di],0x720
	mov byte[cs:power3flag], 1
eegain21:
	jmp exitcb
cbrick22:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick22y] 		; multiply with y position
	add ax, [cs:brick22x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick22x],-1
again22:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again22
	jmp exitcb
cbrick23:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick23y] 		; multiply with y position
	add ax, [cs:brick23x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick23x],-1
again23:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again23
	jmp exitcb
cbrick24:
	mov cx,9
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick24y] 		; multiply with y position
	add ax, [cs:brick24x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	add byte[cs:points], 5
	add byte[cs:flag], 1
	mov word[cs:brick24x],-1
again24:
	mov byte[es:di],' '
	dec cx
	add di,2
	cmp cx,0
	jne again24
	jmp exitcb
exitcb:
	push 3928
	xor ax, ax
	mov al, [cs:points] ; updating points each time
	push ax
	call printnum
	pop di
	pop si
	pop dx
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
; timer interrupt service routine
timer: 
	cmp byte[cs:flag], 24
	je wrG
	push bx
	push ax
	jmp delayT
wrG:
	jmp wrapG ; 855
pr:
	cmp word[cs:tickcount], 121
	je exitT
	push 3988
	push word[cs:tickcount]
	call printnum ; print tick count
	inc word[cs:tickcount]; decrement tick count
exitT:
	mov al, 0x20
	out 0x20, al ; end of interrupt
	pop ax
	pop bx
	iret ; return from interrupt
delayT:
	inc byte[cs:timeDelay]
	cmp byte[cs:timeDelay], 18
	je pr
	cmp byte[cs:timeDelay], 19
	jae again
	jmp exitT
again:
	mov byte[cs:timeDelay], 0
	jmp exitT
;BALL MOVEMENT
ball:
	pusha
continue:
	mov si, 3602		;ball movement from middle
	mov ax,0xb800
	mov es,ax
	mov al, 'O'
	mov ah, 0x7
up_right:
	mov al, 'O'
	mov ah, 0x7
	add si,2
	sub si,160
	cmp si,158
	je kri
	mov [es:si],ax
	call delay
	call delay
	call delay
	mov ax,0x0720		;hide previous ball
	mov [es:si],ax		;ball printing
	push 0
	push si			;passing position
	call checkboundaries	;in this case left and bottom wall cannot be touched so we skipped checking left
	pop bx			;return 1 if left boundary is touched, 2 for upper,3 for right and -1 if bottom is touched and 0 otherwise
	cmp bx,2		;checking if upper boundary is touched
	je see		
	cmp bx,3		;checking if right boundary is touched
	je ali		;in this case left wall cannot be touched so we skipped checking left
	push 0
	push si
	call checkbricks
	pop bx
	cmp bx,0		;no brick has been touched
	je up_right		;continue its motion
	push bx			;pushing the value of brick to be cleared
	call clearbrick
	cmp byte[power3flag],1
	je up_right
see:
	jmp down_right		;after clearing brick the direction of ball will be changed
kri:	
	jmp down_left
ali:	
	jmp up_left
down_right:
	add si,2		
	add si,160
	mov al, 'O'
	mov ah, 0x7
	mov [es:si],ax
	cmp si,158
	je kri
	call delay
	call delay
	call delay
	mov ax,0x0720		;hide previous ball
	mov [es:si],ax		;ball printing
	push 0
	push si			;passing position
	call checkboundaries	;in this case left and up wall cannot be touched so we skipped checking left
	pop bx			;return 1 if left boundary is touched, 2 for upper,3 for right and -1 if bottom is touched and 0 otherwise
	cmp bx,3		;checking if right boundary is touched
	je kri		;in this case left wall cannot be touched so we skipped checking left
	cmp bx,-1		;checking if bottom boundary is touched
	je wrap
	push 0
	push si
	call checkbar
	pop bx
	cmp bx,1
	je up_right
	push 0
	push si
	call checkbricks
	pop bx
	cmp bx,0		;no brick has been touched
	je down_right		;continue its motion
	push bx			;pushing the value of brick to be cleared
	call clearbrick
	cmp byte[power3flag],1
	je down_right
	jmp up_right		;after clearing brick the direction of ball will be changed
wrap:	
	jmp lost_life
up_left:
	mov ax, [cs:barX] ; x position, even
	push ax
	mov ax, [cs:barY] ; y position, odd
	push ax
	mov ax, [cs:bColor] ; attribute
	push ax
	mov ax, 0xdb ; ascii
	push ax
	call barPrint ; for the rightmost space 
	mov al, 'O'
	mov ah, 0x7
	sub si,2		
	sub si,160
	mov [es:si],ax
	cmp si,158
	je kri
	call delay
	call delay
	call delay
	mov ax,0x0720		;hide previous ball
	mov [es:si],ax		;ball printing
	push 0
	push si			;passing position
	call checkboundaries	;in this case right and bottom wall cannot be touched so we skipped checking left
	pop bx			;return 1 if left boundary is touched, 2 for upper,3 for right and -1 if bottom is touched and 0 otherwise
	cmp bx,2		;checking if upper boundary is touched
	je down_left		
	cmp bx,1		;checking if left boundary is touched
	je up_right
	push 0
	push si
	call checkbricks
	pop bx	
	cmp bx,0		;no brick has been touched
	je up_left		;continue its motion
	push bx			;pushing the value of brick to be cleared
	call clearbrick
	cmp byte[power3flag],1
	je up_left
	jmp down_left		;after clearing brick the direction of ball will be changed	
wrapC:
	jmp continue
down_left:
	sub si,2		
	add si,160
	mov al, 'O'
	mov ah, 0x7
	mov [es:si],ax
	cmp si,158
	je kri
	call delay
	call delay
	call delay
	mov ax,0x0720		;hide previous ball
	mov [es:si],ax		;ball printing
	push 0
	push si			;passing position
	call checkboundaries	;in this case right and up wall cannot be touched so we skipped checking left
	pop bx			;return 1 if left boundary is touched, 2 for upper,3 for right and -1 if bottom is touched and 0 otherwise
		
	cmp bx,1		;checking if left boundary is touched
	je down_right		
	cmp bx,-1		;checking if bottom boundary is touched
	je lost_life
	push 0
	push si
	call checkbar
	pop bx
	cmp bx,1
	je up_left
	push 0
	push si
	call checkbricks
	pop bx
	cmp bx,0		;no brick has been touched
	je down_left		;continue its motion
	push bx			;pushing the value of brick to be cleared
	call clearbrick
	cmp byte[power3flag],1
	je down_left
	jmp up_left		;after clearing brick the direction of ball will be changed
lost_life:
	xor ax, ax
	mov al, [cs:life]
	dec ax
	mov byte[cs:life], al
	push 3860
	mov al, [cs:life]
	push ax
	call printnum
	cmp byte[cs:life],0
	je exitB
	jmp wrapC
exitB:	
	popa
	ret 
	; MOVING THE BAR
barMove:
	pusha
	xor ax, ax
	in al, 0x60 ; read a char from keyboard port 
	cmp byte[power1flag],0
	je neext
	cmp al, 0x39		;comparing with space key
	jne neext
	mov al, 80 ; col per row
	xor dx, dx
	mov dl, [cs:barY]
	dec dl
	mul dl ; multiply with y position
	add ax, [cs:barX] ; add x position
	shl ax, 1 
	add ax, 6
	mov di, ax ; load location in di
	mov ah,7
	mov al,24
againp1:
	call delay
	call delay
	call delay
	mov word[es:di],0x720
	sub di,160
	mov [es:di],ax
	push 0
	push di		;position of power up
	call checkbricks
	pop dx
	cmp dx,0		;no brick has been touched
	je egain1
	push dx			;if brick has been touched
	call clearbrick
	jmp eagain1
egain1:	
	push 0
	push di
	call checkboundaries
	pop dx
	cmp dx,2		;if the upper wall has been touched
	je eagain1
	jmp againp1
eagain1:	
	mov word[es:di],0x720
neext:
	cmp al, 0x4b ; left arrow pressed
	jne rightArrow
	mov ax, [cs:barX] ; x position
	add ax, 8
	push ax
	mov ax, [cs:barY] ; y position
	push ax
	mov ax, 7 ; attribute
	push ax
	mov ax, 0x20 ;space
	push ax
	call printSpace
	xor ax, ax
	mov ax, [cs:barX] ; x position
	cmp ax, 0
	je skip 
	sub ax, 4
	mov [cs:barX], ax
skip: ; for boundary check
	push ax
	mov ax, [cs:barY] ; y position
	push ax
	mov ax, [cs:bColor] ; attribute
	push ax
	mov ax, 0xdb ; address of string
	push ax
	call barPrint
	jmp bExit
rightArrow:
	cmp al, 0x4d ; right arrow pressed
	jne bExit	
	mov ax, [cs:barX] ; x position
	push ax
	mov ax, [cs:barY] ; y position
	push ax
	mov ax, 7 ; attribute
	push ax
	mov ax, 0x20 ;space
	push ax
	call printSpace
	xor ax, ax
	mov ax, [cs:barX] ; x position
	mov dx, 80
	sub dx, [cs:barLength]
	cmp ax, dx
	je skip1 
	add ax, 4
	mov [cs:barX], ax
skip1: ; for boundary check
	push ax
	mov ax, [cs:barY] ; y position
	push ax
	mov ax, [cs:bColor] ; attribute
	push ax
	mov ax, 0xdb ; address of string
	push ax
	call barPrint
	jmp bExit
restoreC:
	mov word[cs:bColor], 1
bExit: 
	add word[cs:bColor], 1
	cmp word[cs:bColor], 15
	je restoreC
;	mov al, 0x20
;	out 0x20, al ; end of interrupt
	popa
	jmp far[cs:oldisr]
;	iret
;TO CHECK THE TOUCHING OF BALL WITH BAR 
checkbar:	
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push si
	push di	
	push es
	mov cx, [cs:barLength]		;length of bar
	mov ax, 0xb800
	mov es, ax
	mov ah,0
	mov al, 80		; col per row
	mov dl, [cs:barY]
	cmp word[cs:barX], 68
	jae noDec
	dec dl ; so that bar ko touch karey tau space na aaye
noDec:
	mul dl 		; multiply with y position
	add ax, [cs:barX] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag:
	cmp ax, di
	je yes
	add di,2
	dec cx
	jnz ag
	jmp no
yes:	
	mov word[bp+6],1
	jmp exitbar
no:	
	mov word[bp+6],0	
exitbar:	
	pop es
	pop di
	pop si
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
;TO CHECK THE TOUCHING OF BALL WITH BRICKS 
checkbricks:
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	push si
	push di	
	push es
	mov dx,[cs:brick1x]	;checking if the brick is present
	cmp dx,-1
	je brick2
	mov cx, 9		;length of brick
	mov ax, 0xb800
	mov es, ax
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick1y] 		; multiply with y position
	add ax, [cs:brick1x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag1:
	cmp ax, di
	je yes1
	add di,2
	dec cx
	jnz ag1
	jmp brick2
wrapG:
	jmp wrapG1 ; because of short range
yes1:	
	mov word[bp+6],1
	jmp exitbricks
brick2:
	mov dx,[cs:brick2x]	;checking if the brick is present
	cmp dx,-1
	je brick3

	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick2y] 		; multiply with y position
	add ax, [cs:brick2x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag2:	cmp ax, di
	je yes2
	add di,2
	dec cx
	jnz ag2
	jmp brick3
yes2:	
	mov word[bp+6],2
	jmp exitbricks	
brick3:
	mov dx,[cs:brick3x]	;checking if the brick is present
	cmp dx,-1
	je brick4
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick3y] 		; multiply with y position
	add ax, [cs:brick3x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag3:	
	cmp ax, di
	je yes3
	add di,2
	dec cx
	jnz ag3
	jmp brick4
yes3:	
	mov word[bp+6],3
	jmp exitbricks

brick4:
	mov dx,[cs:brick4x]	;checking if the brick is present
	cmp dx,-1
	je brick5
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick4y] 		; multiply with y position
	add ax, [cs:brick4x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag4:	cmp ax, di
	je yes4
	add di,2
	dec cx
	jnz ag4
	jmp brick5
yes4:	
	mov word[bp+6],4
	jmp exitbricks
brick5:
	mov dx,[cs:brick5x]	;checking if the brick is present
	cmp dx,-1
	je brick6
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick5y] 		; multiply with y position
	add ax, [cs:brick5x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag5:	cmp ax, di
	je yes5
	add di,2
	dec cx
	jnz ag5
	jmp brick6
yes5:	
	mov word[bp+6],5
	jmp exitbricks
brick6:
	mov dx,[cs:brick6x]	;checking if the brick is present
	cmp dx,-1
	je brick7
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick6y] 		; multiply with y position
	add ax, [cs:brick6x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag6:	cmp ax, di
	je yes6
	add di,2
	dec cx
	jnz ag6
	jmp brick7
yes6:	
	mov word[bp+6],6
	jmp exitbricks
brick7:
	mov dx,[cs:brick7x]	;checking if the brick is present
	cmp dx,-1
	je brick8
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick7y] 		; multiply with y position
	add ax, [cs:brick7x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag7:	cmp ax, di
	je yes7
	add di,2
	dec cx
	jnz ag7
	jmp brick8
wrapG1:
	jmp wrapG2
yes7:	
	mov word[bp+6],7
	jmp exitbricks
brick8:
	mov dx,[cs:brick8x]	;checking if the brick is present
	cmp dx,-1
	je brick9
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick8y] 		; multiply with y position
	add ax, [cs:brick8x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag8:	cmp ax, di
	je yes8
	add di,2
	dec cx
	jnz ag8
	jmp brick9
yes8:	
	mov word[bp+6],8
	jmp exitbricks

brick9:
	mov dx,[cs:brick9x]	;checking if the brick is present
	cmp dx,-1
	je brick10
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick9y] 		; multiply with y position
	add ax, [cs:brick9x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag9:	cmp ax, di
	je yes9
	add di,2
	dec cx
	jnz ag9
	jmp brick10
yes9:	
	mov word[bp+6],9
	jmp exitbricks
brick10:
	mov dx,[cs:brick10x]	;checking if the brick is present
	cmp dx,-1
	je brick11
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick10y] 		; multiply with y position
	add ax, [cs:brick10x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag10:	cmp ax, di
	je yes10
	add di,2
	dec cx
	jnz ag10
	jmp brick11
yes10:	
	mov word[bp+6],10
	jmp exitbricks
brick11:
	mov dx,[cs:brick11x]	;checking if the brick is present
	cmp dx,-1
	je brick12
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick11y] 		; multiply with y position
	add ax, [cs:brick11x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag11:	cmp ax, di
	je yes11
	add di,2
	dec cx
	jnz ag11
	jmp brick12
yes11:	
	mov word[bp+6],11
	jmp exitbricks
brick12:
	mov dx,[cs:brick12x]	;checking if the brick is present
	cmp dx,-1
	je brick13
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick12y] 		; multiply with y position
	add ax, [cs:brick12x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag12:	cmp ax, di
	je yes12
	add di,2
	dec cx
	jnz ag12
	jmp brick13
yes12:	
	mov word[bp+6],12
	jmp exitbricks
brick13:
	mov dx,[cs:brick13x]	;checking if the brick is present
	cmp dx,-1
	je brick14
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick13y] 		; multiply with y position
	add ax, [cs:brick13x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag13:	cmp ax, di
	je yes13
	add di,2
	dec cx
	jnz ag13
	jmp brick14
yes13:	
	mov word[bp+6],13
	jmp exitbricks
brick14:
	mov dx,[cs:brick14x]	;checking if the brick is present
	cmp dx,-1
	je brick15
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick14y] 		; multiply with y position
	add ax, [cs:brick14x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag14:	cmp ax, di
	je yes14
	add di,2
	dec cx
	jnz ag14
	jmp brick15
wrapG2:
	jmp endGame ; because of short range
yes14:	
	mov word[bp+6],14
	jmp exitbricks

brick15:
	mov dx,[cs:brick15x]	;checking if the brick is present
	cmp dx,-1
	je brick16
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick15y] 		; multiply with y position
	add ax, [cs:brick15x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag15:	cmp ax, di
	je yes15
	add di,2
	dec cx
	jnz ag15
	jmp brick16
yes15:	
	mov word[bp+6],15
	jmp exitbricks
brick16:
	mov dx,[cs:brick16x]	;checking if the brick is present
	cmp dx,-1
	je brick17
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick16y] 		; multiply with y position
	add ax, [cs:brick16x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag16:	
	cmp ax, di
	je yes16
	add di,2
	dec cx
	jnz ag16
	jmp brick17
yes16:	
	mov word[bp+6],16
	jmp exitbricks
brick17:
	mov dx,[cs:brick17x]	;checking if the brick is present
	cmp dx,-1
	je brick18
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick17y] 		; multiply with y position
	add ax, [cs:brick17x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag17:	
	cmp ax, di
	je yes17
	add di,2
	dec cx
	jnz ag17
	jmp brick18
yes17:	
	mov word[bp+6],17
	jmp exitbricks
brick18:
	mov dx,[cs:brick18x]	;checking if the brick is present
	cmp dx,-1
	je brick19
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick18y] 		; multiply with y position
	add ax, [cs:brick18x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag18:	
	cmp ax, di
	je yes18
	add di,2
	dec cx
	jnz ag18
	jmp brick19
yes18:	
	mov word[bp+6],18
	jmp exitbricks
brick19:
	mov dx,[cs:brick19x]	;checking if the brick is present
	cmp dx,-1
	je brick20
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick19y] 		; multiply with y position
	add ax, [cs:brick19x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag19:	
	cmp ax, di
	je yes19
	add di,2
	dec cx
	jnz ag19
	jmp brick20
yes19:	
	mov word[bp+6],19
	jmp exitbricks
brick20:
	mov dx,[cs:brick20x]	;checking if the brick is present
	cmp dx,-1
	je brick21
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick20y] 		; multiply with y position
	add ax, [cs:brick20x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag20:	
	cmp ax, di
	je yes20
	add di,2
	dec cx
	jnz ag20
	jmp brick21
yes20:	
	mov word[bp+6],20
	jmp exitbricks
brick21:
	mov dx,[cs:brick21x]	;checking if the brick is present
	cmp dx,-1
	je brick22
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick21y] 		; multiply with y position
	add ax, [cs:brick21x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag21:	
	cmp ax, di
	je yes21
	add di,2
	dec cx
	jnz ag21
	jmp brick22
yes21:	
	mov word[bp+6],21
	jmp exitbricks
brick22:
	mov dx,[cs:brick22x]	;checking if the brick is present
	cmp dx,-1
	je brick23
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick22y] 		; multiply with y position
	add ax, [cs:brick22x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag22:	cmp ax, di
	je yes22
	add di,2
	dec cx
	jnz ag22
	jmp brick23
yes22:	
	mov word[bp+6],22
	jmp exitbricks
brick23:
	mov dx,[cs:brick23x]	;checking if the brick is present
	cmp dx,-1
	je brick24
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick23y] 		; multiply with y position
	add ax, [cs:brick23x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag23:	
	cmp ax, di
	je yes23
	add di,2
	dec cx
	jnz ag23
	jmp brick24
yes23:	
	mov word[bp+6],23
	jmp exitbricks
brick24:
	mov dx,[cs:brick24x]	;checking if the brick is present
	cmp dx,-1
	je exitbricks
	mov cx, 9		;length of brick
	mov ah,0
	mov al, 80		; col per row
	mul byte[cs:brick24y] 		; multiply with y position
	add ax, [cs:brick24x] 		; add x position
	shl ax, 1 
	mov di, ax 		; load location in di
	mov ax,[bp+4]	`	;moving ball location in ax
ag24:	
	cmp ax, di
	je yes24
	add di,2
	dec cx
	jnz ag24
	jmp exitbricks
yes24:	
	mov word[bp+6],24
	jmp exitbricks
exitbricks:	
	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
start:
	call clrscr
	;INTRO
	push 26
	push 6
	mov ax, 6
	push ax
	mov ax, nameStr
	push ax
	call printstr
	
	push 18
	push 10
	mov ax, 0xf
	push ax
	mov ax, namesStr
	push ax
	call printstr
	
	push 25
	push 14
	mov ax, 135
	push ax
	mov ax, presstoCont
	push ax
	call printstr

	push 27
	push 21
	mov ax, 0xf
	push ax
	mov ax, rightStr
	push ax
	call printstr
	
	xor ax,ax
	mov ah, 0
	int 0x16
	
	call clrscr
	;GAME START
	mov ax, [cs:barX] ; x position, even
	push ax
	mov ax, [cs:barY] ; y position, odd
	push ax
	mov ax, [cs:bColor] ; attribute
	push ax
	mov ax, 0xdb ; ascii
	push ax
	call barPrint
	
	mov ax, 0xb800
	mov es,ax
	mov di, 3602
	mov ah, 0x7
	mov al, 'O'
	mov word[es:di], ax ; initial ball
	
	push 68
	push 24
	mov ax, 0x7
	push ax
	mov ax, timeStr
	push ax
	call printstr
	
	push 36
	push 24
	mov ax, 0x7
	push ax
	mov ax, pointsStr ; points
	push ax
	call printstr
	
	push 3928
	xor ax, ax
	mov al, [cs:points]
	push ax
	call printnum
	
	push 3
	push 24
	mov ax, 0x7
	push ax
	mov ax, livesStr ; lives
	push ax
	call printstr
	
	push 3860
	xor ax, ax
	mov al, [cs:life]
	push ax
	call printnum
	
	call printingBricks

	xor ax,ax
	mov ah, 0
	int 0x16
	mov ax, 0xb800
	mov es,ax
	mov di, 3602
	mov word[es:di], 0x720 ; space after initial ball
	
	xor ax, ax
	mov es, ax 
	mov ax, [es:9*4]
	mov [oldisr], ax 
	mov ax, [es:9*4+2]
	mov [oldisr+2], ax
	cli 
	mov word [es:9*4], barMove 
	mov [es:9*4+2], cs 
	xor ax, ax 
	mov es, ax ; point es to IVT base 
	mov word [es:8*4], timer; store offset at n*4 
	mov [es:8*4+2], cs ; store segment at n*4+2 
	sti
	call ball
endGame:
	call clrscr
	cmp word[cs:tickcount], 120
	jbe disEnd
resEnd:
	push 29
	push 11
	mov ax, 7
	push ax
	mov ax, tPointStr
	push ax
	call printstr
	push 30
	push 12
	mov ax, 135
	push ax
	mov ax, theEndStr
	push ax
	call printstr
	push 1848
	xor ax, ax
	mov al, [cs:points] ; updating points each time
	push ax
	call printnum
	mov ax, [oldisr]
	mov bx, [oldisr+2]
	cli
	mov [es:9*4], ax
	mov [es:9*4+2], bx
	sti
	mov dx, start ; end of resident portion 
	add dx, 15 ; round up to next para 
	mov cl, 4 
	shr dx, cl ; number of paras 
	mov ax, 0x3100 ; terminate and stay resident 
	int 0x21 
disEnd:
	cmp byte[cs:life], 0
	je resEnd
	add byte[cs:points], 20
	push 27
	push 10
	mov ax, 0xf
	push ax
	mov ax, bonusStr
	push ax
	call printstr
	jmp resEnd 