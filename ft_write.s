section .text
global _ft_write
extern ___error
_ft_write:
	mov rax, 0x2000004
	syscall ; if error: rax=error_code
	jc error ; if carry flag != 0
	ret

error:
	push r10
	mov r10, rax ; r10 == error_code
	call ___error ; rax = &errno
	mov [rax], r10 ; *rax = r10
	pop r10
	mov rax, -1
	ret