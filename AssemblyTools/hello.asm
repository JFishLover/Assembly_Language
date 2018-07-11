dseg  segment
		Arr DW 1,3,4,5,6,8,9		;数组
    	low_idx    dw  ?           	;下标
    	high_idx  dw  ?
dseg ends
cseg 	segment
main  proc near
   		assume cs: cseg, ds: dseg, es:dseg
 start: 	push ds
			push ax
			mov  ax, dseg
			mov  ds, ax
			mov  es, ax
			pop  	ax
			cmp ax, es:[di+2] ；和第一个元素比较
         ja     chk_last
         lea   si, es:[di+2]	
         je     exit
         stc			；CF=1
         jmp  exit
chk_last:  
	     mov  si,es:[di]	；si指向最后一个元素
         shl   si,1
         add  si,di
         cmp ax,es:[si]
         jb      search
         je      exit
         stc
         jmp  exit
		 search:  
         mov  low_idx,1
         mov  bx,es:[di]
         mov  high_idx,bx
         mov  bx,di
mid: mov  cx,low_idx
         mov  dx,high_idx
         cmp  cx,dx
         ja       no_match
         add   cx,dx
         shr    cx,1
         mov  si,cx
         shl    si,1
compare: 
         cmp  ax,es:[bx+si]
         je      exit	  ; 	
         ja      higher
	dec   cx
	mov  high_idx,cx
        	jmp   mid
higher: inc    cx
	mov  low_idx,cx
	jmp   mid
no_match:stc
exit:	pop  ds
 	ret
main   endp
cseg     ends
             end start