% BM Homework 10 Problem 1
%calculating error of derivative

x=1;                           %set value
h=0.5;                         %set value
fx=5-4*x^2+3*x^3-2*x^4+x^5;    %polynomial function f(x) 
df(x)=-8*x+9*x^2-8*x^3+5*x^4;  %analytical derivative of polynomial function f(x) 

for A=1:999999;                %set loop
    B=(x+h(A));
    fb=5-4*B^2+3*B^3-2*B^4+B^5; 
    dfa= ((fb)-(fx))/h(A);      %calculating approximate derivative 
    error(A)=df-dfa;            %calculate error
    if 1+h>1;                   
        h(A+1)= h(A)/2;
    else
        break                   %if 1+h=1 break loop
    end
end
                                % setup and label graph
semilogx(h,error,'k')
title('error vs h')
xlabel('log h')
ylabel('error')
 
