clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data);

%%Usamos lla funcion que nos proporciona la diapositiva para hallar la
%%funcion de costo matricial

X = [(ones(dim(1),1)) pob];
Y = [ben];

sigma = [0;0];

%%Primero y como antes para sigma 0 0
tic
for k=1:5
    J = 0;
    J = sum(((X*sigma)-Y).^2);
    J = J / (2*dim(1));
end
t = toc;

tf = t / 5;

disp("Resultado y tiempos para Sigma0 = 0 Sigma1 = 0");
disp(J);
disp(tf);

sigma = [-1; 2];
tic
for m=1:5
    J = 0;
    J = sum(((X*sigma)-Y).^2);
    J = J / (2*dim(1));
end
t = toc;
tf = t / 5;

disp("Resultado y tiempos para Sigma0 = -1 Sigma1 = 2");
disp(J);
disp(tf);