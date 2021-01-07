function [ S ] = ocultar( A,B )
A2=bitshift(A,-4);
B2=bitshift(B,-4);
A3=bitshift(A2,4);
S=bitor(A3,B2);
end