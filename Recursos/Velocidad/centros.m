for i=17:25
    numero=num2str(i);
    nombre=strcat('filtrada',numero,'.jpg');
    foto=imread(nombre);
    [a,b]=size(foto);
    x=0;
    y=0;
    s=0;
    for k=1:a
        for j=1:b
            if (foto(k,j)~=0)
                s = s + 1;
                x = x + k;
                y = y + j;
            end
        end
    end
    C(1,i-16)=x/s;
    C(2,i-16)=y/s;
end
for j=1:9
    c(j) = sqrt(C(1,j)^2+C(2,j)^2);
end
for k=1:8
    v(k) = ( c(k) + c(k+1) ) / 0.02e-3;
end
for l=1:7
    a(l) = ( v(l) + v(l+1) ) / 0.02e-3;
end
a