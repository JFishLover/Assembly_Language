branch_addresses  segment
       branch_table     dw  routine_1
                    	dw  routine_2
              			dw  routine_3
              			dw  routine_4
              			dw  routine_5
              			dw  routine_6
              			dw  routine_7
              			dw  routine_8
branch_addresses  ends
procedure_select   segment
main  proc  far
   assume  cs: procedure_select ,ds: branch_addresses 
start:
		mov  bx, branch_addresses 
		mov  ds,bx
		cmp  al,0
		je       continue_main_line
		mov  si,0
loop1:	shr    al,1
		jnc    not_yet
        jmp   branch_table[si] 
		
not_yet: add  si,type branch_table
		jmp  loop1
continue_main_line:
		mov bx,0
		jmp exit
	  	
routine_1: 	
		mov bx,1
		jmp exit
routine_2: 	
		mov bx,2
		jmp exit
routine_3: 	
		mov bx,3
		jmp exit
routine_4: 	
		mov bx,4
		jmp exit
routine_5: 	
		mov bx,5
		jmp exit
routine_6: 	
		mov bx,6
		jmp exit
routine_7: 	
		mov bx,7
		jmp exit
routine_8: 	
		mov bx,8
		jmp exit		

exit:	mov ax,4c00h
		int 21h
main endp
procedure_select   ends
     	end   start
