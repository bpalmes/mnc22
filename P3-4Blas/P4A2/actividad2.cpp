#include <stdio.h>
#include <iostream>
#include <mkl.h>

#include "Actividad2.h"


void Actividad2::execute() {
	//Vectores Ortogonales
	double A[4] = { 0.0, 8.0, 0.0, 6.0 };
	double B[4] = { 1.0, 0.0, 3.0, 0.0 };
	//Incrementos



	//Producto escalar de dos vectores usamos cblas_ddot calcula producto escalar pasando por parametros el tamaño de los vectores los propios vectores A y B y los incrementos
	double pe = cblas_ddot(4, A, 1, B, 1);
	printf("Producto escalar de dos vectores ortogonales de A y B (siempre es): %lf\n", pe);

	//apartado 2

	double vN[10] = { int('b'), int('r'), int('i'), int('a'), int('n'), 0, 0, 0, 0, };
	double vA[10] = { int('p'), int('a'), int('l'), int('m'), int('e'), int('s'), 0, 0, 0, 0, };

	//Producto de dos vectores y = ax + y
	cblas_daxpy(10, 3, vA, 1, vN, 1);

	printf("Imprimir vector resultante de la suma de los vectores con tu nombre ---->\n");

	for (size_t i = 0; i < 10; i++) {
		std::cout << char(vN[i]) << ' ';
	}
	std::cout << '\n';

	//apartado 3

	double vD[3] = { 24, 7 , 1993 };
	
	//cblas_dnrm2 Calcula la norma de un vector
	int res = int(cblas_dnrm2(3, vD, 1)) % 11;

	printf("mi nota en MNC es: (%i)\n", res);

}