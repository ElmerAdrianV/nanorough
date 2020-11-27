function [mediaPV, cordMin, minimos, cordMAX, maximos] = mediaPICOSyValles(vec)
%Obtiene el promedio de los valores MAXIMOS y minimos de un vector dado
%Esto forma parte de una paque de funciones estadisticas para uso del
%proyecto nanorough.m

n=length(vec);
lenMin=0;
lenMAX=0;
count=0;
media=mediaAritmetica(vec);
    for a=1:n-1
        if vec(a)< media && media<vec(a+1) %buscaremos un minimo
            count=count+1;
            if count==1 %Cruzamiento inicial
                cruz=a;
            else
                cruz=[cruz a+1]; %agregando cruces
                min=media;
                for d=cruz(count-1):a+1
                    if(min>vec(d))
                       min=vec(d);
                       minInd=d;
                    end
                end
                if lenMin==0
                    cordMin=minInd;
                    minimos=min;
                    lenMin=lenMin+1;
                else
                    cordMin=[cordMin minInd]; %guarda coordenada minimo
                    minimos=[minimos min];%guarda minimo
                end
        end
        else
            if vec(a)> media && media>vec(a+1) %buscaremos un maximo
                count=count+1;
                if count==1 %Cruzamiento inicial
                    cruz=a;
                else
                    cruz=[cruz a+1];
                    MAX=media;  
                    for d=cruz(count-1):a+1
                        if(MAX<vec(d))
                            MAX=vec(d);
                            maxInd=d;
                        end
                    end
                     if lenMAX==0
                        cordMAX=maxInd;
                        maximos=MAX;
                        lenMAX=lenMAX+1;
                    else
                        cordMAX=[cordMAX maxInd]; %guarda coordenada maximo
                        maximos=[maximos MAX];%guarda  maximo
                     end
                end         
            end
        end
    end
   p=length(maximos);
   sumMAX=0;
   
   for x=1:p
       sumMAX=sumMAX+maximos(x);
   end
   
   v=length(minimos);
   sumMin=0;
   
   for y=1:v
       sumMin=sumMin+minimos(y);
   end
   
   mediaPV=(sumMin+sumMAX)/(p+v);
   
end




