;输入数字，显示对应月份英文
data segment
	mon1 db 'January$'
	org 0010
	mon2 db 'Febuary$'
	org 0020
	mon3 db 'March$'
	
	org 0090
	mon10 db 'October$'
	org 0100
	mon11 db 'November$'
	org 0110
	mon12 db 'December$'
data ends
code segment
	assume cs:code,ds:data
main proc far
	
start:	mov ax,data
		mov ds,ax
again:	mov cx,0
		mov ah,1
		int 21h
		sub al,'0'
		cmp al,0
		jg one
		jmp input
one:	mov cx,10
input:	mov ah,1
		int 21h
		sub al,'0'
		add cl,al
		cmp cx,1
		jz yiyue
		cmp cx,2
		jz eryue
		cmp cx,3
		jz sanyue
		cmp cx,10
		jz shiyue
		cmp cx,11
		jz shiyiyue
		cmp cx,12
		jz shieryue
		jmp exit
		
yiyue:  mov dx,offset mon1
		mov ah,9
		int 21h
		jmp exit
eryue:  mov dx,offset mon2
		mov ah,9
		int 21h
		jmp exit
sanyue:	mov dx,offset mon3
		mov ah,9
		int 21h
		jmp exit
shiyue: mov dx,offset mon10
		mov ah,9
		int 21h
		jmp exit
shiyiyue:mov dx,offset mon11
		mov ah,9
		int 21h
		jmp exit
shieryue:mov dx,offset mon12
		mov ah,9
		int 21h
		jmp exit

exit:	;换行
		mov dl,0dh
		mov ah,2
		int 21h
		mov dl,0ah
		mov ah,2
		int 21h
		jmp again
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
