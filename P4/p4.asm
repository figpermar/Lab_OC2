%include "../lib/pc_io.inc"

section .data
    mensaje db "abcdefghijklmnopqrstuvwxyz0123456789", 0
    mensaje2 db "Hola mundo", 0
    num1 dd 5
    num2 dd 10
    resultado db "El resulatdo es: ", 0

section .text
    global _start

_start:
    call clrscr
    mov eax, mensaje
    call puts

    mov eax, mensaje2
    call puts

    call sumar

    mov ecx, eax

    mov eax, resultado
    call puts
    
    mov eax, ecx
    call puts

    mov eax, 1
    xor ebx, ebx
    int 0x80

sumar:
    mov eax, [num1]
    mov ebx, [num2]
    add eax, ebx
    ret