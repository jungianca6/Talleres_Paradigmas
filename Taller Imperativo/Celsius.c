#include <stdio.h>

double celsius_to_fahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

int main() {
    double celsius;
    printf("Ingrese la temperatura en grados Celsius: ");
    scanf("%lf", &celsius);

    double fahrenheit = celsius_to_fahrenheit(celsius);
    printf("%.2f grados Celsius equivalen a %.2f grados Fahrenheit\n", celsius, fahrenheit);
    return 0;
}
