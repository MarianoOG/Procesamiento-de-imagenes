function [ A ] = manchablanca(Img,b)
%La entrada Img debe ser una imagen con una sola mancha negra con fondo blanco.
[x,y]=size(Img);
A=0;
for i=b:x-b
    for j=b:y-b
        if(Img(i,j)==255) A=A+1; end
    end
end
end