function [ S ] = filtromin( E , n)
%E es la matriz de entrada y n es el tama�o de la matriz cuadrada
[a,b]=size(E);
S = ones(a,b)*255;
if (mod(n,2)==0) %Para n par
    for i=1+n/2:a-n/2-1
        for j=1+n/2:b-n/2-1
            S(i,j) = min(min(E(i-n/2:i+n/2-1,j-n/2:j+n/2-1)));
        end
    end     
else %Para n impar
    for i=1+(n-1)/2:a-(n-1)/2
        for j=1+(n-1)/2:b-(n-1)/2
            S(i,j) = min(min(E(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2)));
        end
    end
end
end