function [ S ] = prewitt( E )

EE1 = [1,1,1;0,0,0;-1,-1,-1];
EE2 = rot90(EE1);
EE3 = rot90(EE2);
EE4 = rot90(EE3);

A=filtro3x3(E,EE1);
B=filtro3x3(E,EE2);
C=filtro3x3(E,EE3);
D=filtro3x3(E,EE4);

S=abs(A+B+C+D);

end