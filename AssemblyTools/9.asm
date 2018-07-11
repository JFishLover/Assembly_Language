;定义一个数据段，在数据段定义以fir开始的一个4字节的十六进制数，试将该数左移两位
;存放在以sec开始的五个字节中
data segment
	fir DD 0F3333333h
	sec DD ?
data ends
code segment
assume cs:code,ds:data
main proc near
start:	mov ax,data
		mov ds,ax
		
		one_byte equ byte ptr fir
		two_byte equ byte ptr (fir+1)
		three_byte equ byte ptr (fir+2)
		four_byte equ byte ptr (fir+3)
		
		one1_byte equ byte ptr sec
		two1_byte equ byte ptr (sec+1)
		three1_byte equ byte ptr (sec+2)
		four1_byte equ byte ptr (sec+3)
		five1_byte equ byte ptr (sec+4)
		
		mov dh,four_byte
		mov dl,three_byte
		mov ah,two_byte
		mov al,one_byte
		
		mov bl,0
		
		mov cx,2
		
loop1:	shl bl,1
		shl dh,1
		jnc loop5
		inc bl
loop5:	shl	dl,1
		jnc loop2
		inc dh
loop2:	shl ah,1
		jnc loop3
		inc dl
loop3:	shl al,1
		jnc loop4
		inc ah
loop4: 	loop loop1
	
		mov one1_byte,al
		mov two1_byte,ah
		mov three1_byte,dl
		mov four1_byte,dh
		mov five1_byte,bl
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
	
		