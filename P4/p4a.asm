%include "../lib/pc_io.inc"

section .data
    mensaje db "abcdefghijklmnopqrstuvwxyz0123456789", 0

section .text
    global _start

_start:
    mov ebx, mensaje
    add ebx, 23

    mov byte [ebx], 'X'
    mov eax, mensaje
    call puts 

    mov eax, 1
    xor ebx, ebx
    int 0x80