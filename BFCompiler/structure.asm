.equ ROM, 0x0000
.equ RAM, 0x1000
.equ LEDS, 0x2000
.equ WAIT_TIME, 0x0FFF

main:
	addi sp, zero, RAM
	add t0, zero, zero

	addi s0, zero, WAIT_TIME
	slli s0, s0, 10
	addi s0, s0, WAIT_TIME

	;init RAM to 0
	addi t1, zero, RAM
	addi t2, zero, LEDS
ram_init_loop:
	beq t1, t2, ram_init_end
		stw zero, 0(t1)
		addi t1, t1, 4
		br ram_init_loop
ram_init_end:

	;CODE#
	break

print:
	ldw t0, 0(sp)
	andi t0, t0, 0xFF ; We act as if it was a byte
	slli t0, t0, 2
	ldw t1, font_data(t0)
	stw t1, LEDS+4(zero)

	add t1, zero, s0 ; We want to wait
wait:
	addi t1, t1, -1
	bne t1, zero, wait
	ret


font_data:
.word   0x00000001 ; Control sequences
.word   0x00000002
.word   0x00000003
.word   0x00000004
.word   0x00000005
.word   0x00000006
.word   0x00000007
.word   0x00000008
.word   0x00000009
.word   0x0000000A
.word   0x0000000B
.word   0x0000000C
.word   0x0000000D
.word   0x0000000F
.word   0x00000010
.word   0x00000011
.word   0x00000012
.word   0x00000013
.word   0x00000014
.word   0x00000015
.word   0x00000016
.word   0x00000017
.word   0x00000018
.word   0x00000019
.word   0x0000001A
.word   0x0000001B
.word   0x0000001C
.word   0x0000001E
.word   0x0000001F
.word   0x00000020
.word   0x00000021
.word   0x00000022
.word   0x00000000 ; Space
.word   0x00005E00 ; !
.word   0x00000025 ; quotes
.word   0x00000026 ; #
.word   0x00000027 ; $
.word   0x00000028 ; %
.word   0x00000029 ; &
.word   0x0000002A ; '
.word   0x0000002B ; (
.word   0x0000002C ; )
.word   0x0000002D ; *
.word   0x0000002E ; +
.word   0x0000002F ; ,
.word   0x00000030 ; -
.word   0x00000031 ; .
.word   0x00000032 ; /
.word   0x7E427E00 ; 0
.word   0x407E4400 ; 1
.word   0x4E4A7A00 ; 2
.word   0x7E4A4200 ; 3
.word   0x7E080E00 ; 4
.word   0x7A4A4E00 ; 5
.word   0x7A4A7E00 ; 6
.word   0x7E020600 ; 7
.word   0x7E4A7E00 ; 8
.word   0x7E4A4E00 ; 9
.word   0x00000033 ; :
.word   0x00000034 ; ;
.word   0x00000035 ; <
.word   0x00000036 ; =
.word   0x00000037 ; >
.word   0x00000038 ; ?
.word   0x00000039 ; @
.word   0x7E127E00 ; A
.word   0x344A7E00 ; B
.word   0x42423C00 ; C
.word   0x3C427E00 ; D
.word   0x424A7E00 ; E
.word   0x020A7E00 ; F
.word   0x0000003A ; G
.word   0xFF0808FF ; H
.word   0x0000003B ; I
.word   0x0000003C ; J
.word   0x0000003D ; K
.word   0x0000003E ; L
.word   0x0000003F ; M
.word   0x00000040 ; N
.word   0x00000041 ; O
.word   0x00000042 ; P
.word   0x00000043 ; Q
.word   0x00000044 ; R
.word   0x00000045 ; S
.word   0x00000046 ; T
.word   0x7F80807F ; U
.word   0x003FC03F ; V
.word   0xFF4040FF ; W
.word   0x00000047 ; X
.word   0x00000048 ; Y
.word   0x00000049 ; Z
.word   0x0000004A ; [
.word   0x0000004B ; \
.word   0x0000004C ; ]
.word   0x00000070 ; ^
.word   0x00000071 ; _
.word   0x0000004D ; `
.word   0x0000004E ; a
.word   0x0000004F ; b
.word   0x00000050 ; c
.word   0xFCA0A0E0 ; d
.word   0xB8A4A478 ; e
.word   0x00000051 ; f
.word   0x00000052 ; g
.word   0xE02020F8 ; h
.word   0x00000053 ; i
.word   0x00000054 ; j
.word   0x00000055 ; k
.word   0x80FC8400 ; l
.word   0x00000056 ; m
.word   0x00000057 ; n
.word   0xF88888F8 ; o
.word   0x00000058 ; p
.word   0x00000059 ; q
.word   0x001010F0 ; r
.word   0x0000005A ; s
.word   0x0000005B ; t
.word   0x0000005C ; u
.word   0x0000005D ; v
.word   0x0000005E ; w
.word   0x0000005F ; x
.word   0x00000060 ; y
.word   0x00000061 ; z
.word   0x00000062 ; {
.word   0x00000063 ; |
.word   0x00000064 ; }
.word   0x00000065 ; ~
.word   0x00000066 ; DEL