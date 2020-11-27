function [MaxDif] = MaxDif(vec)
%Obtiene la diferencia maxima de los elementos dados de un vector dado
%Esto forma parte de una paque de funciones estadisticas para uso del
%proyecto nanorough.m

[MAX min]=MaxANDMin(vec);
MaxDif=MAX-min;
end

