function [ A,P,E,S,cx,cy,d ] = analizarimagen( img,c )
% Si c=0 mancha negra sino mancha blanca.
A=momento(img,0,0,c);
borde=prewitt(img,0);
P=momento(borde,0,0,1);
M10=momento(img,1,0,c);
M01=momento(img,0,1,c);
S=momentoinvariante(borde,1,1,1);
cx=M10/A;
cy=M01/A;
[X,Y]=obtenerposiciones(borde,255);
d=sqrt((X-cx).^2+(Y-cy).^2);
E=max(d)/min(d);
%figure
%    subplot(2,2,1)
%    imshow(img/255)
%    subplot(2,2,2)
%    imshow(borde/255)
%    hold on
%    plot(cy,cx,'d')
%    subplot(2,1,2)
%    plot(1:P,sort(d))
end