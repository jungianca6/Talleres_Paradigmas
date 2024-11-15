#include <stdio.h>

void strcat(char *dest, char *src) {
    // Mueve el puntero dest al final de la cadena actual
    while (*dest) {
        dest++;
    }

    // Copia los caracteres de src al final de dest
    while (*src) {
        *dest = *src;
        dest++;
        src++;
    }

    // Añade el carácter nulo al final de la cadena concatenada
    *dest = '\0';
}

int main() {
    char str1[] = "Hola ";
    char str2[] = "Mundo";

    strcat(str1, str2);
    printf("Resultado de strcat: %s\n", str1);
    return 0;
}

