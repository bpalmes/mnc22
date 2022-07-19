clc;
clear all;
aprobados=[181 102 98 53 49 23 8 6]

subplot(2,2,1);
bar(aprobados);
set(gca,'XTickLabel',['Canarias';'Pais Vasco';'Cataluña';'Asturias';'Extremadura';'Andalucía';'Otras';])

title('Aprobados en oposiciones');
box off;

subplot(2,2,2);
area(aprobados);
set(gca,'XTickLabel',['Canarias';'Pais Vasco';'Cataluña';'Asturias';'Extremadura';'Andalucía';'Otras';])

title('Aprobados en oposiciones');
box off;

subplot(2,2,3);
stem(aprobados);
set(gca,'XTickLabel',['Canarias';'Pais Vasco';'Cataluña';'Asturias';'Extremadura';'Andalucía';'Otras';])

title('Aprobados en oposiciones');
box off;

subplot(2,2,4);
barh(aprobados);
set(gca,'XTickLabel',['Canarias';'Pais Vasco';'Cataluña';'Asturias';'Extremadura';'Andalucía';'Otras';])

title('Aprobados en oposiciones');
box off;


