clc;
clear;

%Extraccion de datos
data = readtable("ocupancy.csv");

%Cogemos solo las columnas que no dan un error de formato 
t = data(:,3:6);
tabla = t.Variables;

%mostramos los datos antes de PCA
figure(1);
scatter3(tabla,3,4,5);
title("Datos");
xlabel("X"); ylabel("Y"), zlabel("Z");
%Primero vamos a centrar los datos de la matriz
%Para ello generamos la matriz XC

meanTabla = mean(tabla, 1);

XC = zeros(size(tabla)); %%Matriz de ceros
for i=1:size(tabla,2)
    XC(: , i) = tabla(:, i) - meanTabla(i);
end
%Se itera sobre la matriz con los datos, restandoles la media 
%calculada de esa columna

%Pasamos a calcular Z = (XC`*XC)/m donde Z es la matriz de covarianza

Z = (XC'*XC)/(size(XC,1));

[V,D] = eig(Z); %La funcion eig() devuelve los autovalores y autovectores de la matriz de covarianza. V  es los autovectores y D los autovalores

PCA = XC*V; %Reduccion de datos

%Representacion de datos despues de PCA

fprintf("Representación de los datos tras PCA\n");
 
figure(2);
scatter3(PCA(:,1),PCA(:,2),PCA(:,3));
title("PCA");
xlabel("X"); ylabel("Y"), zlabel("Z");

