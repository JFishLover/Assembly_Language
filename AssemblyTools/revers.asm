data segment
	string db 'happy!','$'
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
		
		mov bx,offset string
		push bx
		call revers
		pop bx
		mov dl,[bx]
		mov ah,2
		int 21h
		
		mov ax,4c00h
		int 21h
main endp

revers proc near
		push ax
		push bx
		push dx
		push bp
		mov bp,sp
		mov bx,[bp+10]
		mov al,[bx]
		cmp al,'$'
		jne re_call
		jmp return
re_call:inc bx
		push bx
		call revers
		pop bx
		mov dl,[bx]
		mov ah,2
		int 21h
return:	pop bp
		pop dx
		pop bx
		pop ax
		ret
revers endp
code ends
	end start 
		