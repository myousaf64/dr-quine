%define I 5
; Each child decrements I, writes Sully_I.s, then builds and runs it.
default rel
extern strstr
extern sprintf
extern fopen
extern fprintf
extern fclose
extern system
global main

section .data
self: db __FILE__, 0
tag: db "Sully_", 0
fmt_name: db "Sully_%d.s", 0
fmt_cmd: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o && ./Sully_%1$d", 0
mode: db "w", 0
src: db "%%define I %5$d%1$c; Each child decrements I, writes Sully_I.s, then builds and runs it.%1$cdefault rel%1$cextern strstr%1$cextern sprintf%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$cglobal main%1$c%1$csection .data%1$cself: db __FILE__, 0%1$ctag: db %3$cSully_%3$c, 0%1$cfmt_name: db %3$cSully_%%d.s%3$c, 0%1$cfmt_cmd: db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc Sully_%%1$d.o -o Sully_%%1$d && rm -f Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%1$cmode: db %3$cw%3$c, 0%1$csrc: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$cmain:%1$c%2$cpush rbx%1$c%2$cpush r12%1$c%2$cpush r13%1$c%2$csub rsp, 176%1$c%2$cmov r12d, I%1$c%2$clea rdi, [self]%1$c%2$clea rsi, [tag]%1$c%2$ccall strstr wrt ..plt%1$c%2$ctest rax, rax%1$c%2$cjz .check%1$c%2$cdec r12d%1$c.check:%1$c%2$ctest r12d, r12d%1$c%2$cjs .done%1$c%2$cmov rdi, rsp%1$c%2$clea rsi, [fmt_name]%1$c%2$cmov edx, r12d%1$c%2$cxor eax, eax%1$c%2$ccall sprintf wrt ..plt%1$c%2$cmov rdi, rsp%1$c%2$clea rsi, [mode]%1$c%2$ccall fopen wrt ..plt%1$c%2$ctest rax, rax%1$c%2$cjz .fail%1$c%2$cmov rbx, rax%1$c%2$csub rsp, 8%1$c%2$cpush r12%1$c%2$cmov rdi, rbx%1$c%2$clea rsi, [src]%1$c%2$cmov edx, 10%1$c%2$cmov ecx, 9%1$c%2$cmov r8d, 34%1$c%2$clea r9, [src]%1$c%2$cxor eax, eax%1$c%2$ccall fprintf wrt ..plt%1$c%2$cadd rsp, 16%1$c%2$cmov rdi, rbx%1$c%2$ccall fclose wrt ..plt%1$c%2$clea rdi, [rsp + 32]%1$c%2$clea rsi, [fmt_cmd]%1$c%2$cmov edx, r12d%1$c%2$cxor eax, eax%1$c%2$ccall sprintf wrt ..plt%1$c%2$clea rdi, [rsp + 32]%1$c%2$ccall system wrt ..plt%1$c%2$ctest eax, eax%1$c%2$cjnz .fail%1$c.done:%1$c%2$cxor eax, eax%1$c%2$cjmp .end%1$c.fail:%1$c%2$cmov eax, 1%1$c.end:%1$c%2$cadd rsp, 176%1$c%2$cpop r13%1$c%2$cpop r12%1$c%2$cpop rbx%1$c%2$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
main:
	push rbx
	push r12
	push r13
	sub rsp, 176
	mov r12d, I
	lea rdi, [self]
	lea rsi, [tag]
	call strstr wrt ..plt
	test rax, rax
	jz .check
	dec r12d
.check:
	test r12d, r12d
	js .done
	mov rdi, rsp
	lea rsi, [fmt_name]
	mov edx, r12d
	xor eax, eax
	call sprintf wrt ..plt
	mov rdi, rsp
	lea rsi, [mode]
	call fopen wrt ..plt
	test rax, rax
	jz .fail
	mov rbx, rax
	sub rsp, 8
	push r12
	mov rdi, rbx
	lea rsi, [src]
	mov edx, 10
	mov ecx, 9
	mov r8d, 34
	lea r9, [src]
	xor eax, eax
	call fprintf wrt ..plt
	add rsp, 16
	mov rdi, rbx
	call fclose wrt ..plt
	lea rdi, [rsp + 32]
	lea rsi, [fmt_cmd]
	mov edx, r12d
	xor eax, eax
	call sprintf wrt ..plt
	lea rdi, [rsp + 32]
	call system wrt ..plt
	test eax, eax
	jnz .fail
.done:
	xor eax, eax
	jmp .end
.fail:
	mov eax, 1
.end:
	add rsp, 176
	pop r13
	pop r12
	pop rbx
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
