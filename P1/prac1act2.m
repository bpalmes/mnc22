clc;
clear all;
x=1:1:64;

subplot(2,2,1);
plot(x,x);
axis([0 60 0 60]);
xlabel('X');
ylabel('Y');
title('Valores de X');
box off;

subplot(2,2,2);
plot(x,x.^2);
axis([0 60 0 60]);
xlabel('X');
ylabel('Y')
title('Valores de x^2');
box off;

subplot(2,2,3);
plot(x,2.^x);
axis([0 60 0 60]);
xlabel('X');
ylabel('Y');
title('Valores de 2^x');
box off;

subplot(2,2,4);
plot(x,log2(x));
axis([0 60 0 60]);
xlabel('X');
ylabel('Y');
title('Valores de Log2(x)');
box off;


