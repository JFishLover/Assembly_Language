;注意数据的位数啊啊啊啊啊，16位，16位，老是写八位；一定要看清数据位数，看清数据位数
;居然主要操作都没有写，大写的服气
;功能，把arr位置处的数据中的1的个数送至count位置
data segment
	array dw 1234h
	count dw ?
data ends
code segment
main proc far;居然没有定义main函数
	assume cs:code,ds:data
start:	mov ax,data
		mov ds,ax
		
		mov ax,0
		
		mov si,word ptr array
		mov dx,[si]
		mov cx,16
loop1:	test dx,0001h
		jz noadd
		inc ax
noadd:	shr dx,1
		loop loop1
		
		mov word ptr count,ax
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
		