section .text
global _ft_strdup
extern _ft_strlen
extern _malloc
extern _ft_strcpy
_ft_strdup: ; rdi=s1
	call _ft_strlen ; rax=strlen(rdi)
	inc rax
	push rdi
	mov rdi, rax
	call _malloc ; rax = malloc(rdi)
	cmp rax, 0
	je error
	pop rsi
	mov rdi, rax
	call _ft_strcpy
	mov rdi, rsi
	ret
error:
	pop rdi
	ret