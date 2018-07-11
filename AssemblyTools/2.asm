;汇编第一次试验，查看lee的值
data segment
	PA DW 16
	NN DB 16 DUP(1)
	CO DD 11111111H
	lee EQU $-PA
data ends
code segment
main proc far
	assume cs:code,ds:data
start:	
	mov ax,data
	mov ds,ax
	
	sub bx,bx
	mov bx,lee;将结果送至bx寄存器，调试时查看寄存器内容即可
	
	mov ax,4c00h;返回dos
	int 21h
main endp
code ends
	end start
	