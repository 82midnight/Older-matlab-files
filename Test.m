%BM Lab 3 Exercise 1
C=.5
S=sqrt(3)/2
M=(2/sqrt(3))
%run function files to obtain element matrix
K1=[C^2 C*S -C^2 -C*S; C*S S^2 -C*S -S^2;-C^2 -C*S C^2 C*S; -C*S -S^2 C*S S^2]
K1=K1*M
%position element matrix to obtain global matrix K
K=[K1(1,1) K1(1,2) 0 0;K1(2,1) (K1(2,2)+K2(1,1)) K2(1,2) 0; 0 K2(2,1) (K2(2,2)+K3(1,1)) K3(1,2); 0 0 K3(2,1) K3(2,2)]




