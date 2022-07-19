clc;
clear all;
subplot(2,2,1);
[x,y]=meshgrid(-2:0.1:2);
z=(e.^((x.^2)+y))*(cos(((x.^2)+(y.^2))));
surf(x,y,z);

subplot(2,2,2);
[x,y]=meshgrid(-2:0.1:2);
a=(100 - 3./sqrt((x.^2)+(y.^2))) + (sin(sqrt((x.^2)+(y.^2))));
b=(sqrt(300 -(x.^2)+(y.^2)+(10*sin(x))+(10*cos(x))))./100;
z=a+b;
surf(x,y,z);