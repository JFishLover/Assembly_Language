porta equ  0600h
portb equ  0602h
portc equ  0604h
portd equ  0606h
data segment
	l1 db 00000000b
	l2 db 00000000b
	l3 db 00000000b
	l4 db 00000000b
data ends
code segment
	assume cs:code,ds:data
main proc far 
start:	
		mov ax,data
		mov ds,ax
		
		mov al,10000001b;写方式控制字
		mov dx,portd
		out dx,al
		
		;PC低四位置1
		mov al,00000001b
		mov dx,portc
		out dx,al
		mov al,00000011b
		out dx,al
		mov al,00000101b
		out dx,al
		mov al,00000111b
		out dx,al
		
		;先让PB输出全0，不让数码管亮
		mov al,00000000b
		mov dx,portb
		out dx,al
		
		mov si,0;将SI作为地址指针
		mov bx,offset l1;将bx作为基址寄存器
		
	
		jmp display;每次测试都让数码管亮
		;PA低四位输出全0
ceshi:	
		mov al,00000000b
		mov dx,porta
		out dx,al
		
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		
		and al,00001111b
		cmp al,00001111b
		jz ceshi
		
		;延时20ms
		call delay
		
		;延时之后再次判断是不是按下了
		mov al,00000000b
		mov dx,porta
		out dx,al
		
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		
		and al,00001111b
		cmp al,00001111b
		jz ceshi
		
		;测试第一列
		mov al,11111110b
		mov dx,porta
		out dx,al
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		and al,00001111b
		cmp al,00001111b
		jnz c1
		
		;相等的话继续检测第二列
		mov al,11111101b
		mov dx,porta
		out dx,al
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		and al,00001111b
		cmp al,00001111b
		jnz c2
		
		;继续检测第三列
		mov al,11111011b
		mov dx,porta
		out dx,al
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		and al,00001111b
		cmp al,00001111b
		jnz c31
		
		;继续检测第四列
		mov al,11110111b
		mov dx,porta
		out dx,al
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		and al,00001111b
		cmp al,00001111b
		jnz c41
		
c1:		test al,00000001b
		;结果为0，说明就是第一行按下的
		jz r1c1
		;结果为0，说明为一行一列，此时数码管显示0，跳转，否则继续检测第二行
		test al,00000010b
		jz r2c1
		;检测第三行
		test al,00000100b
		jz r3c1
		;检测第四行
		test al,00001000b
		jz r4c1
		jmp display
		
		
r1c1:	mov byte ptr[bx+si],3fh
		inc si
		cmp si,4
		jnz dis2;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块
		
r2c1:	mov byte ptr[bx+si],66h
		inc si
		cmp si,4
		jnz dis2;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		

r3c1:	mov byte ptr[bx+si],7fh
		inc si
		cmp si,4
		jnz dis2;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		
		
		
r4c1:	mov byte ptr[bx+si],39h
		inc si
		cmp si,4
		jnz dis2;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
dis2:	jmp display;进入显示模块		
c31:	jmp c3
c41:	jmp c42	


c2:		test al,00000001b
		;结果为0，说明就是第一行按下的
		jz r1c2
		;结果为0，说明为一行二列，此时数码管显示1，跳转，否则继续检测第二行
		test al,00000010b
		jz r2c2
		;检测第三行
		test al,00000100b
		jz r3c2
		;检测第四行
		test al,00001000b
		jz r4c2
		jmp display
		
		
r1c2:	mov byte ptr[bx+si],06h
		inc si
		cmp si,4
		jnz dis1;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块
		
r2c2:	mov byte ptr[bx+si],6dh
		inc si
		cmp si,4
		jnz dis1;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		

r3c2:	mov byte ptr[bx+si],6fh
		inc si
		cmp si,4
		jnz dis1;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		
		
		
r4c2:	mov byte ptr[bx+si],5eh
		inc si
		cmp si,4
		jnz dis1;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块			
c42:	jmp c4		

c3:		test al,00000001b
		;结果为0，说明就是第一行按下的
		jz r1c3
		;结果为0，说明为一行一列，此时数码管显示0，跳转，否则继续检测第二行
		test al,00000010b
		jz r2c3
		;检测第三行
		test al,00000100b
		jz r3c3
		;检测第四行
		test al,00001000b
		jz r4c3
		jmp display
		
		
r1c3:	mov byte ptr[bx+si],5bh
		inc si
		cmp si,4
		jnz dis1;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
dis1:	jmp display;进入显示模块
		
r2c3:	mov byte ptr[bx+si],7dh
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		

r3c3:	mov byte ptr[bx+si],77h
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		
		
		
r4c3:	mov byte ptr[bx+si],79h
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块	
		
		
		
c4:		test al,00000001b
		;结果为0，说明就是第一行按下的
		jz r1c4
		;结果为0，说明为一行一列，此时数码管显示0，跳转，否则继续检测第二行
		test al,00000010b
		jz r2c4
		;检测第三行
		test al,00000100b
		jz r3c4
		;检测第四行
		test al,00001000b
		jz r4c4
		jmp display
		
		
r1c4:	mov byte ptr[bx+si],4fh
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块
		
r2c4:	mov byte ptr[bx+si],07h
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		

r3c4:	mov byte ptr[bx+si],7ch
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块		
		
		
r4c4:	mov byte ptr[bx+si],71h
		inc si
		cmp si,4
		jnz display;si不等于4的话，不对SI进行处理，否则将si设置为0
		mov si,0
		jmp display;进入显示模块	

		
		
		;四个数码管依次显示
display:mov al,[bx+0]
		mov dx,portb
		out dx,al
		;只选通第一个数码管
		mov al,11111110b
		mov dx,porta
		out dx,al
		
		call delay;让第一个数码管电平维持一段时间
		
		mov al,[bx+1]
		mov dx,portb
		out dx,al
		;只选通第二个数码管
		mov al,11111101b
		mov dx,porta
		out dx,al
		
		call delay
		
		mov al,[bx+2]
		mov dx,portb
		out dx,al
		;只选通第三个数码管
		mov al,11111011b
		mov dx,porta
		out dx,al
		
		call delay
		
		mov al,[bx+3]
		mov dx,portb
		out dx,al
		;只选通第四个数码管
		mov al,11110111b
		mov dx,porta
		out dx,al
		
		call delay
		jmp judge
		
judge:	call delay
		;检测本次按键是不是已经结束
		mov al,00000000b
		mov dx,porta
		out dx,al
		
		;检测PC口低四位有没有0
		mov dx,portc
		in al,dx
		
		and al,00001111b
		cmp al,00001111b
		jnz judge;按键尚未释放，继续等待
		jmp ceshi;按键释放才能检测下一次按键
		
		mov ax,4c00h
		int 21h
		
main endp

delay1 proc near
	mov cx,2
loop2:	call delay
	loop loop2
	ret
delay1 endp

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
		