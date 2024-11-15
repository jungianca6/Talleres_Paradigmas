#include <stdio.h>

int digitos (int num) {
    // Caso base: si el número es menor a 10, tiene 1 dígito
    if (num < 10) {
        return 1;
    }
    // Caso recursivo: eliminar el último dígito y contar
    return 1 + digitos(num / 10);
}

int main() {
    int number;
    printf("Ingrese un número entero positivo: ");
    scanf("%d", &number);

    if (number < 0) {
        printf("El número debe ser positivo.\n");
        return 1;
    }

    int digits = digitos(number);
    printf("El número %d tiene %d dígitos.\n", number, digits);
    return 0;
}
