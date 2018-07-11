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
		;处理最高的进位
		mov ah,0
		mov al,four_byte
		mov cl,2
		shl ax,cl
		mov five1_byte,ah
		
		mov ah,four_byte
		mov al,three_byte
		shl ax,cl
		mov four1_byte,ah
		
		mov ah,three_byte
		mov al,two_byte
		shl ax,cl
		mov three1_byte,ah
		
		mov ah,two_byte
		mov al,one_byte
		shl ax,cl
		mov two1_byte,ah
		mov one1_byte,al
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
	
		