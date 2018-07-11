prog_seg   segment
         org 100h
         assume cs:prog_seg,ds:prog_seg,ss:prog_seg
main proc near
         mov ax, prog_seg
         mov ds, ax
         mov table, offset ary
         mov table+2, offset count
         mov table+4, offset sum
         mov bx, offset table
         call proadd
         mov ax, 4c00h
         int 21h
main endp
proadd  proc  near
        push  ax
        push  cx
        push  si
        push  di
        mov   si,[bx]
        mov   di, [bx+2]
        mov   cx, [di]
        mov   di, [bx+4]
        xor     ax,ax
next:  add  ax, [si]
        add     si,2
        loop    next
        mov [di], ax
        pop di
        pop si
        pop cx
        pop ax
        ret
proadd  endp
	ary   dw  100 dup(?)
	count dw  100
	sum   dw  ?
	table dw  3 dup(?)
prog_seg  ends
      end main