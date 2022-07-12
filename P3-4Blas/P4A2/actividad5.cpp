#include "Actividad5.h"
#include <cmath>
#include <ctime>
#include <mkl.h>
#include <iostream>


//Incompleta, no se que son los gFlops ni como calcularlos

void Actividad5::execute(int N)
{
	
	//Generacion de matrices aleatorias y reserva de espacio
	double* A = (double*)mkl_malloc(N * N * sizeof(double), 64);
	double* B = (double*)mkl_malloc(N * N * sizeof(double), 64);
	double* C = (double*)mkl_malloc(N * N * sizeof(double), 64);

	for (int i = 0; i < N * N; ++i)
	{
		A[i] = (double)rand() / (double)100;
		B[i] = (double)rand() / (double)100;
		C[i] = (double)rand() / (double)100;
	}


	//100 Veces C = A*B
	for (int i = 0; i < 100; ++i)
	{
		cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1, A, N, B, N, 0, C, N);
	}
	

	mkl_free(A);
	mkl_free(B);
	mkl_free(C);
}