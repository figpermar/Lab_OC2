%include "../lib/pc_io.inc"

section .data
mensaje db "abcdefghijklmnopqrstuvwxyz0123456789", 0

section .text
global _start

_start:
push ebp
mov ebp, esp

call clrscr

mov eax, mensaje
call puts

mov esp, ebp
pop ebp

mov eax, 1
xor ebx, ebx
int 0x80