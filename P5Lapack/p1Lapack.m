clc;
clear;


%%Generamos matriz aleatoria de 6x6
M  = double(randi([1,10], 6,6));

detM = det(M);

disp("Matriz M de 6x6: ");
disp(M);

disp("Determinante de M: " + detM);
disp(" ");

disp("Factorización LU de M: ")
luA = lu(M);
disp(luA);

