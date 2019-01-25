	.file	"exp1_6.c"
	.intel_syntax noprefix
	.text
	.globl	power
	.type	power, @function
power:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32 ; rsi = 7 ; rsp <- rsp - 32
	mov	DWORD PTR [rbp-20], edi ; rdi = 2
	mov	DWORD PTR [rbp-24], esi ; rsi = 7
	mov	eax, DWORD PTR [rbp-24] ; eax <- [rbp-24]
	mov	edx, eax ; edx <- eax ; rax = 4195617 ; rax = 7, rdx = 7
	shr	edx, 31 ; ; rdx = 0
	add	eax, edx ; eax <- eax + edx
	sar	eax ; rax = 3
	mov	edx, eax ; edx <- eax ; rdx = 3
	mov	eax, DWORD PTR [rbp-20] ; eax <- [rbp-20] ; rax = 2
	mov	esi, edx ; esi <- edx ; rsi = 3
	mov	edi, eax ; edi <- eax
	call	power ; function call
	mov	DWORD PTR [rbp-4], eax
	mov	eax, DWORD PTR [rbp-24]
	and	eax, 1
	test	eax, eax
	jne	.L2
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-4]
	jmp	.L3
.L2:
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-20]
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	power, .-power
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	rbp  ; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16 ; rsp <- rsp - 16
	mov	esi, 7 ; esi <- 7
	mov	edi, 2 ; edi <- 2
	call	power ; call power function
	mov	DWORD PTR [rbp-4], eax ; [rbp-4] <- eax
	mov	eax, 0 ; eax = 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
