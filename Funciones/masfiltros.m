clc, clear all, close all
%% Otros filtros: Prewitt, Sobel y Laplaciano
foto=double(rgb2gray(imread('foto1.jpg')));
A=prewitt(foto);
B=sobel(foto);
E1=[0,-1,0;-1,4,-1;0,-1,0];
E2=[-1,-1,-1;-1,8,-1;-1,-1,-1];
C=filtro3x3(foto,E1);
D=filtro3x3(foto,E2);

figure
subplot(2,2,1)
    imshow(A/255)
    title('Filtro Prewit')
subplot(2,2,2)
    imshow(B/255)
    title('Filtro Sobel')
subplot(2,2,3)
    imshow(C/255)
    title('Filtro Laplaciano 1')
subplot(2,2,4)
    imshow(D/255)
    title('Filtro Laplaciano 2')
%% Dilatación y erosión de imágen filtrada.
E=filtromax(binarizar(A,200),7); %A es la imagen con el filtro de prewitt
F=filtromin(E,7); %Erosión de la imagen previamente dilatada.

figure
subplot(2,1,1)
    imshow(A/255)
    title('Original')
subplot(2,2,3)
    imshow(E/255)
    title('Dilatación')
subplot(2,2,4)
    imshow(F/255)
    title('Erosión')
%% Dilatacion y erosion de imagen original
G=binarizar(foto,100);
H=filtromax(G,5);
I=filtromin(G,13);

figure
subplot(2,2,1)
    imshow(foto/255)
    title('Original')
subplot(2,2,2)
    imshow(G/255)
    title('Foto binarizada')
subplot(2,2,3)
    imshow(H/255)
    title('Dilatación')
subplot(2,2,4)
    imshow(I/255)
    title('Erosión')