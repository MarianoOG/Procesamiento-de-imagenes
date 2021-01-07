function [ S ] = reflejarh( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        S(i,b-j+1)=E(i,j);
    end
end
end