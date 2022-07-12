#include "Actividad4.h"

#include <cstdio>
#include <iostream>
#include <mkl.h>

void Actividad4::execute()
{
	double m1[3 * 3] = { 3, 4 ,1, 4, 5, 4, 3, 2, 7 };
	double m2[3 * 3] = { 2, 2 ,1, 6, 2, 4, 9, 2, 7 };
	double m3[3 * 3] = { 3, 1 ,1, 8, 5, 4, 3, 1, 1 };

	double m0[3 * 3] = { 0, 0 ,0, 0, 0, 0, 0, 0, 0 };

	//void cblas_dgemm ( const CBLAS_LAYOUT layout,
	//const CBLAS_TRANSPOSE TransA,
		//const CBLAS_TRANSPOSE TransB,
		//const int M, const int N, const int K,
		//const double alpha, const double* A, const int lda,
		//const double* B, const int ldb,
		//const double beta, double* C, const int ldc )

	//lda ldb y ldc cmo suponíamos suele coincidir con el numero de columnas
	printf("Mostramos el resultado de C = A*B ---->\n");
	//C = A*B
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 3, 3, 3, 1, m1, 3, m2, 3, 0, m0, 3);
	for (double i : m0)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';

	printf("Mostramos el resultado de C = A*Bt ---->\n");
	//C = A*Bt	
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasTrans, 3, 3, 3, 1, m1, 3, m2, 3, 0, m0, 3);
	for (double i : m0)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';
	printf("Mostramos el resultado de C = A*B +3*C ---->\n");
	//C = 2*A*B + 3*C
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 3, 3, 3, 2, m1, 3, m2, 3, 3, m3, 3);
	for (double i : m3)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';
}