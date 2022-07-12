#include <omp.h>
#include <cstdio>
#include <chrono>



void main()
{
	//actividad1();
	//actividad2();

	/*
     *ACTIVIDAD 1 se han comentado las habilidades ya que al hacerlo con metodos daba problemas de compilación
	 *PAra ejecutar descomente
	printf("[COMIENZO]\n");

     #pragma omp parallel num_threads(12)
	{
		int id = omp_get_thread_num();
		int num = omp_get_num_threads();

		if (id == 0) {
			printf("Hola desde el hilo %d --- Soy el hilo maestro, somos %d\n", id, num);
		}
		else {
			printf("Hola desde el hilo %d\n", id);
		}
	}


	printf("[FINAL]\n");
	
	
	
	*/

	/*ACTIVIDAD 2
	* printf("[COMIENZO]\n");

    #pragma omp parallel num_threads(5) // nº de hilos
	{
		int id = omp_get_thread_num();
		int num = omp_get_num_threads();

		double tinicial = omp_get_wtime(); //recogemos en tiempo inicial
		float res = 4.5;
		for (float i = 1; i < 15000000; i++) {
			res = res * i * res;
		}
		double tfinal = omp_get_wtime();
		double tiempo = tfinal - tinicial;

		printf("Operacion hilo nº %d Tiempo = %4.8f segundos el resultado es %4.4f\n", id, tiempo, res);
	}
	//A partir de 5 hilos los tiempos empiezan a variar

	printf("[FINAL]\n");
	*/
	
	/*
	* //Actividad 3
	int tam = 100;
	double* v1 = new double[tam];
	double* v2 = new double[tam];
	double* v3 = new double[tam];

	for (int i = 0; i < tam; i++)
	{
		v1[i] = (double)i;
		v2[i] = 2.0 * (double)i;

	}

    #pragma omp parallel num_threads(4)
	{
		int id = omp_get_thread_num();
		int num = omp_get_num_threads();

     #define CHUNK 10

     #pragma omp for schedule(dynamic, CHUNK) //Al tener un comportamiento dinámico los hilos no esperan a que termeninen otros hilos para comenzar su tarea
		for (int i = 0; i < tam; i++) {
			v3[i] = v1[i] + v2[i];
			printf(" Hilo  %d esta calculando  %f Indice=%d \n ", id, v3[i], i);
		}
	}
	*/

	

	//*******************************************************************************************
	//Cambiamos el numero de iteraciones
	/*
	* //Actividad 4
	printf("[COMIENZO]\n");

	for ( int tam = 100; tam < 10000000 ; tam+= 1) //Bucle for que irá aumentando el tamaño de los vectores para probarlos
	{
		double* v1 = new double[tam];
		double* v2 = new double[tam];
		double* v3 = new double[tam];


		for (int i = 0; i < tam; i++) //preparamos los vectores para la suma como el ej anterior
		{
			v1[i] = (double)i;
			v2[i] = 2.0 * (double)i;

		}

		int chunk = 10;
			double tinicial = omp_get_wtime(); //Rcogemos el tiempo
            #pragma omp parallel num_threads(4)
			{
				int id = omp_get_thread_num();
				int num = omp_get_num_threads();

                #pragma omp for schedule(static, chunk) //Estatico

				for (int i = 0; i < tam; i++) {
					v3[i] = v1[i] + v2[i];

				}

				
				
			}

		//Mostramos el tiempo que tarda cada periodo chunk

			double tfinal = omp_get_wtime();
			double tiempo = tfinal - tinicial;

			printf("Tiempo  con tamaño  %d  y  %d iteraciones: %f\n", tam, chunk, tiempo);
			tam = tam * 10;
	}
	* for (int tam = 100; tam < 10000000; tam += 1) //Bucle for que irá aumentando el tamaño de los vectores para probarlos
	{
		double* v1 = new double[tam];
		double* v2 = new double[tam];
		double* v3 = new double[tam];


		for (int i = 0; i < tam; i++) //preparamos los vectores para la suma como el ej anterior
		{
			v1[i] = (double)i;
			v2[i] = 2.0 * (double)i;

		}

		int chunk = 1000;
		double tinicial = omp_get_wtime(); //Rcogemos el tiempo
        #pragma omp parallel num_threads(4)
		{
			int id = omp_get_thread_num();
			int num = omp_get_num_threads();

        #pragma omp for schedule(static, chunk) //Estatico

			for (int i = 0; i < tam; i++) {
				v3[i] = v1[i] + v2[i];

			}



		}

		//Mostramos el tiempo que tarda cada periodo chunk

		double tfinal = omp_get_wtime();
		double tiempo = tfinal - tinicial;

		printf("Tiempo  con tamaño  %d  y  %d iteraciones: %f\n", tam, chunk, tiempo);
		tam = tam * 10;
	}

	printf("[FINAL]\n");
	*/

/*
 //Actividad 5
	int tam = 100;
	double* v1 = new double[tam];
	double* v2 = new double[tam];
	double* v3 = new double[tam];
	double* v4 = new double[tam];

	for (int i = 0; i < tam; i++) //preparamos los vectores para la suma como el ej anterior
	{
		v1[i] = (double)i;
		v2[i] = 2.0 * (double)i;

	}

    #pragma omp parallel num_threads(4) //Cambiar para probar las preguntas de la práctica 6
	{
		int id = omp_get_thread_num();

        #pragma omp sections nowait
		{
            #pragma omp section  //Un hilo suma
			{
				for (int i = 0; i < tam; i++) {
					v3[i] = v1[i] + v2[i];
					printf("Hilo %d  la suma me da %f (indice=%d)\n", id, v3[i], i);
				}
			}
            #pragma omp section //El otro hilo multiplica
			{
				for (int i = 0; i < tam; i++) {
					v4[i] = v2[i] * v1[i];
					printf("Hilo %d  la multiplicacion me da %f (indice=%d)\n", id, v4[i], i);
				}
			}
		}
	}
 
 */

 //Actividad 6
	int tam = 100;
    double* v1 = new double[tam];
    double* v2 = new double[tam];
    double* v3 = new double[tam];
    double* v4 = new double[tam];

    for (int i = 0; i < tam; i++) //preparamos los vectores para la suma como el ej anterior
     {
	v1[i] = (double)i;
	v2[i] = 2.0 * (double)i;

     }

    #pragma omp parallel num_threads(4) //Cambiar para probar las preguntas de la práctica 6
    {
	int id = omp_get_thread_num();

    #pragma omp sections nowait
    {
    #pragma omp section  //Un hilo suma
    {
		for (int i = 0; i < tam; i++) {
				v3[i] = v1[i] + v2[i];
				printf("Hilo %d  la suma me da %f (indice=%d)\n", id, v3[i], i);
		}
     }
     #pragma omp section //El otro hilo multiplica
	{
		for (int i = 0; i < tam/2; i++) {
				v4[i] = v2[i] * v1[i];
				printf("Hilo %d  la multiplicacion me da %f (indice=%d)\n", id, v4[i], i);
		}
	}
    #pragma omp section  //Un hilo suma
	{
		for (int i = 0; i < tam/2; i++) {
			v3[i] = v1[i] + v2[i];
			printf("Hilo %d  la suma me da %f (indice=%d)\n", id, v3[i], i);
		}
	}
    #pragma omp section //El otro hilo multiplica
	{
		for (int i = 0; i < tam/2; i++) {
			v4[i] = v2[i] * v1[i];
			printf("Hilo %d  la multiplicacion me da %f (indice=%d)\n", id, v4[i], i);
		}
	}
	}
}
    

	std::getchar();
	return;
}
