function [ S ] = histograma( E )
[a,b]=size(E);
x=0:255;
S=zeros(1,256);
for i=1:a
    for j=1:b
        S(E(i,j)+1)=S(E(i,j)+1)+1;
    end
end
plot(x,S);
end