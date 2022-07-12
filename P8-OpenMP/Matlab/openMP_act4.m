clc;
clear;


tam = [100, 1000, 10000, 100000, 1000000];

iteracion10 = [0.000306, 0.000010, 0.000076, 0.000566, 0.003427];

iteracion1000 = [0.000005, 0.000005, 0.000031, 0.000218, 0.003222];


figure(1)
plot((1:5), iteracion10);
hold on
plot((1:5), iteracion10, 'Color',[0 0 0]);
plot((1:5), iteracion1000, 'Color',[0 1 1]);

title("Tiempo ");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.01 0.02]);
xticklabels(tam);
legend('iteraciones 10','iteraciones 100');
grid on;
hold off;