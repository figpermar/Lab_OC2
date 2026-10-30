#include <stdio.h>

// Declaración de funciones externas escritas en ensamblador
extern int suma(int num1, int num2);
extern int mystrcmp(char *str1, char *str2);
extern int mystrlen(char *str);
extern int getBit(int value, int numbit);
extern int setBit(int value, int numbit);

int main() {
    printf("========================================\n");
    printf("    PRUEBAS DE FUNCIONES EN ENSAMBLADOR  \n");
    printf("========================================\n\n");

    // 1. Prueba de suma
    int resultado_suma = suma(15, 27);
    printf("1. suma(15, 27)\n");
    printf("   Resultado: %d | Esperado: 42\n\n", resultado_suma);

    // 2. Prueba de mystrcmp
    char *s1 = "Laboratorio";
    char *s2 = "Laboratorio";
    char *s3 = "Arquitectura";
    printf("2. mystrcmp()\n");
    printf("   mystrcmp(\"Laboratorio\", \"Laboratorio\") = %d (Esperado: 0)\n", mystrcmp(s1, s2));
    printf("   mystrcmp(\"Laboratorio\", \"Arquitectura\") = %d (Esperado: 1)\n\n", mystrcmp(s1, s3));

    // 3. Prueba de mystrlen
    char *cadena = "Sistemas Operativos";
    printf("3. mystrlen(\"Sistemas Operativos\")\n");
    printf("   Resultado: %d | Esperado: 19\n\n", mystrlen(cadena));

    // 4. Prueba de getBit
    // El número 5 en binario es ...0101 (bit 0 = 1, bit 1 = 0, bit 2 = 1)
    printf("4. getBit(5, numbit)\n");
    printf("   getBit(5, 0) = %d (Esperado: 1)\n", getBit(5, 0));
    printf("   getBit(5, 1) = %d (Esperado: 0)\n", getBit(5, 1));
    printf("   getBit(5, 2) = %d (Esperado: 1)\n\n", getBit(5, 2));

    // 5. Prueba de setBit
    // Si value = 0 y numbit = 2 -> 0000 -> 0100 (4)
    printf("5. setBit(value, numbit)\n");
    printf("   setBit(0, 2) = %d (Esperado: 4)\n", setBit(0, 2));
    // Si value = 5 (0101b) y numbit = 1 -> 0111b (7)
    printf("   setBit(5, 1) = %d (Esperado: 7)\n", setBit(5, 1));

    printf("========================================\n");
    printf("      PRUEBAS FINALIZADAS CON EXITO     \n");
    printf("========================================\n");

    return 0;
}
