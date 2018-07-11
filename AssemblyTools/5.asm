;汇编第二次试验作业1,从键盘录入四位十六进制数，在屏幕上显示对应的二进制
code segment
	assume cs:code
main proc far
again:	call input
		call nextline
		call print
		call nextline
		jmp again
main endp


input proc near
		mov bx,0
		mov cx,3;设置每次只输入四位16进制数
newchar:push cx
		mov ah,1
		int 21h
		sub al,30h
		jl 	exit
		cmp	al,9d
		jg	af;比9大的话判断是不是A-F
pass:	cbw
		xchg ax,bx
		mov	cx,16d
		mul cx
		add bx,ax
		pop cx
		dec cx
		jl	exit
		jmp newchar
		
af:		sub al,7d
		cmp al,10
		jl	exit
		cmp	al,15
		jg	exit
		jmp pass
exit:	ret
input endp

print proc near
		mov ch,16
rotate:	shl bx,1
		mov dl,30h
		jnc	output	
		mov dl,31h
output:	mov ah,2
		int 21h
		dec ch
		jnz	rotate
		ret
print endp

nextline proc near
		mov dl,0dh
		mov ah,2
		int 21h
		mov dl,0ah
		mov ah,2
		int 21h
		ret
nextline endp
code ends
	 end again