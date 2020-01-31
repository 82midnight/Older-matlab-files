%BM Lab 3 Exercise 1
%part (a)
E1=30e6   %psi
E2=E1     %psi
E3=15e6   %psi 
A1=1      %in^2
A2=1      %in^2
A3=2      %in^2
L=30      %30in

%run function files to obtain element matrix
K1=Lab3P1(E1,A1,L)
K2=Lab3P1(E2,A2,L)
K3=Lab3P1(E3,A3,L)
%position element matrix to obtain global matrix K
K=[K1(1,1) K1(1,2) 0 0;K1(2,1) (K1(2,2)+K2(1,1)) K2(1,2) 0; 0 K2(2,1) (K2(2,2)+K3(1,1)) K3(1,2); 0 0 K3(2,1) K3(2,2)]
%setup for boundary condition part (b)
Kb=[1 0 0 0; K1(2,1) (K1(2,2)+K2(1,1)) K2(1,2) 0; 0 K2(2,1) (K2(2,2)+K3(1,1)) K3(1,2);0 0 0 1]
F=[0 3000 0 0]' %input forces

%solve for nodal displacement
d=Kb\F  
%part (c)
GNF=K*d %solve for global nodal displacement 



