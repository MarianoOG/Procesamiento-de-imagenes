for i=1:9
    
    c={};
    numero=num2str(i);
    nombre=strcat('e-',numero,'.jpg');
    img=imread(nombre);
    c(1,i)={img};
    
    foto=cell2mat(c(1,i));
    bin=binarizar(foto,100);
    filtrada=filtromin(filtromax(bin,7),7);
    borde=filtromin(filtromax(binarizar(prewitt(filtrada),200),3),3);
    A(i)=manchanegra(filtrada,7);
    P(i)=manchablanca(borde,3);
    R(i)=A(i)/P(i);
    
    c(2,i)={bin};
    c(3,i)={filtrada};
    
    figure
        subplot(2,2,1)
            imshow(foto)
        subplot(2,2,2)
            histograma(foto);
        subplot(2,2,3)
            imshow(filtrada/255)
        subplot(2,2,4)
            imshow(borde/255)
    
end

disp('Minimos');
min(A)
min(P)
min(R)
disp('Máximos');
max(A)
max(P)
max(R)

x=1:9;
figure
    subplot(1,3,1)
        plot(x,A)
    subplot(1,3,2)
        plot(x,P)
    subplot(1,3,3)
        plot(x,R)
    