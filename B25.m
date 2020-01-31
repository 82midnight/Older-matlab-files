% Problem B-2-25 by BM
t=0.01:0.01:20;
y=(3/8)*sin(t)-(1/8)*sin(3*t);
plot(t,y)
xlabel('Time (sec)')
ylabel ('y(t)=y_h(t)+y_p(t)')
title('System response to the forced function')
