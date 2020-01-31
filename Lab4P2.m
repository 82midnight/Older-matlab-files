%BM Lab4 Problem 2 3-29
E=210e6 %Kn/m^2
A=4e-4 %m^2
L=3 %m

T1=pi/2 %input angle for element1 
T2=pi/4 %input angle for element2 
T3=0  %input angle for element2

%run subprogram to get element matrixes 
[ K1 ] = Lab4F1( E,A,L,T1 )
[ K2 ] = Lab4F1( E,A,L,T2 )
[ K3 ] = Lab4F1( E,A,L,T3 )

%Setup global matrix system
K=[K1(1,1)+K2(1,1)+K3(1,1) K1(1,2)+K2(1,2)+K3(1,2) K1(1,3) K1(1,4) K2(1,3) K2(1,4) K3(1,3) K3(1,4);K1(2,1)+K2(2,1)+K3(2,1) K1(2,2)+K2(2,2)+K3(2,2) K1(2,3) K1(2,4) K2(2,3) K2(2,4) K3(2,3) K3(2,4);0 0 0 0 0 0 0 0;]% K1(3,1) K1(3,2)+0 K1(3,3) K1(3,4) 0 0;K1(4,1)+0 K1(4,2)+0 K1(4,3) K1(4,4) 0 0;0+K2(3,1) 0+K2(3,2) 0 0 K2(3,3) K2(3,4);0+K2(4,1) 0+K2(4,2) 0 0 K2(4,3) K2(4,4)]

B=K(1:2,1:2)%applying boundary conditions
F=[-10,-20]' %setup force matrix 
V=B\F   %solve displacements 


V=[V(1,1) V(2,1) 0 0]'
%Element force 1 
C1=cos(T1)
S1=sin(T1)
Ek1=[C1 S1 0 0;-S1 C1 0 0;0 0 C1 S1;0 0 -S1 C1]
M1=E*A/L
ds1=Ek1*V
Ea1=[M1 0 -M1 0;0 0 0 0;-M1 0 M1 0;0 0 0 0]
E1f=Ea1*ds1
%stress in KPA
Stress1=E1f(3,1)/A
%strain 
Strain1=(Stress1/E)
%elongation
Elongation1=ds1(3,1)-ds1(1,1)

%Element force 2
C2=cos(T2)
S2=sin(T2)
Ek2=[C2 S2 0 0;-S2 C2 0 0;0 0 C2 S2;0 0 -S2 C2]
M2=E*A/L
ds2=Ek2*V
Ea2=[M2 0 -M2 0;0 0 0 0;-M2 0 M2 0;0 0 0 0]
E2f=Ea2*ds2
%stress in KPa
Stress2=E2f(3,1)/A
%strain 
Strain2=(Stress2/E)
%elongation
Elongation2=ds2(3,1)-ds2(1,1)

%Element force 3
C3=cos(T3)
S3=sin(T3)
Ek3=[C3 S3 0 0;-S3 C3 0 0;0 0 C3 S3;0 0 -S3 C3]
M3=E*A/L
ds3=Ek3*V
Ea3=[M3 0 -M3 0;0 0 0 0;-M3 0 M3 0;0 0 0 0]
E3f=Ea3*ds3
%stress in KPA
Stress3=E3f(3,1)/A
%strain 
Strain3=(Stress3/E)
%elongation
Elongation3=ds3(3,1)-ds3(1,1)