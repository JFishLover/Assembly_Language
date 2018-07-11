data segment
	arr dw 1,2,3,4,5,6,7,8
	count dw 8
	sum dw ?
data ends
code segment
	assume cs:code,ds:data
main proc far
start:	mov ax,data
		mov ds,ax
		
		call arrnum
		
		mov ax,4c00h
		int 21h

main endp

arrnum proc near
		mov ax,0;
		mov cx,count
		lea bx,arr
		mov si,0
loop1:	add ax,[bx+si];明明是用的AX寄存器，居然加到了DX寄存器中
		add si,2;又把这一句给忘了，清楚自己要做什么
		loop loop1
		mov sum,ax
		ret
arrnum endp

code ends
	end start