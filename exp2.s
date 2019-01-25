	.file	1 "exp2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,120,$31		# vars= 88, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-120
	sw	$31,116($sp)
	sw	$fp,112($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,108($fp)
	li	$2,17			# 0x11
	sw	$2,32($fp)
	addiu	$2,$fp,40
	li	$3,68			# 0x44
	move	$6,$3
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,13			# 0xd
	sw	$2,36($fp)
	sw	$0,28($fp)
	b	$L2
	nop

$L3:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,112
	addu	$2,$3,$2
	lw	$3,-72($2)
	lw	$2,36($fp)
	addu	$3,$3,$2
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,112
	addu	$2,$4,$2
	sw	$3,-72($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$3,28($fp)
	lw	$2,32($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,108($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,112($sp)
	addiu	$sp,$sp,120
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
