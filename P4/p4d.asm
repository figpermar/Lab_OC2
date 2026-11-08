%include "../lib/pc_io.inc"

section .data
    mensaje db "abcdefghijklmnopqrstuvwxyz0123456789",0

section .text
    global _start

_start:
    mov ebx, 10
    mov esi, 15

    mov byte [mensaje + ebx + esi], 'Z'

    mov eax, mensaje
    call puts 

    mov eax, 1
    xor ebx, ebx
    int 0x80
    

