function [ C ] = separarmanchas( E,c )
% Si c=0 busca manchas negras, sino busca manchas blancas.
[a,b]=size(E);
k=1;
C={};
for i=1:a
    for j=1:b
        if (c==0)
            if (E(i,j)==0)
                E=colorear(E,i,j,k);
                k=k+1;
            end
        else
            if (E(i,j)==255)
                E=colorear(E,i,j,k);
                k=k+1;
            end
        end
    end
end
for i=1:k-1
    A=zeros(a,b);
    for m=1:a
        for n=1:b
            if (E(m,n)==i)
                A(m,n)=255;
            end
        end
    end
    if (c==0)
        C(i)={negativo(A)};
    else
        C(i)={A};
    end
end
end