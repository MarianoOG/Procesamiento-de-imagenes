%Lectura de la imagen original y sus dimensiones:
color=imread('foto.jpg');
[x,y,z]=size(color);

%Creación de las matrices para cada uno de los colores RGB:
rojo=zeros(x,y,3);
verde=zeros(x,y,3);
azul=zeros(x,y,3);
rojo(1:x,1:y,1)=color(1:x,1:y,1);
verde(1:x,1:y,2)=color(1:x,1:y,2);
azul(1:x,1:y,3)=color(1:x,1:y,3);

%Despliegue en pantalla de las imagenes RGB:
figure
subplot(2,2,1)
imshow(color)
title('IMAGEN ORIGINAL')
subplot(2,2,2)
imshow(rojo/255)
title('ROJO')
subplot(2,2,3)
imshow(verde/255)
title('VERDE')
subplot(2,2,4)
imshow(azul/255)
title('AZUL')

%Creación de las matrices para cada uno de los colores CMY:
amarillo=zeros(x,y,3);
cyan=zeros(x,y,3);
magenta=zeros(x,y,3);
amarillo(1:x,1:y,1:2)=color(1:x,1:y,1:2);
cyan(1:x,1:y,2:3)=color(1:x,1:y,2:3);
magenta(1:x,1:y,[1,3])=color(1:x,1:y,[1,3]);

%Despliegue en pantalla de las imagenes CMY:
figure
subplot(2,2,1)
imshow(color)
title('IMAGEN ORIGINAL')
subplot(2,2,2)
imshow(amarillo/255)
title('AMARILLO')
subplot(2,2,3)
imshow(cyan/255)
title('CYAN')
subplot(2,2,4)
imshow(magenta/255)
title('MAGENTA')

%Creación de imagen en escala de grises:
gris=rgb2gray(color);
%Despliegue en pantalla de los valores en escala de grises de la imagen:
figure
mesh(double(gris))

%Creación de las matrices de cada color RBG en escala de grises:
rojogris=color(:,:,1);
verdegris=color(:,:,2);
azulgris=color(:,:,3);

%Despliegue en pantalla de las imágenes RGB en escala de grises:
figure
subplot(2,2,1)
imshow(gris)
title('IMAGEN ORIGINAL')
subplot(2,2,2)
imshow(rojogris)
title('ROJO')
subplot(2,2,3)
imshow(verdegris)
title('VERDE')
subplot(2,2,4)
imshow(azulgris)
title('AZUL')