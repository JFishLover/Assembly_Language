;定义一个数据段，在数据段偏移地址100H单元中存放内容为0F200H和3000H的两个地址
;他们是一个变量的偏移地址和段地址，试编程把该变量装入AX中。
data segment 
	org 100H
var DD 0F200H,3000H
data ends
extra segment
	org 0F200H
var2 db 255
extra ends

code segment
	assume cs:code,ds:data,es:extra
main proc near
start:	mov ax,data
		mov ds,ax
		
		mov ax,3000H
		mov es,ax
		
		one_word equ word ptr var
		
		mov bx,one_word
		mov ax,es:[bx]
	
		mov ax,4c00H
		int 21H
main endp
code ends
	end start

	