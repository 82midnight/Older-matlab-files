%BM Lab 3 Exercise 2 P3-4

E1=30e6   %psi
E2=E1     %psi
E3=E1   %psi 
A1=4     %in^2
A2=4      %in^2
A3=4      %in^2
L=30      %30in

%run function files (labP1)to obtain element matrixes
K1=Lab3P1(E1,A1,L)
K2=Lab3P1(E2,A2,L)
K3=Lab3P1(E3,A3,L)
%position element matrix to obtain global matrix K
K=[K1(1,1) K1(1,2) 0 0;K1(2,1) (K1(2,2)+K2(1,1)) K2(1,2) 0; 0 K2(2,1) (K2(2,2)+K3(1,1)) K3(1,2); 0 0 K3(2,1) K3(2,2)]
%setup for boundary condition  
Kb=[1 0 0 0; K1(2,1) (K1(2,2)+K2(1,1)) K2(1,2) 0; 0 K2(2,1) (K2(2,2)+K3(1,1)) K3(1,2);0 0 0 1]
F=[0 4000 -10000 0]' %input forces

%solve for nodal displacement
d=Kb\F  

%solve for Reactions
R=K*d 

%solve for forces in each element
E1=K1*d(1:2,1) %Element 1
E2=K2*d(2:3,1) %Element 2
E3=K3*d(3:4,1) %Element 3

