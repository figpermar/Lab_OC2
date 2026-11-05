%include "../LIB/pc_io.inc"

section .data
    mensaje db "abcdefghijklmnopqrstuvwxyz0123456789", 0xA
    longitud equ $ - mensaje

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, longitud
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
