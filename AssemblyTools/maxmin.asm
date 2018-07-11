data segment
	org 3000H
	arr db 2,5,8,9,6,3,4,1
data ends
stack segment
	dw 100 dup(?)
	tos label word
stack ends
code segment
main proc far
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
		mov ds,ax
		
		mov ax,stack
		mov ss,ax
		
		mov sp,offset tos
		
		mov si,offset arr
		mov cx,07h
		call maxmin
		
		mov ax,4c00h
		int 21h
main endp
maxmin proc near
		mov al,[si]
		mov bl,al	;bl存储当前最小值,初始为第一个元素
		mov bh,al	;bh存储当前最大值，初始为第一个元素
		
loop1:	inc si
		mov al,[si]
		cmp al,bh
		ja updatamax
		cmp al,bl
		jb updatamin
		jmp goon
updatamax:
		mov bh,al
		jmp goon
updatamin:
		mov bl,al
goon:	loop loop1
		ret
maxmin endp

code ends
	end start