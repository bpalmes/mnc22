
clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data);
 
scatter(pob, ben);


xlabel("Población");
ylabel("Beneficio ");
title("Practica 7");

hold on
sigma0 = -3.63;
sigma1 = 1.17;
x = [0:1:30];
y = sigma0 + sigma1*x;
plot(x,y);
legend('Conjunto de datos','Modelo optimo', 'Location', 'southeast');
hold off