clc,clear all, close all,
%Abre el video
video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
%Toma 9 fotografías para completar la vuelta completa
for i=1:9
    foto=getsnapshot(video);
    numero=num2str(i);
    nombre=strcat('scrcap',numero,'.jpg');
    pause; %Espera a que el usuario teclee para tomar la siguiente foto.
    imwrite(foto,nombre);
    imag(foto);
end
delete(video);