data segment
	arr db 1,2,3,4,-1,-2,-3,-4,5,0
data ends
stack segment
	db 100 dup(?)
	tos label word
stack ends
code segment
	assume cs:code,ds:data
main proc far
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ax,ss
		
		lea sp,tos;千万不要忘记
		lea bx,arr

		mov cx,9;第一层循环次数
		mov si,0;外层循环指针
loopout:mov di,0;内层循环指针，每一次进入外层循环都要重置
		push cx
		mov cx,9
		sub cx,si
loopin:	mov al,byte ptr[bx+di]
		cmp al,byte ptr [bx+di+1]
		jle donone
		xchg al,byte ptr[bx+di+1]
		mov byte ptr[bx+di],al
donone:	inc di
		loop loopin
		pop cx
		inc si
		loop loopout
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
		
		