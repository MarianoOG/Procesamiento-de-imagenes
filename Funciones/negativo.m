function [ S ] = negativo( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(i,j)=255-E(i,j);
    end
end
end

