extern printf
extern exit
extern scanf
global _start

section .text
_start:

; Вывод первой строки msg
	push msg
	call printf
	
; Ввод x и y 
	push y
	push x
	push input
	call scanf
	add esp,12

; помещаем x и y в регистр и выполняем сравнение
	mov ax,[y]
	mov bx,[x]
	cmp ax,bx
	jNE cycle
	jmp equals
	; Главный цикл, определяющий является ли число 1 больше числа 2
	cycle:
		dec ax
		cmp ax,0
		jE second
		
		cmp ax,bx
		jNE cycle
		
		jmp first
	; Выводит x>y
	first:
		mov eax,[x]
		mov ebx,[y]
		push eax
		push ebx
		push msgFirst
		call printf
		jmp _end
	; Выводит y>x
	second:
		mov eax,[x]
		mov ebx,[y]
		push eax
		push ebx
		push msgSecond
		call printf
		jmp _end
	; Выводит x=y
	equals:
		mov eax,[x]
		mov ebx,[y]
		push eax
		push ebx
		push msgEqual
		call printf
		jmp _end
	; Конец main
	_end: 
		add esp,12	
		push dword 0
		call exit

section .data
	msg:       	db "Enter two numbers",0xA,0
	input:      db "%d%d",0
	msgFirst:  	db "%d > %d",0xA,0
	msgSecond: 	db "%d < %d",0xA,0
	msgEqual:  	db "%d = %d",0xA,0
section .bss
	x resd 1
	y resd 1