;功能，将bx中的数据以16进制的形式打印出来
code segment
main proc far
	assume cs:code
start:	mov cx,4
		mov bx,0FFFh
loop1:	push cx
		mov cl,4
		rol bx,cl
		mov dx,000fh
		and dx,bx
		add dx,30h
		cmp dx,3ah;啊啊啊啊啊啊啊，39H后边不是40H，是3AH，哈哈哈哈h
		jl num
		add dx,7
num:	mov ah,2
		int 21h
		pop cx
		loop loop1
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
