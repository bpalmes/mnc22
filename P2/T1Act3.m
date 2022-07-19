clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data);


%%Primer caso con valores sigma 0 y 0. Implementamos el calculo de la
%%funcion de costo. Se calcula el tiempo que tardan 5 iteraciones y se saca
%%el tiempo medio

sigma0 = 0;
sigma1 = 0;

tic;
for k=1:5
    j = 0;
    for i=1:dim(1)
        j = j + ((sigma0 + sigma1*pob(i)) - ben(i))^2;
    end
    j = j/(2*dim(1));
end
disp("Resultado y tiempos para Sigma0 = 0 Sigma1 = 0");
disp(j);

t = toc;
t = t / 5; %%Media dividir entre 5

disp(t);

%%Segundo caso con valores sigma -1 y 2. Implementamos el calculo de la
%%funcion de costo. Se calcula el tiempo que tardan 5 iteraciones y se saca
%%el tiempo medio

sigma0 = -1;
sigma1 = 2;

tic;
for k=1:5
    j = 0;
    for i=1:dim(1)
        j = j + ((sigma0 + sigma1*pob(i)) - ben(i))^2;
    end
    j = j/(2*dim(1));
end
disp("Resultado y tiempos para Sigma0 = -1 Sigma1 = 2");
disp(j);

t = toc;
t = t / 5; %%Media dividir entre 5

disp(t);

