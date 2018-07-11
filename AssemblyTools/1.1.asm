stack segment
	arr dw 100 dup(?)
	tos dw ?
stack ends
code segment
assume cs:code,ss:stack
	main proc far
start:		mov ax,stack
			mov ss,ax
			mov sp,offset tos
			mov cx,10
			mov ax,cx
			push cx
			mov cl,3
			shl ax,cl
			pop cx
			shl cx,1
			add cx,ax
			
			mov ax,4c00h
			int 21h
main endp
code ends
	end start