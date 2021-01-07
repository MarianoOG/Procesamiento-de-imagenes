function [ S ] = girarizq( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(b-j+1,i)=E(i,j);
    end
end
end