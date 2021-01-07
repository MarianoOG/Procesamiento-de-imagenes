clc, close all,
%% Tomar foto de fondo y con letras.
video = videoinput('winvideo',1,'yuy2_640x480');
set(video,'ReturnedColorSpace','rgb');
preview(video);
pause;
disp('Fondo')
fondo=double(rgb2gray(getsnapshot(video)));
pause;
disp('Foto')
foto=fondo-double(rgb2gray(getsnapshot(video)));
foto=limitarvalores(foto);
delete(video);
figure
imshow(foto/255)
%% Tratamiento y filtrado de imagen:
bin=negativo(binarizar(foto,20));
filtrada=filtromin(filtromax(bin,7,1),7,1);
borde=prewitt(filtrada,0);
%% Imprime resultados del tratamiento y filtrado:
figure
    subplot(2,2,1)
    imshow(foto/255)
    subplot(2,2,2)
    imshow(borde/255)
    subplot(2,2,3)
    imshow(bin/255)
    subplot(2,2,4)
    imshow(filtrada/255)
%% Segmentacion de datos:
C=separarmanchas(filtrada,0);
%% Reconociento de figura:
M='';
for i=1:length(C)
    fig=cell2mat(C(i));
    figure
    imshow(fig/255)
    [A,P,E,S]=analizarimagen(fig,0);
    % Condiciones:
    if (A>=8226 && A<=9434 && P>=1355 && P<=1482 && E>=10.43155181 && E<=11.64828011 && S>=1434871.905 && S<=1700149.528)
        M=strcat(M,'A'); end
    if (A>=8169 && A<=9425 && P>=1270 && P<=1410 && E>=12.83384907 && E<=24.1839392887 && S>=1021306.009 && S<=1288134.144)
        M=strcat(M,'B'); end
    if (A>=7695 && A<=8438 && P>=1260 && P<=1320 && E>=5.049611819 && E<=5.985244002 && S>=1304513.584 && S<=1583303.215)
        M=strcat(M,'C'); end
    if (A>=8555 && A<=9666 && P>=1220 && P<=1314 && E>=5.041346872 && E<=5.7328455 && S>=1079826.562 && S<=12830000.086)
        M=strcat(M,'D'); end
    if (A>=9259 && A<=10130 && P>=1399 && P<=1512 && E>=7.041562053 && E<=9.441260956 && S>=1636991.451 && S<=1922319.679)
        M=strcat(M,'E'); end
    if (A>=6771 && A<=7387 && P>=1355 && P<=1428 && E>=2.442591064 && E<=2.660879168 && S>=1067150.222 && S<=1202444.049)
        M=strcat(M,'0'); end
    if (A>=5488 && A<=5963 && P>=988 && P<=1043 && E>=7.487429098 && E<=8.608687276 && S>=752701.2535 && S<=857080.4946)
        M=strcat(M,'1'); end
    if (A>=6334 && A<=7054 && P>=1180 && P<=1284 && E>=7.12831878 && E<=8.786564498 && S>=957733.6967 && S<=1100113.193)
        M=strcat(M,'2'); end
    if (A>=5365 && A<=6033 && P>=857 && P<=958 && E>=6.629204542 && E<=8.232732067 && S>=471998.5669 && S<=618207.2087)
        M=strcat(M,'4'); end
    if (A>=6084 && A<=6771 && P>=1250 && P<=1308 && E>=84.06818283 && E<=750.8652254 && S>=731365.5849 && S<=849561.9866)
        M=strcat(M,'8'); end
    if (A>=11012 && A<=11871 && P>=940 && P<=972 && E>=1.126249687 && E<=1.168883615 && S>=1110184.562 && S<=1243429.423)
        M=strcat(M,'circulo'); end
    if (A>=5937 && A<=6491 && P>=935 && P<=1011 && E>=4.469870493 && E<=4.940756584 && S>=658022.8906 && S<=752050.997)
        M=strcat(M,'flecha'); end
    if (A>=5419 && A<=5948 && P>=792 && P<=848 && E>=2.152200843 && E<=2.31667303 && S>=511607.9898 && S<=588599.7504)
        M=strcat(M,'triangulo'); end
    if (A>=6402 && A<=7064 && P>=708 && P<=772 && E>=2.189247022 && E<=2.307576233 && S>=561726.2923 && S<=648630.0645)
        M=strcat(M,'rectangulo'); end
    if (A>=13110 && A<=14337 && P>=952 && P<=1048 && E>=1.413549021 && E<=1.462548149 && S>=1555078.937 && S<=1789986.008)
        M=strcat(M,'cuadrado'); end
    if (length(C)~=i) M=strcat(M,'-'); end
end