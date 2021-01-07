close all; clear all; clc;
%% FFT
B=rgb2gray(imread('foto3.jpg'));
C=fft2(B);
D=fftshift(C);
[u,v]=freqspace(size(B),'meshgrid');
%Circulo principal: Usado en todos los filtros.
r1=0.6; %En porcentaje de 0 a 1.
%Círculo secundario: Usado para pasa banda y rechaza banda así como para los filtros reales.
r2=0.4; %En porcentaje de 0 a 1 (para mantener la logica del programa r2 debe ser menor a r1).
%Círculo tericario: Usado para pasa banda y rechaza banda real.
r3=0.2; %En porcentaje de 0 a 1 (para mantener la logica del programa r3 debe ser menor a r2).
figure
    subplot(2,1,1)
        imshow(B)
        title('Imagen original')
    subplot(2,2,3);
        imshow(log(abs(C)),[])
        title('Frecuencias')
    subplot(2,2,4)
        imshow(log(abs(D)),[])
        title('Frecuencias invertidas')
%% Pasa bajas
cir1=(sqrt(u.^2+v.^2)<r1)*1;
F=ifft2(ifftshift(D.*cir1)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir1)
        title('Circulo de corte')
    subplot(2,2,2)
        meshc(u,v,cir1);
        title('Circulo de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa bajas')
%% Pasa altas
cir2=(sqrt(u.^2+v.^2)>r1)*1;
F=ifft2(ifftshift(D.*cir2)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir2)
        title('Circulo de corte')
    subplot(2,2,2)
        meshc(u,v,cir2);
        title('Circulo de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa altas')
%% Pasa banda
cir3=(sqrt(u.^2+v.^2)<r1)*1 + (sqrt(u.^2+v.^2)>r2)*1 - ones(size(u));
F=ifft2(ifftshift(D.*cir3)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir3)
        title('Circulo de corte')
    subplot(2,2,2)
        meshc(u,v,cir3);
        title('Circulo de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa banda')
%% Rechaza banda
cir4=(sqrt(u.^2+v.^2)>r1)*1 + (sqrt(u.^2+v.^2)<r2)*1;
F=ifft2(ifftshift(D.*cir4)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir4)
        title('Circulo de corte')
    subplot(2,2,2)
        meshc(u,v,cir4);
        title('Circulo de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Rechaza banda')
%% Pasa bajas real
n=101; % Número de escalones
k=linspace(r2,r1,n);
%k=logspace(0,1,n)*(r1-r2)/n+r2;
cir5=zeros(size(B));
for i=1:n-1
    cir5=((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1)+cir5;
end
cir5=(sqrt(u.^2+v.^2)<r2)*1+cir5;
F=ifft2(ifftshift(D.*cir5)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir5)
        title('Degradado de corte')
    subplot(2,2,2)
        meshc(u,v,cir5);
        title('Degradado de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa bajas real')
%% Pasa altas real
cir6=1-cir5;
F=ifft2(ifftshift(D.*cir6)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir6)
        title('Degradado de corte')
    subplot(2,2,2)
        meshc(u,v,cir6);
        title('Degradado de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa altas real')
%% Pasa banda real
k2=linspace(r3,r2,n);
%k2=logspace(0,1,n)*(r2-r3)/n+r3;
temp=zeros(size(B));
temp2=zeros(size(B));
for i=1:n-1
    temp=((sqrt(u.^2+v.^2)>=k(i))*1 + (sqrt(u.^2+v.^2)<k(i+1))*1 - ones(size(u)))*(n-i)/(n-1)+temp;
    temp2=((sqrt(u.^2+v.^2)>=k2(i))*1 + (sqrt(u.^2+v.^2)<k2(i+1))*1 - ones(size(u)))*(n-i)/(n-1)+temp2;
end
temp2=1-(sqrt(u.^2+v.^2)<r3)*1-temp2;
cir7=(sqrt(u.^2+v.^2)<r2).*temp2+temp;
clear temp temp2
F=ifft2(ifftshift(D.*cir7)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir7);
        title('Degradado de corte')
    subplot(2,2,2)
        meshc(u,v,cir7);
        title('Degradado de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Pasa banda real')
%% Rechaza banda real
cir8=1-cir7;
F=ifft2(ifftshift(D.*cir8)); %Nueva imagen filtrada
figure
    subplot(2,2,1)
        imshow(cir8)
        title('Degradado de corte')
    subplot(2,2,2)
        meshc(u,v,cir8);
        title('Degradado de corte')
    subplot(2,2,3)
        imshow(B)
        title('Imagen original')
    subplot(2,2,4)
        imshow(uint8(abs(F)))
        title('Rechaza banda real')