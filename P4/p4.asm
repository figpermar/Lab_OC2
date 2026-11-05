section .data
    mensaje db "Hola desde syscall nativa de Linux!", 0xA
    longitud equ $ - mensaje

section .text
    global _start

_start:
    ; Llamada al sistema para escribir (sys_write -> eax = 4)
    mov eax, 4          ; Número de syscall para write
    mov ebx, 1          ; Descriptor de archivo 1 (stdout / pantalla)
    mov ecx, mensaje    ; Dirección del texto
    mov edx, longitud   ; Longitud del texto
    int 0x80            ; Disparar la interrupción del kernel

    ; Salida limpia (sys_exit -> eax = 1)
    mov eax, 1
    xor ebx, ebx
    int 0x80