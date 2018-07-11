;程序名——ex_movs
;*******************************************************
data	segment		;定义数据段
	source_buffer	db 40 dup('a')
data	ends
;*******************************************************
extra	segment		;定义附加段
	dest_buffer	db 40 dup(?)
extra	ends
;*******************************************************
code	segment		;定义代码段
;----------------------------------------------------------------
main	proc	far		;子程序方式定义主程序
		assume	cs:code,ds:data,es:extra
start:				;标志程序开始执行地址
;设定返回堆栈
		push	ds		;数据段地址入栈
		sub	ax,ax		;ax清零
		push	ax		;0入栈
;设置段寄存器DS
		mov	ax,data	;数据段地址送ax
		mov	ds,ax		;存入ds
;设置段寄存器ES
		mov	ax,extra	;数据段地址送ax
		mov	es,ax		;存入es
		;这里是编写的主程序
		lea	si,source_buffer   ;源操作数偏移地址送si
	       lea	di,dest_buffer       ;目的操作数偏移地址送di
		cld			;设置方向标志DF=0，地址增大
		mov	cx,40		;设置传送数据数量
		rep	movsb	;传送串
		ret			;返回DOS
main	endp			;主程序结束
;----------------------------------------------------------------
code	ends			;代码段结束
;*******************************************************
		end	start		;源程序结束