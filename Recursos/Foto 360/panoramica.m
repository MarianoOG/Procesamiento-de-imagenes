foto1=rgb2gray(imread('360-1.jpg'));
foto2=rgb2gray(imread('360-2.jpg'));
foto3=rgb2gray(imread('360-3.jpg'));
foto4=rgb2gray(imread('360-4.jpg'));
foto5=rgb2gray(imread('360-5.jpg'));
foto6=rgb2gray(imread('360-6.jpg'));
foto7=rgb2gray(imread('360-7.jpg'));
foto8=rgb2gray(imread('360-8.jpg'));
foto9=rgb2gray(imread('360-9.jpg'));
foto10=rgb2gray(imread('360-10.jpg'));
foto11=rgb2gray(imread('360-11.jpg'));
foto12=rgb2gray(imread('360-12.jpg'));
foto13=rgb2gray(imread('360-13.jpg'));
foto14=rgb2gray(imread('360-14.jpg'));
foto15=rgb2gray(imread('360-15.jpg'));
foto16=rgb2gray(imread('360-16.jpg'));
foto17=rgb2gray(imread('360-17.jpg'));
foto18=rgb2gray(imread('360-18.jpg'));
foto19=rgb2gray(imread('360-19.jpg'));
foto20=rgb2gray(imread('360-20.jpg'));
foto21=rgb2gray(imread('360-21.jpg'));
foto22=rgb2gray(imread('360-22.jpg'));
foto23=rgb2gray(imread('360-23.jpg'));
foto24=rgb2gray(imread('360-24.jpg'));
foto25=rgb2gray(imread('360-25.jpg'));
foto26=rgb2gray(imread('360-26.jpg'));
foto27=rgb2gray(imread('360-27.jpg'));
foto28=rgb2gray(imread('360-28.jpg'));
foto29=rgb2gray(imread('360-29.jpg'));
foto30=rgb2gray(imread('360-30.jpg'));
foto31=rgb2gray(imread('360-31.jpg'));
foto32=rgb2gray(imread('360-32.jpg'));
foto33=rgb2gray(imread('360-33.jpg'));
foto34=rgb2gray(imread('360-34.jpg'));
foto35=rgb2gray(imread('360-35.jpg'));
foto36=rgb2gray(imread('360-36.jpg'));

a=209;
b=331;

%Se pegan las imagenes en una sola
previo=[foto36(:,a:b),foto35(:,a:b),foto34(:,a:b),foto33(:,a:b),foto32(:,a:b),foto31(:,a:b),foto30(:,a:b),foto29(:,a:b),foto28(:,a:b),foto27(:,a:b),foto26(:,a:b),foto25(:,a:b),foto24(:,a:b),foto23(:,a:b),foto22(:,a:b),foto21(:,a:b),foto20(:,a:b),foto19(:,a:b),foto18(:,a:b),foto17(:,a:b),foto16(:,a:b),foto15(:,a:b),foto14(:,a:b),foto13(:,a:b),foto12(:,a:b),foto11(:,a:b),foto10(:,a:b),foto9(:,a:b),foto8(:,a:b),foto7(:,a:b),foto6(:,a:b),foto5(:,a:b),foto4(:,a:b),foto3(:,a:b),foto2(:,a:b),foto1(:,a:b)];
final=previo(50:420,:); %Se recortan los extremos superior e inferior para reducir el error.
imshow(final);
imwrite(final,'foto360.jpg')
