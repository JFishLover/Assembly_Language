code segment
	assume cs:code
main proc far
start:	mov al,0
		mov bx,15
		and bl,9
		cmp bl,9
		jz yes 
		mov al,1
		jmp exit
yes:	mov bl,00
		
exit:	mov ax,4c00h
		int 21h

main endp
code ends
	end start
	