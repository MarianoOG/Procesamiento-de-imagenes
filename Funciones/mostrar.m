function [ S ] = mostrar( E )
S=bitand(15,E);
S=bitshift(E,4);
end