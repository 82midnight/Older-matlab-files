function [ K ] = Lab4F1( E,A,L,T )
M=(E*A)/L
C=cos(T);
S=sin(T);
KS=[C^2 C*S -C^2 -C*S;C*S S^2 -C*S -S^2;-C^2 -C*S C^2 C*S;-C*S -S^2 C*S S^2]
K=M*KS
end


