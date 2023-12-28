#include <stdio.h>

float dodaj(float a, float b);

int main() {
	float a, b;

	printf("Podaj a i b:\n");

	scanf_s("%f %f",&a,&b);

	float wynik = dodaj(a, b);

	printf("Wynik: %f\n", wynik);

	return 0;
}