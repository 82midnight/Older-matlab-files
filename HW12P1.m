%BM 4/25/2011 Homework 12 Problem 1
a=0; %set lower limit
b=5; %set upper limit
E=0.001; %set convergence tolerance
N=30; %set number of Iterations

% to run problem2 
DP=HW12P2(a,b,E,N); %call function for Problem 2 
Y = DP;  %rename governed function Y

%to run problem3 (unsuppress below to run Problem3 and suppress problem2)
%I=HW12P3(a,b,E,N); %call function for problem 3
%Y = I;  %rename governed function Y

Xlow= a;   %rename lower limit
Xhigh=b;   %rename upper limit
Xmid=(Xlow+Xhigh)/2;  %set midpoint

if (Xlow)*(Xhigh) > 0   %check if a zero exists between limits
    disp('error zero does not exist between limits of a to b')
    break
end

Iteration=0;
while abs(Y(Xmid)) > E
    if (Y(Xmid)*Y(Xhigh)) < 0  %check where root is intervaled  
        Xlow=Xmid;
    else 
        Xhigh=Xmid;
    end
    Iteration=Iteration+1;
    if Iteration>N   % break when Iteration has reached N
        break
    end
    Xmid = (Xlow+Xhigh)/2
    
end

