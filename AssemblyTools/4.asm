;汇编第一次实验第五题，100个数进行排序
data segment
	arr DB 10 DUP( 6,5,4,2,8,9,1,4,7,23)
	in_id dw 0
	out_id dw 0
data ends
code segment
main proc far
	assume cs:code,ds:data,es:data
start:	mov ax,data
		mov ds,ax
		
		mov es,ax
	
		mov bx,offset arr
		
		mov cx,99
		;push cx
		
loop_out:
		push cx
		mov cx,99
		mov dx,out_id
		sub cx,dx;设置内层循环次数
loop_in:
		mov si,in_id
		mov al,[bx+si];比较前后两个数的大小
		cmp [bx+si+1],al
		js exchange;结果为负转移，需要交换
		add in_id,1
		loop loop_in
		jmp continue
exchange:
		mov si,in_id
		mov al,[bx+si]
		mov dl,[bx+si+1]
		mov [bx+si],dl
		mov [bx+si+1],al
		add in_id,1
		loop loop_in
continue:
		pop cx;判断外层循环是否结束
		mov in_id,0
		add out_id,1
		loop loop_out
		
		mov ax,4c00h
		int 21h
main endp
code ends
	end start
		