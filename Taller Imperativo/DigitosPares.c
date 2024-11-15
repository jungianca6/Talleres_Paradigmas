#include <stdio.h>

int digitosPares (int num) {
    // Caso base: si el número es 0, no hay más dígitos
    if (num == 0) {
        return 0;
    }
    // Obtener el último dígito
    int last_digit = num % 10;
    // Determinar si es par y agregarlo al recuento
    if (last_digit % 2 == 0) {
        return 1 + digitosPares(num / 10);
    }
    return digitosPares(num / 10);
}

int main() {
    int number;
    printf("Ingrese un número entero positivo: ");
    scanf("%d", &number);

    if (number < 0) {
        printf("El número debe ser positivo.\n");
        return 1;
    }

    int even_digits = digitosPares(number);
    printf("El número %d tiene %d dígitos pares.\n", number, even_digits);
    return 0;
}
