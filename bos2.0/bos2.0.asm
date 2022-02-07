extern printf
extern scanf
extern exit
global _start

section .text
_start:
	; Вывод первой строчки общения с пользователем
	push msg
	call printf
	add esp,4
	
	; Ввод x и y
	push y
	push x
	push input
	call scanf
	add esp,12
	
	; Помещаем x и y в регистр и выполняем сравнение
	mov eax,[y]
	mov ebx,[x]
	cmp ebx,eax
	ja First 	; Если первое больше
	jb Second	; Если второе больше
	je Equals	; Если равны
	
	First:
		push eax
		push ebx
		push msgFirst
		call printf
		jmp _end
	Second:
		push eax
		push ebx
		push msgSecond
		call printf
		jmp _end
	Equals:
		push ebx
		push eax
		push msgEqual
		call printf
		jmp _end
	_end:
		add esp,12
		push dword 0
		call exit

section .data
	msg:		db "Enter two numbers",0xA,0
	input:		db "%d%d",0
	msgFirst:	db "%d > %d",0xA,0
	msgSecond:	db "%d < %d",0xA,0
	msgEqual:	db "%d = %d",0xa,0
section .bss
	x resd 1
	y resd 1