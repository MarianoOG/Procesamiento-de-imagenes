function [ S ] = girar180( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(a-i+1,b-j+1)=E(i,j);
    end
end
end