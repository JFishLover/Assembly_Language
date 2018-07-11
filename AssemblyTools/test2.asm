;二分法查找数组元素与AX比较
extra segment
	arr dw 8,1,2,3,4,5,6,7,8
extra ends
code segment
	assume cs:code,es:extra
main proc far
start:	mov dx,extra
		mov es,dx
		
		mov di,offset arr
		mov dx,es:[di];高位序号
		mov cx,1;低位序号
		cmp dx,cx
		jl fail
		add cx,dx
		shl cx,1
		mov si,cx
		
		