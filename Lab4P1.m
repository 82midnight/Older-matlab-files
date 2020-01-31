%BM Lab4 Problem 1
E=210e6 %Kn/m^2
A=6e-4 %m^2
L1=5 %m
L2=4 %m
T1=atan(4/3) %input angle for element1 
T2=atan(4/0) %input angle for element1 
P=1000 %KN force
u1=-.05 %m

%run subprogram to get element matrixes 
[ K1 ] = Lab4F1( E,A,L1,T1 )
[ K2 ] = Lab4F1( E,A,L2,T2 )

%Setup global matrix system
K=[K1(1,1)+K2(1,1) K1(1,2)+K2(1,2) K1(1,3) K1(1,4) K2(1,3) K2(1,4);K1(2,1)+K2(2,1) K1(2,2)+K2(2,2) K1(2,3) K1(2,4) K2(2,3) K2(2,4);K1(3,1)+0 K1(3,2)+0 K1(3,3) K1(3,4) 0 0;K1(4,1)+0 K1(4,2)+0 K1(4,3) K1(4,4) 0 0;0+K2(3,1) 0+K2(3,2) 0 0 K2(3,3) K2(3,4);0+K2(4,1) 0+K2(4,2) 0 0 K2(4,3) K2(4,4)]
Kr=K/25200 %used for reference with book

B=K(1:2,1:2)%applying boundary conditions
B(1,:)=[1 0];
F=[-0.05,P]' %setup force matrix with settling displacement
V=B\F    %solve displacements 
v1=V(2,1)


%Element force 1 
C1=cos(T1)
S1=sin(T1)
Ek1=[C1 S1 0 0;-S1 C1 0 0;0 0 C1 S1;0 0 -S1 C1]
M1=E*A/L1
dis1=[u1 v1 0 0]'
ds1=Ek1*dis1
Ea1=[M1 0 -M1 0;0 0 0 0;-M1 0 M1 0;0 0 0 0]
E1f=Ea1*ds
%stress 
Stress1=E1f(3,1)/A
%strain 
Strain1=(Stress1/E)
%elongation
Elongation1=ds1(3,1)-ds1(1,1)

%Element force 2
C2=cos(T2)
S2=sin(T2)
Ek2=[C2 S2 0 0;-S2 C2 0 0;0 0 C2 S2;0 0 -S2 C2]
M2=E*A/L2
dis2=[u1 v1 0 0]'
ds2=Ek2*dis2
Ea2=[M2 0 -M2 0;0 0 0 0;-M2 0 M2 0;0 0 0 0]
E2f=Ea2*ds2
%stress 
Stress2=E2f(3,1)/A
%strain 
Strain2=(Stress2/E)
%elongation
Elongation2=ds2(3,1)-ds2(1,1)