function [ X,Y ] = obtenerposiciones( E,v )
[a,b]=size(E);
k=1;
for i=1:a
    for j=1:b
        if (E(i,j)==v)
            X(k)=i;
            Y(k)=j;
            k=k+1;
        end
    end
end
end

