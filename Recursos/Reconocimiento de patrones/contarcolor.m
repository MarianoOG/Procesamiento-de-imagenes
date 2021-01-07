function [ A ] = contarcolor(Img,b,n)
% Img: debe ser una imagen en blanco y negro
% b: es un borde que se desprecia
% n: es el color a medir
[x,y]=size(Img);
A=0;
for i=b:x-b
    for j=b:y-b
        if(Img(i,j)==n) A=A+1; end
    end
end
end