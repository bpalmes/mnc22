clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data);

alpha = 0.01;

X = [(ones(dim(1),1)) pob];
Y = ben;

sigma = [0;0];

tic
for k=1:10
    sigma = [0; 0];
    for i=1:1500
        sigma = sigma - (alpha/dim(1)) .* (X'*((X*sigma) - Y));
    end
end
t = toc;

tf = t / 10;
disp("Resultado y tiempos para  alpha = 0,01");
disp("sigma");
disp(sigma);


