function [asimetria] = asimetria(vec)
%Mide la asimetria sobre la linea media de un vector dado
%Esto forma parte de una paquete de funciones estadisticas para uso del
%proyecto nanorough.m
 n=length(vec);
 Rq=mediaGeometrica(vec);
 media=mediaAritmetica(vec);
 sum=0;
    for c=1:n
        sum=sum+((vec(c)-media).^3);    
    end
    asimetria=sum/((n)*(Rq.^3));
end

