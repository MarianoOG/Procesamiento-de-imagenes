function [ S ] = colorear( E,x,y,v )
p=E(x,y);
E(x,y)=v;
k=1;
o=1;
while(1)
    %imshow(E/255)
    %hold on
    %pause(1)
    f=length(x);
    for i=o:f
        if (E(x(i),y(i)+1)==p)
            E(x(i),y(i)+1)=v;
            k=k+1;
            x(k)=x(i);
            y(k)=y(i)+1;
        end
        if (E(x(i)+1,y(i)+1)==p)
            E(x(i)+1,y(i)+1)=v;
            k=k+1;
            x(k)=x(i)+1;
            y(k)=y(i)+1;
        end
        if (E(x(i)+1,y(i))==p)
            E(x(i)+1,y(i))=v;
            k=k+1;
            x(k)=x(i)+1;
            y(k)=y(i);
        end
        if (E(x(i)+1,y(i)-1)==p)
            E(x(i)+1,y(i)-1)=v;
            k=k+1;
            x(k)=x(i)+1;
            y(k)=y(i)-1;
        end
        if (E(x(i),y(i)-1)==p)
            E(x(i),y(i)-1)=v;
            k=k+1;
            x(k)=x(i);
            y(k)=y(i)-1;
        end
        if (E(x(i)-1,y(i)-1)==p)
            E(x(i)-1,y(i)-1)=v;
            k=k+1;
            x(k)=x(i)-1;
            y(k)=y(i)-1;
        end
        if (E(x(i)-1,y(i))==p)
            E(x(i)-1,y(i))=v;
            k=k+1;
            x(k)=x(i)-1;
            y(k)=y(i);
        end
        if (E(x(i)-1,y(i)+1)==p)
            E(x(i)-1,y(i)+1)=v;
            k=k+1;
            x(k)=x(i)-1;
            y(k)=y(i)+1;
        end
    end
    o=f+1;
    if (length(x)<o) break; end
end
S=E;
end