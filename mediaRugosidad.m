function [mediaRugosidad] = mediaRugosidad(vec)
%mediaRugosidad obtiene la media de un vector dado
%Esto forma parte de una paquete de funciones estadisticas para uso del
%proyecto nanorough.m

media=mediaAritmetica(vec);
n=length(vec);
sum=0;
    for c=1:n
        sum=sum+abs(vec(c)-media);    
    end
    mediaRugosidad=sum/n;
end

