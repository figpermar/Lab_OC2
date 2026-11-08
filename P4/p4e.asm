%include "../lib/pc_io.inc"

section .data
    mensaje db "abcdefghijklmnopqrstuvwxyz0123456789", 0

section .text
    global _start

_start:
    mov ebx, 3
    mov esi, 4

    mov byte [mensaje + ebx + esi * 4], '%'
    
    mov eax, mensaje
    call puts

    mov eax, 1
    xor ebx, ebx 
    int 0x80