fondo=rgb2gray(imread('scrcap1.jpg'));
for i=12:29
    numero=num2str(i);
    nombre=strcat('scrcap',numero,'.jpg');
    foto=rgb2gray(imread(nombre));
    neg=fondo-foto;
    nombre2=strcat('negativo',numero,'.jpg');
    imwrite(neg,nombre2);
    bin=binarizar(neg,10);
    nombre3=strcat('binaria',numero,'.jpg');
    imwrite(bin,nombre3);
    fil=filtromin(bin,9);
    nombre4=strcat('filtrada',numero,'.jpg');
    imwrite(fil,nombre4);
end