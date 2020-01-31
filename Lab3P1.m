function [ K ] = Lab3P1( E,A,L )
M=(E*A)/L
K=[M -M;-M M] 

end

