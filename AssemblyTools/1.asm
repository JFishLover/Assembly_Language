;编写程序，比较两个字符串STRING1和STRING2所含的字符是否相同，
;若相同则显示“MATCH”，否则则显示“NO MATCH”。
;编译链接后，根据所定义的字符串的情况用debug观察程序的运行结果是否正确，
;并且会用debug修改字符串的值，以便检查程序的两个分支是否都能正确运行。
data segment
	string1 db 'hit'
	length1 equ $-string1 
	str_match db 'MATCH$'
	str_nomatch db 'NO MATCH$'
data ends
extra segment
	string2 db 'hit'
	length2 equ $-string2
extra ends
code segment
main proc far
	assume cs:code,ds:data,es:data
start:	
		mov ax,data
		mov ds,ax
		
		mov ax,extra
		mov es,ax
		
		mov ax,length1
		mov bx,length2
		;比较字符串长度是否相等
		cmp ax,bx
		jnz nomatch		;长度不相等直接不匹配
		lea si,string1
		lea di,string2
		cld
		mov cx,length1
		repe cmpsb		;居然忘记指定比较类型了，啊啊啊啊;相等继续比较
		;字符串比较结束，由于经过了长度比较之后，ZF=1，这时如果ZF=0，表示不相等，否则就相等
		jnz nomatch
		;执行到这里表示两个字符串是相同的
		mov dx,offset str_match
		mov ah,9
		int 21h	
		jmp exit
nomatch:mov dx,offset str_nomatch
		mov ah,9
		int 21h
exit:	mov ax,4c00h
		int 21h
main endp
code ends
	end start