function [mediaGeo] = desviacionEstandar(vec)
%desviacionEstandar obtiene la desviacionEstandar de un vector dado
%Esto forma parte de una paquete de funciones estadisticas para uso del
%proyecto nanorough.m
media=mediaAritmetica(vec);
n=length(vec);
sum=0;
    for c=1:n
        sum=sum+((vec(c)-media).^2);    
    end
    mediaGeo=sqrt(sum/n);


end

