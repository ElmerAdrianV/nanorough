%Programa control de analisis de datos
%El programa recibe una imagen proveniente de un ARM y los puntos de inicio
%(co,fo) y punto final (cd,fd). Tiene de limitante no aceptar trayectorias diagonales
%con abs(fd-fo) diferente abs(cd-co) arrogando "trayectoria invalida".
%Incluye menú de funciones
%Necesita funciones:
%*VectorTrayectoria.m
%*mediaAritmetica.m
%*mediaGeometrica.m
%*mediaRugosidad.m
%*MaxANDMin.m
%*MaxDif.m
%*mediaPICOSyValles.m
%*asimetria.m
%Solo admite 138 por 138 puntos (pixeles) 


%Para este ejemplo emplea: Imagen4AMFFinal.gif



AMF=imread('Imagen4AMFFinal.gif'); 
%Puedes cambiar el nombre de tu archivo, solo asegura que este en el mismo folder que esta funcion
imshow(AMF) 
title('Imagen4AMFFinal.gif')
%Recuerda cambiar el nombre de tu archivo para variar el titulo.

co=input('Ingresa el valor de x1 (inicio):'); %x1
fo=input('Ingresa el valor de y1 (inicio):'); %y1
cd=input('Ingresa el valor de x2 (final) :'); %x2
fd=input('Ingresa el valor de y2 (final) :'); %y2

