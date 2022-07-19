clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data);

sigma0= 0;
sigma1 = 0;
alpha = 0.01;


tic
for j=1:10
    sigma0 = 0;
    sigma1 = 0;
    for i=1:1500
        sum0 = 0;
        sum1 = 0;
        for i=1:dim(1)
            sum0 = sum0 + ((sigma0 + sigma1*pob(i)) - ben(i));
            sum1 = sum1 + pob(i)*((sigma0 + sigma1*pob(i)) - ben(i));
        end
        sigma0 = sigma0 - (alpha/dim(1))*sum0;
        sigma1 = sigma1 - (alpha/dim(1))*sum1;
    end
end
t = toc;
tf = t / 10;
disp("Resultado y tiempos para Sigma0 =  Sigma1 = 0 y alpha = 0,01");
disp("sigma0");
disp(sigma0);
disp("sigma1");
disp(sigma1);
disp(tf);