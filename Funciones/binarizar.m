function [ S ] = binarizar( E, n )
[a,b]=size(E);
for i=1:a
    for j=1:b
        if (E(i,j)<n)
           S(i,j)=0;
        else
           S(i,j)=255; 
        end
    end
end
end