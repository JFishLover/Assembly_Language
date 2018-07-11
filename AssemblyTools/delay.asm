code segment
	assume cs:code
main proc far
start:	mov dl,'M'
		mov ah,2
		int 21h
		
		call delay
		
		mov dl,'7'
		mov ah,2
		int 21h
		
		mov ax,4c00h
		int 21h
main endp

delay proc near 
	mov cx,0000000011111111b
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