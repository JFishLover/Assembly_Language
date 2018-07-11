data segment
	arr db 1,3,4,5
	max db ?
data ends
code segment
	assume cs:code,ds:data
main proc far
start:	mov ax,data
		mov ds,ax
		mov cx,4
		lea si,arr
		mov al,0
loop1:	cmp al,byte ptr[si]
		ja	donone
		mov al,byte ptr[si]
donone:	inc si
		loop loop1
		
		mov byte ptr max,al
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start