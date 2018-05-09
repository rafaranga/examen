SYS_SALIDA equ 1
SYS_LEE equ 3
SYS_PRINT equ 4
STDIN equ 0
STDOUT equ 1

segment .data

segment .bss
  num1 resb 2 ;se reserva un espacio en memoria para apoyo

section  .text
  global _start  
_start:  

mov di, 2
mov esi,3
while:

    cmp esi,1 ; compara si el numero dado es igual a uno si ese es el caso sale del while
    jz salir
    
    mov eax,esi
    mov edx, 0
    div edi

    cmp dx,0; compara si el residuo es cero si es asi es par y salta a la etiqueta es par si no
   je espar ; quiere decir que es impar y continua


;*********** bloque que se ejecuta si es impar **********************************************
  ;MULTIPLICACION
  mov eax, esi
    
  mov ebx, 3

  mul ebx;por defecto multiplica el contenido almacenado en eax con lo almecenado en 
         ;un registro especificado y el resultado lo almacenará en eax(siempre siempre)

  
  inc eax

  mov esi,eax
  add esi,'0'
  mov [num1],esi
  mov eax, SYS_PRINT
  mov ebx, STDOUT
  mov ecx, num1
  mov edx, 1
  int 0x80

  jmp otracosa


espar:

;DIVISION

mov eax, esi
  xor edx,edx 
  mov ecx, 2; pueba con el valor 2
  ;sub ecx, '0'
   div ecx
   mov esi,eax
  add esi, '0'
  mov [num1], esi
  mov eax, SYS_PRINT 
  mov ebx, STDOUT
  mov ecx, num1
  mov edx, 1
  int 0x80

sub esi,'0'


;-------------------------------

  
  jmp while
otracosa:
  sub esi,'0'

  mov ecx, esi
  jmp while

  

salir:
    mov eax, SYS_SALIDA
  xor ebx, ebx
  int 0x80
