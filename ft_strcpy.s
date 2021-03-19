section .text
global _ft_strcpy
_ft_strcpy:
	mov rax, 0
func:
	mov dl, byte[rsi+rax]
	mov byte[rdi+rax], dl
	cmp dl, 0
	je	return
	inc rax
	jmp func
return:
	mov rax, rdi
	ret