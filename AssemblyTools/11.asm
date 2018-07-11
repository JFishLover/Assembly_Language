data segment
	arr db 61,65,68,59,60,39,89,71,94,100;3D 41 44 3B 3c 27 59 47 5e 64
	arr1 db 10 dup(0);及格
	arr2 db 10 dup(0);不及格
data ends
code segment
main proc far
	assume cs:code,ds:data
start:	mov ax,data
		mov ds,ax
		
		mov cx,10
		mov si,offset arr
		mov bx,offset arr1
		mov di,offset arr2
		
loop1:	mov al,[si]
		cmp al,0
		jb exit
		cmp al,100
		ja exit
		cmp al,60
		jb sma

big:	mov [bx],al
		inc bx
		inc si
		loop loop1
		jmp exit
sma:	mov [di],al
		inc di
		inc si
		loop loop1

exit:	mov ax,4c00h
		int 21h
main endp
code ends
	end start