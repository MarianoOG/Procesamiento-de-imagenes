clc,clear all, close all,
video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
pause;
for i=1:2
    foto=getsnapshot(video);
    numero=num2str(i);
    nombre=strcat('3D-',numero,'.jpg');
    imwrite(foto,nombre);
    imag(foto);
    pause;
end
delete(video);