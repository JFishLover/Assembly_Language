;汇编第二次试验，试列出各种方法，将1234H存入存储器的一个字中
data segment
	var1 dw ?
data ends
code segment
	assume cs:code,ds:data
main proc near
start:	mov ax,data
		mov ds,ax
		mov ax,1234H
		
		mov var1,ax
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start