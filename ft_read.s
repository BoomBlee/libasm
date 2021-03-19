section .text
global _ft_read
extern ___error
_ft_read:
	mov rax, 0x2000003
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