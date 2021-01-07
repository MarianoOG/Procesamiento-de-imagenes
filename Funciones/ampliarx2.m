function [ S ] = ampliarx2( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(2*i-1,2*j-1)=E(i,j);
        S(2*i,2*j)=E(i,j);
        S(2*i-1,2*j)=E(i,j);
        S(2*i,2*j-1)=E(i,j);
    end
end
end