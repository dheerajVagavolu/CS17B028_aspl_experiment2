	.file	1 "exp5.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.align	2
$LC1:
	.word	5
	.word	4
	.word	3
	.word	2
	.word	1
	.word	3
	.word	2
	.word	4
	.word	5
	.word	4
	.word	7
	.word	6
	.word	4
	.word	5
	.word	3
	.word	1
	.word	3
	.word	2
	.word	4
	.word	5
	.word	4
	.word	3
	.word	5
	.word	4
	.word	3
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,248,$31		# vars= 216, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-248
	sw	$31,244($sp)
	sw	$fp,240($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,236($fp)
	li	$2,5			# 0x5
	sw	$2,32($fp)
	lui	$2,%hi($LC0)
	addiu	$3,$fp,36
	addiu	$2,$2,%lo($LC0)
	li	$4,100			# 0x64
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC1)
	addiu	$3,$fp,136
	addiu	$2,$2,%lo($LC1)
	li	$4,100			# 0x64
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,24($fp)
	b	$L2
	nop

$L5:
	sw	$0,28($fp)
	b	$L3
	nop

$L4:
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,240
	addu	$2,$3,$2
	lw	$4,-204($2)
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,240
	addu	$2,$3,$2
	lw	$2,-104($2)
	addu	$4,$4,$2
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,240
	addu	$2,$3,$2
	sw	$4,-204($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L3:
	lw	$2,28($fp)
	slt	$2,$2,5
	bne	$2,$0,$L4
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$2,24($fp)
	slt	$2,$2,5
	bne	$2,$0,$L5
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,236($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L7:
	move	$sp,$fp
	lw	$31,244($sp)
	lw	$fp,240($sp)
	addiu	$sp,$sp,248
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
