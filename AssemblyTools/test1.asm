;PPT3.4d page8
;注意SI每次增加多少，附加段取数据要写上段名，从内存取数据要写上数据类型，
;千千万万不要忘记写结束，老是写完主程序就忘了，offset的使用
;简简单单的一个数据比较，没有使用任何有效算法
extra segment
	arr dw 8,1,2,3,4,5,6,7,8
extra ends
code segment
	assume cs:code,es:extra
main proc far
start:	mov dx,extra
		mov es,dx
	
		mov di,offset arr
		mov bx,di
		mov si,0
		mov cx,word ptr es:[bx+si]
		
loop1:	add si,2
		cmp word ptr es:[bx+si],ax
		jz yes
		loop loop1
		stc
		
exit:	mov ax,4c00h
		int 21h
		
yes:	clc
		jmp exit
main endp
code ends
	end start