%BM Lab 2 example 2.2 pg49
%PART A
K1=[2000 -2000 0 0 0;-200 200 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0]
K2=[0 0 0 0 0;0 200 -200 0 0;0 -200 200 0 0;0 0 0 0 0;0 0 0 0 0]
K3=[0 0 0 0 0;0 0 0 0 0;0 0 200 -200 0;0 0 -200 200 0;0 0 0 0 0]
K4=[0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 200 -200;0 0 0 -200 200]
K=K1+K2+K3+K4 %add element matrix stiffness to get global stiffness matrix

%PART B
U=[0 0 .02]'     %boundary conditions
A=[1 0 0 ;-2000 4000 -2000 ;0 0 1;]
X=A\U %solve for node displacement 

%PART C
NF=K*X %solve global nodal force

%PART D
%Element 1
EK=K1(1:2,1:2)
EX1=X(1:2,:); %set node displacement matrix 2x1
E1=EK*EX1 %solve to get force in element

%Element 2
EX2=X(2:3,:); %set node displacement matrix 2x1
E2=EK*EX2 %solve to get force in element

%Element 3
EX3=X(3:4,:); %set node displacement matrix 2x1
E3=EK*EX3 %solve to get force in element

%Element 4
EX4=X(4:5,:); %set node displacement matrix 2x1
E4=EK*EX4 %solve to get force in element
