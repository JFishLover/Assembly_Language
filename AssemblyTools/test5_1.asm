;要求从键盘键入一个十进制数据，并以十六进制的形式在屏幕上显示
;退出条件是什么？输入十进制，0-9之外的数据输进来，输入结束
code segment
	assume cs:code
main proc far
start:	call input 
		call nextline
		call display
		call nextline
		jmp start
main endp
	
input proc near
		mov bx,0
inpu:	
		mov ah,1
		int 21h
		sub al,30h
		jl exit
		cmp al,9
		jg exit
		cbw
		xchg ax,bx;这个程序段要放在输入认可的后边，防止输入不合法，但是已经完成了移位操作，
		mov cx,000ah;但是放在这里就不能先进行乘法运算，就会把AL中的数给覆盖
		mul cx			;乘法只有一个操作数，而且不能为立即数，要是寄存器或者内存
		add bx,ax
		jmp inpu
exit:	ret
input endp	

nextline proc near
		mov ah,2
		mov dl,0dh
		int 21h
		mov dl,0ah
		int 21h
		ret
nextline endp

display proc near
		mov cx,4
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
		ret
display endp

code ends
 end start