clc,clear all, close all,
video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
pause;
aviObject = avifile('myVideo.avi');   % Create a new AVI file
for i=1:1000
    foto=getsnapshot(video);
    F = im2frame(foto);
    aviObject = addframe(aviObject,F); 
    pause(10);
end
aviObject = close(aviObject);
delete(video);