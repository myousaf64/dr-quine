; This program prints its own source code.
default rel
extern printf
global main

section .data
msg: db "; This program prints its own source code.%1$cdefault rel%1$cextern printf%1$cglobal main%1$c%1$csection .data%1$cmsg: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$cprint_source:%1$c%2$cpush rbp%1$c%2$clea rdi, [msg]%1$c%2$cmov esi, 10%1$c%2$cmov edx, 9%1$c%2$cmov ecx, 34%1$c%2$clea r8, [msg]%1$c%2$cxor eax, eax%1$c%2$ccall printf wrt ..plt%1$c%2$cpop rbp%1$c%2$cret%1$c%1$cmain:%1$c%2$c; The entry point calls the routine that prints the source.%1$c%2$cpush rbp%1$c%2$ccall print_source%1$c%2$cxor eax, eax%1$c%2$cpop rbp%1$c%2$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
print_source:
	push rbp
	lea rdi, [msg]
	mov esi, 10
	mov edx, 9
	mov ecx, 34
	lea r8, [msg]
	xor eax, eax
	call printf wrt ..plt
	pop rbp
	ret

main:
	; The entry point calls the routine that prints the source.
	push rbp
	call print_source
	xor eax, eax
	pop rbp
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
