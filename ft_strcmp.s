section .text
global _ft_strcmp
_ft_strcmp:
    mov rax, 0
	mov rcx, 0
    mov rdx, 0
func:
    mov	dl, byte[rdi+rax]
    cmp	dl, byte[rsi+rax]
    jne return
	cmp dl, 0
	je return
	inc rax
	jmp func

return:
	mov	cl, byte[rsi+rax]
	sub rdx, rcx ; rdx-=rcx
	mov rax, rdx
	ret