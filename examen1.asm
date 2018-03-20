section .data
	mensaje db 0xA,0xD,"el resultado de la integral es : ",0xA,0xD
	tamanio equ $ -mensaje
section .bss
	resultado1 resb 1
	resultado2 resb 1
	resultado3 resb 1
	resultadofinal resb 1
section .text
global _start
	_start:

		mov eax,4
		mov ebx,1 
		mov ecx,mensaje
		mov edx,tamanio
		int 0x80
;---------- parte integracion-------
;---------primera parte-------------
		mov eax,4
		mov ebx,2

		mul ebx
		add eax,'0'
		mov [resultado1],eax
;----------segunda parte------------

		mov eax,2
		mov ebx,3
		mov ecx,2

		mul eax
		mul ebx
		div ecx
		add eax,'0'

		mov [resultado2],eax
;---------tercera parte -----------

		mov eax,-2
		mov ebx,-2

		imul eax
		imul ebx
		add eax,'0'

		mov [resultado3],eax
;----------operacion final----------
		
		mov eax,[resultado1]
		mov ebx,[resultado2]
		mov ecx,[resultado3]

		add eax,ebx
		sub eax,ecx
		
		mov[resultadofinal],ebx
;---------impresión de resultado----
		mov eax,4
		mov ebx,1 
		mov ecx,resultadofinal
		mov edx,1
		int 0x80


;-----------paryte final------------
		mov ebx,1
		int 0x80