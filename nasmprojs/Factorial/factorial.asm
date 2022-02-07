global _start

extern exit
extern scanf
extern printf

section .text

; Функция Main
_start:
	push msg
	call printf
	add esp, 4
	
	push a
	push input
	call scanf
	add esp, 8
	
	mov bl,[a]
	call f
	
	mov [fact], ax
	mov ecx, [fact]
	
	push ecx
	push output
	call printf
	add esp, 8
	
	push dword 0
	call exit


f:
	cmp bl,1
	jg g
	mov ax,1
	ret
		
g:
	dec bl
	call f
	inc bl
	mul bl
	ret

section .data
	msg: db "Enter number: ",0xA,0
	input: db "%d",0
	output: db "%d",0xA,0
	
section .bss
	a resd 1
	fact resd 1