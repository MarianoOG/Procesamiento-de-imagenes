clc, close all,

figura='circulo';

video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
pause;
disp('Fondo')
fondo=double(rgb2gray(getsnapshot(video)));
pause;

for i=1:9
    numero=num2str(i);
    nombre=strcat('Simbolos\',figura,'-',numero,'.jpg');
    disp(nombre)
    foto=fondo-double(rgb2gray(getsnapshot(video)));
    %figure
    imwrite(foto/255,nombre)
    imshow(foto/255)
    pause;
end

delete(video);