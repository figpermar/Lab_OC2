; =====================================================================
; pc_io.inc - Versión nativa para Linux (32 bits)
; Emula las funciones clásicas usando syscalls y secuencias ANSI
; =====================================================================

section .data
    _ansi_clear db 0x1B, "[H", 0x1B, "[2J"
    _ansi_clear_len equ $ - _ansi_clear
    _newline    db 0xA

section .text

; --- clrscr: Limpia la pantalla usando secuencias ANSI ---
clrscr:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, _ansi_clear
    mov edx, _ansi_clear_len
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; --- puts: Imprime cadena terminada en 0 apuntada por EAX + salto de línea ---
puts:
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax        ; Copiamos la dirección del mensaje a ESI

    ; Contar la longitud de la cadena hasta encontrar el byte nulo (0)
    xor ecx, ecx
.count_loop:
    mov al, [esi + ecx]
    cmp al, 0
    je .do_print
    inc ecx
    jmp .count_loop

.do_print:
    mov edx, ecx        ; Longitud calculada
    mov ecx, esi        ; Dirección del texto
    mov ebx, 1          ; stdout
    mov eax, 4          ; sys_write
    int 0x80

    ; Imprimir salto de línea automático (como lo hacía la librería original)
    mov eax, 4
    mov ebx, 1
    mov ecx, _newline
    mov edx, 1
    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; --- putchar: Imprime el caracter almacenado en AL ---
putchar:
    push eax
    push ebx
    push ecx
    push edx

    mov [__temp_char], al
    mov eax, 4
    mov ebx, 1
    mov ecx, __temp_char
    mov edx, 1
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

section .bss
    __temp_char resb 1