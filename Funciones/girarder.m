function [ S ] = girarder( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(j,a-i+1)=E(i,j);
    end
end
end