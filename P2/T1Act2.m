clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);

scatter(pob, ben);

xlabel("Población");
ylabel("Beneficio");
title("Datos");