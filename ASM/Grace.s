; This program writes its own source code into Grace_kid.s.
%define KID "Grace_kid.s"
%define SRC "; This program writes its own source code into Grace_kid.s.%1$c%%define KID %3$cGrace_kid.s%3$c%1$c%%define SRC %3$c%4$s%3$c%1$c%%macro FT 0%1$cdefault rel%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cglobal main%1$csection .data%1$ckid: db KID, 0%1$cmode: db %3$cw%3$c, 0%1$csrc: db SRC, 0%1$csection .text%1$cmain:%1$c%2$cpush rbx%1$c%2$clea rdi, [kid]%1$c%2$clea rsi, [mode]%1$c%2$ccall fopen wrt ..plt%1$c%2$ctest rax, rax%1$c%2$cjz .fail%1$c%2$cmov rbx, rax%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [src]%1$c%2$cmov edx, 10%1$c%2$cmov ecx, 9%1$c%2$cmov r8d, 34%1$c%2$clea r9, [src]%1$c%2$cxor eax, eax%1$c%2$ccall fprintf wrt ..plt%1$c%2$cmov rdi, rbx%1$c%2$ccall fclose wrt ..plt%1$c%2$cxor eax, eax%1$c%2$cpop rbx%1$c%2$cret%1$c.fail:%1$c%2$cmov eax, 1%1$c%2$cpop rbx%1$c%2$cret%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c%%endmacro%1$cFT%1$c"
%macro FT 0
default rel
extern fopen
extern fprintf
extern fclose
global main
section .data
kid: db KID, 0
mode: db "w", 0
src: db SRC, 0
section .text
main:
	push rbx
	lea rdi, [kid]
	lea rsi, [mode]
	call fopen wrt ..plt
	test rax, rax
	jz .fail
	mov rbx, rax
	mov rdi, rax
	lea rsi, [src]
	mov edx, 10
	mov ecx, 9
	mov r8d, 34
	lea r9, [src]
	xor eax, eax
	call fprintf wrt ..plt
	mov rdi, rbx
	call fclose wrt ..plt
	xor eax, eax
	pop rbx
	ret
.fail:
	mov eax, 1
	pop rbx
	ret
section .note.GNU-stack noalloc noexec nowrite progbits
%endmacro
FT
