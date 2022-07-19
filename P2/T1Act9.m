clc;
clear;

%%Carga de datos
load('data.mat', '-ascii');

%%organizamos las datos extrayendo las columnas que queremos
pob = data(:, 1);
ben = data(:, 2);
dim = size(data); 

X = [ones(100,1) pob];
y = ben;

%%funcion de costo
sigma0 = linspace(-10, 10, 100); %%devuelve un vector fila de 100 puntos equidistantes entre -10 y 10
sigma1 = linspace(-1, 4, 100);
J = zeros(100,100);


for i=1:100
    for j=1:100 
        sigma = [sigma0(i); sigma1(j)];
        J(i,j) = (sum(((X*sigma) - y).^2)) / (2*100);
    end
end

%%No funciona
figure(1)
subplot(1,2,1);
surf(sigma1,sigma0, J'); %%Trasponemos j para la representación
xlabel("sigma1");
ylabel("sigma0");
zlabel("J(sigma0, sigma1)");


subplot(1,2,2);
contour(sigma1, sigma0,J');
colorbar;
grid on;