#include <iostream>
#include <mkl.h>

#include "Actividad3.h"


void Actividad3::execute()
{
	double m[3 * 3] = { 3, 3 ,1, 6, 5, 8, 9, 8, 8 };

	double v1[3] = { 4, 1, 5 };
	double v2[3] = { 2, 1, 9 };

	//vector vacío
	double v3[3] = { 0, 0, 0 };

	//Apartado 1  void cblas_dgemv ( const CBLAS_LAYOUT layout,const CBLAS_TRANSPOSE TransA,const int M, const int N,const double alpha, 
	//const double* A, const int lda,const double* X, const int incX,
	//const double beta, double* Y, const int incY )

	//Resultado de A*x ya que tanto beta como y valen cero
	cblas_dgemv(CblasRowMajor, CblasNoTrans, 3, 3, 1, m, 3, v1, 1, 0, v3, 1);

	printf("Mostramos el resultado de y = A*x ---->\n");
	for (double i : v3)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';

	//Apartado 2 usa dgemv para obtener y = 3*A*x + 4*y

	double alpha = 3;
	double beta = 4;

	printf("Mostramos el resultado de y = 3*A*x + 4*y ---->\n");
	cblas_dgemv(CblasRowMajor, CblasNoTrans, 3, 3, alpha, m, 3, v1, 1, beta, v2, 1);

	for (double i : v2)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';

	printf("Mostramos el resultado de y = 3*A*x + 4*y pero variando los valores del layout y la traspuesta ---->\n");

	//Los valores CblasRowMajor, CblasNoTrans son valores struc dentro de las librerias de blass aquí cambiaremos CblasRowMajor=101 por CblasColMajor=102 y cambiaremos CblasNoTrans=111 por CBlassTrans=112
	//Al usar CblasTrans multiplicamos con la traspuesta así quedaría 3*A*T*x + 4*y
	cblas_dgemv(CblasColMajor, CblasTrans, 3, 3, alpha, m, 3, v1, 1, beta, v2, 1);
	
	//Tambien cambiamos el valor de LDA pero no entiendo muy bien porqué he buscado en internet y suelen usarlo en los ejemplo como el numero de columnas por eso lo he dejado en 3

	for (double i : v2)
	{
		std::cout << i << ' ';
	}
	std::cout << '\n';
}