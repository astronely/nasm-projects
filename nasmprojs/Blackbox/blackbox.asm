extern exit
extern scanf
extern printf
extern _magnetics
global _start
;blackbox-02.exe  -- bit or
;blackbox-03.exe  -- multiplication
;blackbox-09.exe  -- division
;blackbox-11.exe  -- bit and 
;blackbox-12.exe  -- bit xor
section .text

_start:
	; request input
	push msg
	call printf
	add esp,4
	
	; input
	push y
	push x
	push input
	call scanf
	add esp,12
	
	; moving x and y
	
	; calling our imported function
	push dword [y]
	push dword [x]
	call _magnetics
	add esp,8
	; our answer will be in ecx
	
	mov ecx,eax
	; considering the result and comparing
	
		; isn't it summary?
		mov eax,[x]
		add eax,[y]
		cmp eax,ecx
		je summary
		
		; isn't it difference?
		mov eax,[x]
		sub eax,[y]
		cmp eax,ecx
		je difference
		
		; isn't it multiplication?
		mov eax,[x]
		mov bx, [y]
		mul bx
		cmp eax,ecx
		je multiplication
		
		; isn't it division?
		mov eax,[x]
		mov bx, [y]
		div bx
		cmp eax,ecx
		je division
		
		; isn't it remainder?
		
		mov eax,[x]
		mov bx, [y]
		div bx
		cmp edx,ecx
		je remainder
		
		; isn't it bit and?
		
		mov eax,[x]
		mov ebx,[y]
		and eax,ebx
		cmp eax,ecx
		je land
		
		; isn't it bit or?
		mov eax,[x]
		mov ebx,[y]
		or eax,ebx
		add esp,8
		cmp eax,ecx
		je lor
		
		; isn't it bit xor?
		mov eax,[x]
		mov ebx,[y]
		xor eax,ebx
		cmp eax,ecx
		je lxor
		
	; print out result
	summary:
		push eax
		push msgSum
		call printf
		jmp _end
		
	difference:
		push eax
		push msgDif
		call printf
		jmp _end
	
	multiplication:
		push eax
		push msgMult
		call printf
		jmp _end
	
	division:
		push eax
		push msgDiv
		call printf
		jmp _end
	
	remainder:
		push edx
		push msgRem
		call printf
		jmp _end
		
	land:
		push msgAnd
		call printf
		jmp _end
		
	lor:
		push msgOr
		call printf
		jmp _end
		
	lxor:
		push msgXor
		call printf
		jmp _end
	
	
	
	; end
	_end:
		add esp,8
		push dword 0
		call exit

section .data
	msg:	db "Enter two numbers: ", 0xa,0
	msg1:	db "%d", 0xA, 0
	msg2:	db "%d %d", 0xA,0
	input:	db "%d%d",0
	output:	db "%d",0xa,0
	msgSum: db "Operation is summary, result = %d",0xa,0
	msgDif:	db "Operation is Difference, result = %d",0xa,0
	msgMult:db "Operation is Multiplication, result = %d",0xa,0
	msgDiv:	db "Operation is Division, result = %d",0xa,0
	msgRem:	db "Operation is Remainder, result = %d",0xa,0
	msgAnd:	db "Operation is bit and",0xa,0
	msgOr:	db "Operation is bit or",0xa,0
	msgXor:	db "Operation is bit xor",0xa,0
	

section .bss
	x resd 1
	y resd 1
	
	