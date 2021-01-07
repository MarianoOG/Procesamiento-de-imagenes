function [ S ] = reducirx2( E )
for i=1:2:a
    for j=1:2:b
        S(i/2+1/2,j/2+1/2)=E(i,j)/4+E(i+1,j)/4+E(i,j+1)/4+E(i+1,j+1)/4;
    end
end
end