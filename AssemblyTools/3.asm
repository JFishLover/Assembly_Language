;汇编第一次实验第2题，编写程序测试BL寄存器bit0和bit3是否同时为1，若是则将00H送BL，否则将01H送AL
data segment

data ends

code segment
main proc far
	assume cs:code,ds:data，es:data
start:	mov ax,data
		mov ds,ax
		
		;mov ax,data
		mov es,ax
				
		clc
		shr bl,1
		jnc fail
		shr bl,1
		shr bl,1
		clc
		shr bl,1
		jnc fail
		mov bl,00H
		jmp exit
fail:	mov al,01H
		
exit:	push ax
		mov ax,4c00H
		int 21h
		pop ax
main endp
code ends
	end start
		