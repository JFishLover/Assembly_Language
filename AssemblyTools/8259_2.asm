stack segment
	emmm dw 100 dup(?)
stack ends
code segment
	assume cs:code,ss:stack
main proc far
start:	
		mov ax,stack
		mov ss,ax
		
		mov dx,0020h
		mov al,00010001b;对主片初始化，上升沿触发
		out dx,al
		
		mov dx,0021h
		mov al,00001000b;设置主片中断类型码00001???
		out dx,al
		
		mov al,00000100b;只有IR2有从片连接
		out dx,al
		
		mov al,00000011b;中断自动结束
		out dx,al
		
		mov al,01101011b;设置主片屏蔽字
		out dx,al
		
		;mov dx,0020h;设置主片中断源优先级，IR2设置为最低优先级
		;mov al,11000010b
		;out dx,al
		
		mov dx,00a0h
		mov al,00010001b;对从片进行初始化，上升沿触发
		out dx,al
		
		mov dx,00a1h
		mov al,00110000b;设置从片中断类型码00110??？
		out dx,al
		
		mov al,00000010b;后三位为010标识码
		out dx,al
		
		mov al,00000011b;中断自动结束
		out dx,al
		
		mov al,11111101b;设置从片屏蔽字
		out dx,al
		jmp exit

serv1:	sti;允许中断嵌套
		mov dl,'M'
		mov ah,2
		int 21h
		
		call delay
		
		mov dl,'7'
		mov ah,2
		int 21h
		iret
		
serv2:
		sti
		mov dl,'S'
		mov ah,2
		int 21h
		
		call delay
		
		mov dl,'1'
		mov ah,2
		int 21h
		iret
		
exit:	
		xor ax,ax
		mov ds,ax
		;将中断服务程序入口地址送到中断向量表
		mov ax,offset serv1
		mov bx,003ch
		mov word ptr[bx],ax
		mov ax,seg serv1
		mov bx,003eh
		mov word ptr[bx],ax
		
		mov ax,offset serv2
		mov bx,00c4h
		mov word ptr[bx],ax
		mov ax,seg serv2
		mov bx,00c6h
		mov word ptr[bx],ax 
waiting:jmp waiting;等待下次中断
		
		mov ax,4c00h
		int 21h
main endp

;延时程序,测试差不多延时6秒
delay proc near 
	mov cx,0011h
loopout:	
	push cx
	mov cx,0111111111111111b
loopin:
	nop
	loop loopin
	pop cx
	loop loopout
	ret
delay endp
code ends
	 end start