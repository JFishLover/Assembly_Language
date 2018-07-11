;DX,BX双字左移四位
code segment
	assume cs:code
main proc far
start:	mov dx,0F0F0H
		mov bx, 0F0FH
		mov cx,4
		
loop1:	shl dx,1
		shl bx,1
		jnc flag1
		inc dx
flag1:	loop loop1

		mov ax,4c00H
		int 21H
main endp
code ends
	end start