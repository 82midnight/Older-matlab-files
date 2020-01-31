% Problem B-4-15 by BM
num=[0 0 1];
den=[10 20 50];
t=0.01:0.01:20;
impulse(num,den,t)

y=(3/8)*sin(t)-(1/8)*sin(3*t);
plot(t,y)
xlabel('Time (sec)')
ylabel ('y(t)')
title('System response to the forced function')