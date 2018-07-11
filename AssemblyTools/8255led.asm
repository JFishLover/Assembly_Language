porta equ 
portb equ
portd equ 
code segment
	assume cs:code
main proc far
start:	mov al,10010000b
		mov dx,portd
		out dx,al
		
jiance:	mov dx,porta;读入开关状态
		in al,dx
		
		mov dx,portb;输出显示LED
		out dx,al
		call delay 
		jmp jiance
		
		mov ax,4c00h
		int 21h
main endp


;延时0.5ms,按照80386主频12.5MHZ计算
delay proc near 
		push cx
		mov cx,6250
loop1:	nop
		loop loop1
		pop cx
		ret
delay endp

code ends
	 end start