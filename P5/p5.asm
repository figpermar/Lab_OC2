%include "../lib/pc_iox (1)inc"

section .data

section .text
    global _start:

_start:
    

    mov eax, 1
    xor ebx, ebx
    int 0x80
