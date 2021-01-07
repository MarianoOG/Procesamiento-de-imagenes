function [ S ] = momento( E,m,n,c )
% Si c es 0 cuenta el negro sino los blancos.
[x,y]=size(E);
S=0;
for i=1:x
    for j=1:y
        if (c==0)
            S=i^m*j^n*(255-E(i,j))/255+S;
        else
            S=i^m*j^n*E(i,j)/255+S;
        end
    end
end
end