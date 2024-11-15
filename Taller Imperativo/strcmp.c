#include <stdio.h>

int strcmp(char *s, char *p) {
    // Recorre ambos strings usando punteros
    while (*s && (*s == *p)) {
        s++;
        p++;
    }

    // Devuelve la diferencia entre los caracteres donde difieren
    return *(unsigned char *)s - *(unsigned char *)p;
}

int main() {
    char str1[] = "Hola";
    char str2[] = "Hola";
    char str3[] = "Hol";
    char str4[] = "Holb";

    printf("Comparación de 'Hola' y 'Hola': %d\n", strcmp(str1, str2));
    printf("Comparación de 'Hola' y 'Hol': %d\n", strcmp(str1, str3));
    printf("Comparación de 'Hol' y 'Hola': %d\n", strcmp(str3, str1));
    printf("Comparación de 'Hola' y 'Holb': %d\n", strcmp(str1, str4));

    return 0;
}
