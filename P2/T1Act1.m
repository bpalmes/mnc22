clc;
clear;


%%Creamos dos matrices aleatorias

M1 = rand(4,4);
M2 = rand(4,4);


%%Multimplicamos las matrices por los dos métodos comprobamos los tiempos y
%%los resultados.

tic;
M3=multMatriz(M1,M2);
t1 = toc;

tic;
M4=multNoMatlab(M1,M2);
t2 = toc;

disp("Matrices multiplicando con matlab = ");
disp(M3);
disp("Tiempo con matlab = ");
disp(t1);

disp("Matrices multiplicando sin matlab = ");
disp(M4);
disp("Tiempo sin matlab = ");
disp(t2);

%%Vamos a hacer diez multiplicaciones y hallar 10 tiempos los metemos en un
%%vector para poder dibujar las gráficas luego

x = [1, 10, 100, 150, 200, 250, 300, 350, 400,450];
Matlab = zeros(1,9);
sinMatlab= zeros(1,9);


for i=1:10
    M1 = rand(x(i), x(i));
    M2 = rand(x(i), x(i));
    
    tic;
    for j=1:10 %% 10 veces para hallar el tiempo medio
        multMatriz(M1,M2);
    end
    t1 = toc;
    Matlab(i) = t1 / 10;
    
    tic;
    for k=1:10
        multNoMatlab(M1,M2);
    end
    t2 = toc;
    sinMatlab(i) = t2 / 10;
    
end

plot(x, Matlab, '-', x, sinMatlab, '-');
title("Multiplicación  MATLAB vs Multiplicacion algoritmo");
legend('MATLAB','Algoritmo');
xlabel("Dimensiones de la matriz ");
ylabel("Tiempo en segundos");
grid on;

%%Funcion que multiplica una matriz por otra que pasa por parametro
function R = multMatriz(M,N)
    R = M*N;
end

%%Multiplicación de matrices tradicional

function C = multNoMatlab(M,N)
    dim = size(M);
    C = zeros(dim(1), dim(2));
    for i=1:dim(1)
        for j=1:dim(1)
            for k=1:dim(1)
                C(i,j) = C(i,j) + (M(i,k) * N(k,j));
            end
        end
    end
end