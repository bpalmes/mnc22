clear all;
clc;

figure(1);
hold on;
grid on;
axis equal;
axis([-0.1 1.1 -0.2 0.2]);
whitebg('white');
title('NACA644x 20-Brian');
[x,y]=NACA4(20);
plot(x,y,'b-');
box on
hold off;

figure(2);
hold on;
grid on;
axis([-20 40 -1 2]);
title('NACA - Brian');
airfoil = NACA644X(20);
plot(airfoil.alpha,airfoil.CL,'b^-',airfoil.alpha,airfoil.CD,'ro-');
legend('CL','CD');
box on
hold off;