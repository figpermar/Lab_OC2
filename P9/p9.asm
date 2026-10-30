section .text
    global suma
    global mystrcmp
    global mystrlen
    global getBit
    global setBit

; =========================================================================
; 1. int suma(int num1, int num2)
; Retorna la suma de dos enteros.
; =========================================================================
suma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]   ; Cargar num1
    add eax, [ebp + 12]  ; Sumar num2

    pop ebp
    ret

; =========================================================================
; 2. int mystrcmp(char *str1, char *str2)
; Compara dos cadenas. Retorna 0 si son iguales, 1 si son diferentes.
; =========================================================================
mystrcmp:
    push ebp
    mov ebp, esp
    push esi
    push edi

    mov esi, [ebp + 8]   ; Apuntador a str1
    mov edi, [ebp + 12]  ; Apuntador a str2

.loop_cmp:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne .diferentes
    test al, al          ; Verificar fin de cadena ('\0')
    je .iguales
    inc esi
    inc edi
    jmp .loop_cmp

.iguales:
    xor eax, eax         ; Retornar 0 (iguales)
    jmp .fin_cmp

.diferentes:
    mov eax, 1           ; Retornar 1 (diferentes)

.fin_cmp:
    pop edi
    pop esi
    pop ebp
    ret

; =========================================================================
; 3. int mystrlen(char *str)
; Retorna la cantidad de caracteres de una cadena.
; =========================================================================
mystrlen:
    push ebp
    mov ebp, esp
    push edi

    mov edi, [ebp + 8]   ; Apuntador a la cadena
    xor eax, eax         ; Contador de longitud en 0

.loop_len:
    mov cl, [edi + eax]
    test cl, cl
    je .fin_len
    inc eax
    jmp .loop_len

.fin_len:
    pop edi
    pop ebp
    ret

; =========================================================================
; 4. int getBit(int value, int numbit)
; Retorna el valor del bit (0 o 1) en la posición numbit de value.
; =========================================================================
getBit:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]   ; value
    mov ecx, [ebp + 12]  ; numbit

    shr eax, cl          ; Desplazar a la derecha numbit veces
    and eax, 1           ; Aislar el bit menos significativo

    pop ebp
    ret

; =========================================================================
; 5. int setBit(int value, int numbit)
; Retorna el valor de value con el bit en la posición numbit puesto en 1.
; =========================================================================
setBit:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]   ; value
    mov ecx, [ebp + 12]  ; numbit

    mov edx, 1
    shl edx, cl          ; Crear máscara con 1 en la posición numbit
    or eax, edx          ; Activar el bit (OR lógico)

    pop ebp
    ret
