	.file	1 "exp4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	check_prime
	.set	nomips16
	.set	nomicromips
	.ent	check_prime
	.type	check_prime, @function
check_prime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	li	$2,1			# 0x1
	sw	$2,0($fp)
	li	$2,2			# 0x2
	sw	$2,4($fp)
	b	$L2
	nop

$L4:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L3
	nop

	sw	$0,0($fp)
$L3:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L2:
	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L4
	nop

	lw	$2,0($fp)
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	check_prime
	.size	check_prime, .-check_prime
	.align	2
	.globl	convertPrime
	.set	nomips16
	.set	nomicromips
	.ent	convertPrime
	.type	convertPrime, @function
convertPrime:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
$L10:
	lw	$3,48($fp)
	lw	$2,28($fp)
	subu	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,48($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	sw	$2,36($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	check_prime
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L7
	nop

	lw	$2,32($fp)
	b	$L8
	nop

$L7:
	lw	$4,36($fp)
	.option	pic0
	jal	check_prime
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L9
	nop

	lw	$2,36($fp)
	b	$L8
	nop

$L9:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
	b	$L10
	nop

$L8:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	convertPrime
	.size	convertPrime, .-convertPrime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	li	$2,123			# 0x7b
	sw	$2,28($fp)
	lw	$4,28($fp)
	.option	pic0
	jal	check_prime
	nop

	.option	pic2
	beq	$2,$0,$L12
	nop

	li	$2,3			# 0x3
	sw	$2,24($fp)
	b	$L13
	nop

$L12:
	lw	$2,28($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L14
	nop

	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L13
	nop

$L14:
	lw	$2,28($fp)
	andi	$2,$2,0x1
	beq	$2,$0,$L13
	nop

	li	$2,2			# 0x2
	sw	$2,24($fp)
$L13:
	lw	$2,24($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L16
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L17
	nop

	li	$3,1			# 0x1
	bne	$2,$3,$L15
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
	b	$L15
	nop

$L16:
	lw	$4,28($fp)
	.option	pic0
	jal	convertPrime
	nop

	.option	pic2
	sw	$2,28($fp)
	b	$L15
	nop

$L17:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
	nop
$L15:
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
