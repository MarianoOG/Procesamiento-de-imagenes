function [ S ] = filtro3x3(E,EE) %Pasa Altas, 
%E es la matriz de entrada y EE el elemento estructurante de 3x3
[a,b]=size(E);
S=zeros(a,b);
%EE = [-1,-1,-1;-1,8,-1;-1,-1,-1];
%EE2 = [0,-1,0;-1,4,-1;0,-1,0];
%EE3 = [1,1,1;0,0,0;-1,-1,-1];
for i=2:a-1
    for j=2:b-1
        S(i,j) = sum(sum(E(i-1:i+1,j-1:j+1).*EE));
        if (S(i,j)<0) S(i,j)=0; end
        if (S(i,j)>255) S(i,j)=255; end
    end
end
end