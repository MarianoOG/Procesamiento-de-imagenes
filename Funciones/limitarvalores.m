function [ S ] = limitarvalores( E )
[a,b]=size(E);
for i=1:a
    for j=1:b
        if (E(i,j)<0) E(i,j)=0; end
        if (E(i,j)>255) E(i,j)=255; end
    end
end
S=E;
end