function [ S ] = reflejarv( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(a-i+1,j)=E(i,j);
    end
end
end