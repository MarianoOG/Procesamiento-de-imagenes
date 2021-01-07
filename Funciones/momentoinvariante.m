function [ S ] = momentoinvariante( E,m,n,c )
% Si c es 0 cuenta el negro sino los blancos.
[x,y]=size(E);
S=0;
M00=momento(E,0,0,c);
M10=momento(E,1,0,c);
M01=momento(E,0,1,c);
cx=M10/M00;
cy=M01/M00;
for i=1:x
    for j=1:y
        if (c==0)
            S=(abs(i-cx))^m*(abs(j-cy))^n*(255-E(i,j))/255+S;
        else
            S=(abs(i-cx))^m*(abs(j-cy))^n*E(i,j)/255+S;
        end
    end
end
end