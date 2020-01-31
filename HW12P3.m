function [I] = HW12P3(a,b,E,N)
%BM 4/25/2011 Homework12 Problem 3 
%   Equation to govern current through diode

v=a:E:b; %set variable v between limits a to b with increment E
I =@(v)1e-6.*exp(v/0.05) +v-1.9 %function I=equation
plot(v,I(v))   %plot graph 
end

% zero exists at 0.6999 so voltage=0.6999


