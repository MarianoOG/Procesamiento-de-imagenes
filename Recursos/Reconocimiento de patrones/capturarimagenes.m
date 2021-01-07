clc, close all,

c={};

video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
pause;
for i=1:9
    numero=num2str(i);
    nombre=strcat('triangulo-',numero,'.jpg');
    img=rgb2gray(getsnapshot(video));
    imwrite(img,nombre);
    c(1,i)={img};
    pause;
end
delete(video);