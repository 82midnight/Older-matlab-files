function [DP] = HW12P2(a,b,E,N)
%BM 4/25/2011 Homework12 Problem 2 
%   Equation to govern pump pressure vs flowrate

Q=a:E:b; %set variable Q between limits a to b with increment E
DP=@(Q)(81*Q.^4) +(2.4*Q.^3) -(275*Q.^2) -(7*Q) +41.25 %function DP = equation
plot(Q,DP(Q)) %plot graph 
end

% zero exists at 1.7979 so flowrate is 1.7979
