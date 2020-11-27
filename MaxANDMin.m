function [MAX,min, coordMAX,coordmin] = MaxANDMin(vec)
%MaxANDMin obtiene el menor(min) y mayor (MAX) de un vector dado
%Esto forma parte de una paque de funciones estadisticas para uso del
%proyecto nanorough.m
    MAX=vec(1);
    min=vec(1);
    coordMAX=0;
    coordmin=0;
    n=length(vec);
    for c=2:n
        if(MAX<vec(c))
            MAX=vec(c);
            coordMAX=c;
        end
        if(min>vec(c))
            min=vec(c);
            coordmin=c;
        end
    end
end

