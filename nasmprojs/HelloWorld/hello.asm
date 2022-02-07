extern printf
extern exit
global _start

section .text
_start:
	push msg
	call printf
	add esp, 4
	push dword 0
	call exit

section .data
msg:	db 'hello world',0xA,0