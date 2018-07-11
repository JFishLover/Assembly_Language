;易错点*********写完一段带跳转的汇编指令后不要忘记jmp，防止同时进入不同的分支****************
data segment
	array1 db -1,2,3,4,5,0,2,0,1,-4
data ends
code segment
	assume cs:code,ds:data
main proc far
start:		mov ax,data
			mov ds,ax
			mov cx,10
			mov si,0;存放小于0的个数
			mov di,0;存放大于0的个数
			lea bx,array1
loop1:		cmp byte ptr[bx],0
			jng less_or_equ
			inc di
			jmp goon;易错点*********写完一段带跳转的汇编指令后不要忘记jmp，防止同时进入不同的分支****************
less_or_equ:jz goon;等于0暂时不做处理，便于程序流程设计，最后用减法实现即可
			inc si
goon:		inc bx
			loop loop1
			
			mov bx,10;最后将0的个数存入bx
			sub bx,si
			sub bx,di
			
			mov ax,4c00h
			int 21h
main endp
code ends
	end start
		