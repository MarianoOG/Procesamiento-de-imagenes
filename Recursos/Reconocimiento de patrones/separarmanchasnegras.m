function [ S ] = separarmanchasnegras( E,b )
[x,y]=size(E);
S=E;
n=10;
for i=b:x-b
    for j=b:y-b
        if (S(i,j)==0)
            
            for k=j:y
                
                S(i,k)=n;
                for p=i:-1:1
                    if (S(p,k)==255) break; end
                    S(i,k)=n;
                end
                for p=i:x
                    if (S(p,k)==255) break; end
                    S(i,k)=n;
                end
                if (S(i,k)==255) n=n+10; break; end
            end
            
        end
    end
end

end