function [resp,vectf,xct, yft] = VectorTrayectoria(AMF,co,fo,cd,fd)
%VectorTrayectoria: regresa un vector de datos apartir de una imagen y
%puntos de inicio y final. Regresa resp=1 si la trayectoria es valida y resp=0 si no lo es.
%Programa para crear trayectorias en (AMF) Version general. 
%Se deben dar los datos de origen co,fo (x1,y1) y los 
%datos de destino cd,fd (x2,y2). Si fd=fo es un vector horizontal, si
%cd=co es un vector vertical. Si es diagonal abs(fd-fo) debe ser
%igual a abs(cd-co) de otra manera da "trayectoria invalida".
%Grafica los valores de la trayectoria.
%Emplea: Imagen4AMFFinal.gif


%Solo admite 138 por 138 puntos (pixeles) 
if  (fd-fo)==0 || abs(fd-fo)==abs(cd-co) || (cd-co)==0
 resp=1;
 for n=1:138  %asegura que el vector vect tenga zeros
        vect(n)=0;
        xc(n)=0;
        yf(n)=0;
    end
    if (fd-fo)==0 %trayectoria horizontal
        incf=0;
    elseif (fd-fo)>0
        incf=1;   % diagonal hacia abajo 
    else
        incf=-1;  %diagonal hacia arriba
    end
    if (cd-co)==0  %trayectoria vertical
        incc=0;
    elseif (cd-co)>0
        incc=1;   %diagonal hacia la derecha
    else
        incc=-1;  %diagonal hacia la izquierda
    end
    if incf==0   %recorrido horizontal
         m=(abs(cd-co))+1;
         xc(1)=co;   %primera coordena en la trayectoria 
         yf(1)=fo;
         f=fo;
         c=co;
         vect(1)=AMF(fo,co); %primer valor en la trayectoria 
        for n=2:m
         f=f+incf;
         c=c+incc;
         xc(n)=c;   
         yf(n)=f;
         vect(n)=AMF(f,c);
        end
        vectf=vect(1:m); %los m valores en la trayectoria
        xct=xc(1:m); %vector coordenadas en la trayectoria 
        yft=yf(1:m);
   elseif incc==0  %recorrido vertical
         m=(abs(fd-fo))+1; 
         yf(1)=fo;
         xc(1)=co;
         f=fo;
         c=co;
         vect(1)=AMF(fo,co); %primer valor en la trayectoria
         for n=2:m
          f=f+incf;
          c=c+incc;
          xc(n)=c;   
          yf(n)=f;
          vect(n)=AMF(f,c);
         end
         vectf=vect(1:m); %los m valores de la trayectoria
         xct=xc(1:m); %vector coordenadas en la trayectoria 
         yft=yf(1:m); %vector coordenadas en la trayectoria 
   else
        %recorrido diagonal
        deltaf=abs(fd-fo);
        deltac=abs(cd-co);
       if (deltaf-deltac)==0
          m=deltaf+1;
          xc(1)=co;
          yf(1)=fo;
          f=fo;
          c=co;
          vect(1)=AMF(fo,co); %primer valor en la trayectoria
          for n=2:m
            f=f+incf;
            c=c+incc;
            xc(n)=c;   
            yf(n)=f;
            vect(n)=AMF(f,c);
          end
          vectf=vect(1:m); %los m valores de la trayectoria
          xct=xc(1:m); %vector coordenadas en la trayectoria 
          yft=yf(1:m); %vector coordenadas en la trayectoria 
       end
    end
else
  resp=0;
  vectf=0;
  xct=0;
  yft=0;
end
end

