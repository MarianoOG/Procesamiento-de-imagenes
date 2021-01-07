tresD1=imread('3D-1.jpg');
tresD2=imread('3D-2.jpg');

[x,y,z]=size(tresD1);

rojo=zeros(x,y,3);
verde=zeros(x,y,3);

azul=zeros(x,y,3);

final(1:x,1:y,1)=tresD1(1:x,1:y,1);
final(1:x,1:y,2)=tresD2(1:x,1:y,2);
final(1:x,1:y,3)=tresD2(1:x,1:y,3);

imshow(final)
%imwrite(final,'tD.jpg')