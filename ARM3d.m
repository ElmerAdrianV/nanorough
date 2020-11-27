function [] = ARM3d(AMF,vectf, xct,yft)
%Plotea una imagen de ARM en 3 dimensiones
%Esto forma parte de una paquete de funciones estadisticas para uso del
%proyecto nanorough.m

vec=1:138;


%Proyecta en 3d la imagen insertada
for c=1:138
    vec(c)=AMF(1,c);
end
x=1:138;
y=1;
for c=2:138
    y=[y 1];
end
figure
title('Proyección en 3D')

plot3(x,y,vec)

grid on
hold on
for d=1:137
    for c=1:138
        y(c)=y(c)+1;
        vec(c)=AMF(y(c),c);
    end
    plot3(x,y,vec,'LineWidth',1)
    
end
   %Proyecta la trayectoria insertada con las coordenadas iniciales

x=1:length(vectf);
plot3(xct,yft,vectf,'k', 'LineWidth',3) %Grafica a trabajar
yP=1:length(vectf);   

    hold off
end

