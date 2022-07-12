clc;
clear;

disp("Matriz original = ");
M = [1,0,3,0;0,0,1,2;12,0,2,3;2,0,0,0]
disp("****************************** ");

[row ,col ,val ] = COO(M);
disp("Despues de plicar la codificacion COO ");
disp("Filas");
disp(row);
disp("Columnas ");
disp(col);
disp("Valores");
disp(val);
disp("*****************************************");

[row ,col ,val ] = CSR(M);
disp("Despues de plicar la codificacion CSR ");
disp("Valores no cero en las Filas");
disp(row);
disp("Columnas ");
disp(col);
disp("Valores");
disp(val);
disp("*****************************************");


M = generateSparse(4,4,4,1,7)
disp("Generamos una matriz aleatoria ");
disp(M);

disp("*****************************************");


function[row, col, val] = COO(A)
   n = nnz(A);%Numero de elemntos no cero de la matriz

   %vectores COO
   row = zeros(1,n);
   col = zeros(1,n);
   val = zeros(1,n);

   k=1;
   for i = 1:size(A,1)
       for j = 1:size(A,2)
           if A(i,j) ~= 0
               row(k) = i;
               col(k) = j;
               val(k) = A(i,j);
               k = k +1;
           end
       end
   end
end

function [rowOff, col, val] = CSR(A)
    n = nnz(A); %elementos no cero

    z = 0;
    %Tamaño fila + 1
    rowOff = zeros(1,size(A,1)+1); %cada posicion del vector indica el numero de elemento no nules encontrados en total hasta  la fila anterior
    col = zeros(1,n);
    val = zeros(1,n);
    
    k = 1;
    l = 1;

    %Se comprueba que la primera poscicion de la matriz no es nula
    if A(1,1) ~= 0
        rowOff(l) = 0;
        l = 2;
    end
    
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            if A(i,j) ~= 0
                col(k) = j;
                val(k) = A(i,j);
                k = k + 1;
                z = z + 1;
            end
        end
        rowOff(l) = z;
        l = l + 1;
    end
end

function [A] = generateSparse(nRow, nCol, zDensity, vMin, vMax)

%CReamos una matriz randomizada con tamño row*col y con un rango de valores
%min-max
A = randi([vMin,vMax],nRow,nCol);

%Rellenamos la matriz con el numero de ceros dados por nDensity

z = zDensity +1;
for i = 1:z
  r = randi(nRow);%Numeros random desde 1 al tamaño col-row
  c = randi(nCol);
  %Lo introducimos en la matriz
  if(A(r,c) ~= 0)% Por si me encuentro un 0 de una iteracion anterior
     A(r,c) = 0;
  else
      i = i+1;
  end

end


end
