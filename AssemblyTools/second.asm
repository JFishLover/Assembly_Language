assume cs:BoyXiao

BoyXiao segment
	mov ax,1234h
	mov bx,3456h

	add ax,bx
	add bx,ax

	mov ax,4c00h
	int 21h

BoyXiao ends

end