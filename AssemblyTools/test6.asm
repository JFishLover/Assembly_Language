data        segment
buf dw 3         ;求3!
resu dw ?         ;结果保存在resu中
data        ends
stack segment
		dw 100 dup(?)
	tos label word
stack ends
code       segment
       assume   cs:code, ds:data,ss:stack
start:
		mov ax,stack
		mov ss,ax
		
		mov sp,offset tos
		
       mov       ax, data
       mov       ds, ax
       mov ax, buf
       call  fact         ;调用子程序
       mov       resu, dx     ;将结果送入resu
       mov       ah, 4ch       ;返回
       int   21h

fact proc near
       push ax           ;将Ax入栈  现场保护
       cmp       ax, 0           ;比较n是否大于0
       ja     next1           ;如果大于0跳转
       mov dx, 1           ;如果小于或等于0 ，就给dx等于1
       jmp        next2           ;退出
next1:     
       dec  ax              ;n-1>ax
       call  fact            ;调用子程序
       pop        ax              ;n->ax
       mul        dl              ;n*(n-1)!->ax
       mov dx, ax          ;ax->dx
next2:
       ret
fact  endp

 
code ends
    end start
