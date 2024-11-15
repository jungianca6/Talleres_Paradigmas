#include <stdio.h>

double kmToMillas () {
    printf("Kilómetros a Millas:\n");
    for (int km = 1; km <= 10; km++) {
        double miles = km * 0.621371;
        printf("%d km = %.2f millas\n", km, miles);
    }
    return 0;
}

int main() {
    kmToMillas();
    return 0;
}
