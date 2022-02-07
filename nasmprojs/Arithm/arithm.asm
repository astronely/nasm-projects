global _start

;Объявляем используемые внешние функции из libc
extern exit
extern scanf
extern printf

;Сегмент кода:
section .text
 
;Функция main:
_start:
 
;Параметры передаются в стеке:
; Вывод строки msg
	push msg
	call printf

;По конвенции Си вызывающая процедура должна
;очищать стек от параметров самостоятельно:
	add esp, 4
 
	push a
	push b
	push msg1
	call scanf
	add esp, 12
 
	mov eax, [a]
	add eax, [b]
 
	push eax
	push msg2
 
	call printf
	add esp, 8
 
;Завершение программы с кодом выхода 0:
	push dword 0
	call exit
 
ret
 
;Сегмент инициализированных данных
section .data
msg  : db "Enter two numbers:",0xA,0
msg1 : db "%d%d",0
msg2 : db "%d", 0xA, 0
 
; Сегмент неинициализированных данных
section .bss
a resd 1
b resd 1