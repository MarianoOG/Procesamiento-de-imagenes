clc, close all, clear all

figura='B';

for i=1:9
    numero=num2str(i);
    nombre=strcat('Simbolos\',figura,'-',numero,'.jpg');
    
    foto=double(imread(nombre));
    bin=negativo(binarizar(foto,20));
    filtrada=filtromin(filtromax(bin,7,1),7,1);
    [A(i),P(i),E(i),S(i),cx,cy,d]=analizarimagen(filtrada,0);
    
    figure
        subplot(2,2,1)
        imshow(foto/255)
        title('Imagen original')
        subplot(2,2,2) 
        imshow(bin/255)
        title('Imagen binarizada')
        subplot(2,2,3)
        imshow(filtrada/255)
        hold on
        plot(cy,cx,'s')
        title('Imagen filtrada con centroide')
        subplot(2,2,4)
        plot(1:P(i),sort(d))
        title('Firma (análogo ascendente)')
    
end

format long
T=cell(5,3);
T(1,:)={'','min','max'};
T(2,:)={'A',min(A),max(A)};
T(3,:)={'P',min(P),max(P)};
T(4,:)={'E',min(E),max(E)};
T(5,:)={'S',min(S),max(S)}