[resp,vectf,xct, yft] = VectorTrayectoria(AMF,co,fo,cd,fd);
if resp==1
    %Grafica vector tomado
    hold on
    plot(xct,yft,'r'); %La linea roja en la imagen representa el vector tomado
    hold off
    ARM3d(AMF,vectf, xct,yft)
    figure
    title('Datos del vector a analizar')
    hold on
    x=1:length(vectf);
    plot(x,vectf) %Grafica a trabajar
    yP=1:length(vectf);
    for n=1:length(vectf)
           yP(n)=mediaAritmetica(vectf); %Valor de referencia
    end
        Z=mediaAritmetica(vectf);
        ylabel('Altura') 
        plot(x, yP);
        axis([0 140 0 256]) %%limites
        grid on
    
    
    %----------------------Menú de funciones-----------------------------%
    fprintf('Menú de funciones para analisis de vector de datos del ARM \n');
    fprintf('NOTA: La linea roja representa valor de la Media Aritmetica la cual se toma de referencia para las funciones \n'); 
    fprintf('     (Valor referencia) Promedio valores del vector (Z): %5.4f \n',Z); 
    fprintf('Funcion 1: Promedio de Rugosidad del perfil\n') 
    fprintf('   Descripcion: la diferencia entre cada punto y la altura promedio\n');
    fprintf('Funcion 2: Raíz de medias cuadráticas\n');
    fprintf('   Descripcion:El promedio del perfil es similar a la regresión lineal\n');
    fprintf('Funcion 3: Altura máxima del pico del perfil y Profundidad máxima del valle del perfil\n');
    fprintf('   Descripcion:Valor maximo y minimo de los datos\n');
    fprintf('Funcion 4: La altura máxima del perfil\n');
    fprintf('   Descripcion:Diferencia entre el pico y el valle\n');
    fprintf('Funcion 5: El perfil Promedio \n');
    fprintf('   Descripcion: Promedio encontrado de los picos (maximos) más grandes y valles (minimos) más grandes \n');
    fprintf('Funcion 6: Asimetría \n');
    fprintf('   Descripcion: mide la asimetría del perfil sobre la línea media\n');
    fprintf('Funcion 7: Simbología lineas \n');
    fprintf('   Descripcion: Regresa la simbologia (colores) de las lineas\n');
    fprintf('Funcion -1: Salir del programa \n');
    fprintf('   Descripcion: Terminar el programa para analizar otra imagen o bien otro vector de datos\n');
    
    funcion=input('Ingresa la función que quieras realizar: ');
    while funcion ~=-1
        switch funcion
            %-------------------------------------------------%
            case 1
                Ra=mediaRugosidad(vectf);
                fprintf('Promedio de Rugosidad del perfil (Ra)= %5.4f \n', Ra);
                graficar=input('¿Quiere graficar en la figura este valor? Para si escribir 1, cualquier otro valor causara negacion \n');
                if(graficar==1)
                yPromR=1:length(vectf);
                for n= 1:length(vectf)
                    yPromR(n)=Ra;
                end
                plot(x,yPromR, 'g')
                fprintf('Linea verde representa valor de Promedio de Rugosidad del perfil \n');
                end
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            %-------------------------------------------------%
            case 2
                Rq=desviacionEstandar(vectf);
                fprintf('Desviacion Estandar (Rp) = %5.4f \n', Rq);
                graficar=input('¿Quiere graficar en la figura este valor? Para si escribir 1, cualquier otro valor causara negacion \n');
                if(graficar==1)
                ydesEst=1:length(vectf);
                for n= 1:length(vectf)
                    ydesEst(n)=Rq;
                end
                plot(x,ydesEst, 'b')
                fprintf('Linea azul representa valor de la Desviacion Estandar \n');
                end
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            %-------------------------------------------------%
            case 3
                [Rp, Rv, coordMAX, coordmin]=MaxANDMin(vectf);
                 fprintf('Altura máxima del pico del perfil (Rp)= %5.4f \n', Rp);
                 fprintf('Profundidad máxima del valle del perfil (Rv)= %5.4f \n', Rv);
                
                graficar=input('¿Quiere graficar en la figura este valor? Para si escribir 1, cualquier otro valor causara negacion \n');
                if(graficar==1)
                yMAX=1:length(vectf);
                ymin=1:length(vectf);
                for n= 1:length(vectf)
                    yMAX(n)=Rp;
                    ymin(n)=Rv;
                end
                plot(x,yMAX, 'm --')
                plot(x,ymin, 'c --')
                fprintf('Linea magenta punteada representa valor maximo de los datos\n');
                fprintf('Linea cyan punteada representa valor de minimo de los datos\n');
                end
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            %-------------------------------------------------%
            case 4
                Rt=MaxDif(vectf);
                fprintf('Altura máxima del perfil (Rt) = %5.4f \n', Rt);
                graficar=input('¿Quiere graficar en la figura este valor? Para si escribir 1, cualquier otro valor causara negacion \n');
                if(graficar==1)
                    [Rp, Rv, coordMAX, coordmin]=MaxANDMin(vectf);
                    coordMAX2=[coordMAX coordMAX];
                    Rp2=[Z Rp];
                    coordmin2=[coordmin coordmin];
                    Rv2=[Z Rv];
                    plot(coordMAX2, Rp2, 'k --')
                    plot(coordmin2, Rv2, 'k --')
                    fprintf('Linea negra punteada vertical representa la distancia máxima\n');
                end
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            %-------------------------------------------------%    
            case 5
                [Rz, cordMin, minimos, cordMAX, maximos] = mediaPICOSyValles(vectf);
                fprintf('Perfil Promedio (Rz)= %5.4f \n', Rz);
                graficar=input('¿Quiere graficar en la figura este valor? Para si escribir 1, cualquier otro valor causara negacion \n');
                plot(cordMin, minimos, 'r o')
                plot(cordMAX, maximos, 'r o')
                if(graficar==1)
                ymediaPV=1:length(vectf);
                for n= 1:length(vectf)
                    ymediaPV(n)=Rz;
                end
                plot(x,ymediaPV, 'k')
                fprintf('Linea negra representa valor de Perfil Promedio\n');
                end
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            %-------------------------------------------------%    
            case 6
                Rsk=asimetria(vectf);
                fprintf('Asimetría (Rsk): %5.4f \n', Rsk);
                fprintf('El sesgo positivo indica un predominio de picos, mientras que el sesgo negativo indica un predominio de valles\n')
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
                   %-------------------------------------------------%    
            case 7
                fprintf('Linea roja representa valor de la Media Aritmetica la cual se toma de referencia para las funciones \n'); 
                fprintf('Linea verde representa valor de Promedio de Rugosidad del perfil \n'); 
                fprintf('Linea azul representa valor de la desviacion estandar\n');
                fprintf('Linea magenta punteada representa valor maximo de los datos\n');
                fprintf('Linea cyan punteada representa valor de minimo de los datos\n');
                fprintf('Linea negra punteada vertical representa la distancia máxima\n');
                fprintf('Linea negra representa valor de Perfil Promedio\n');
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
            case 8
                
            otherwise
                fprintf('¡Valor invalido!')
                funcion=input('Ingresa la funcion que quieras realizar (Recuerda: -1 para finalizar): ');
         end
        
    end
    hold off
    fprintf('Analisis finalizado.\n')
    fprintf('No olvides cerrar las ventanas\n')
    
    
else
   disp('Trayectoria Invalida. Programa Finalizado')
   fprintf('No olvides cerrar las ventanas\n')
end