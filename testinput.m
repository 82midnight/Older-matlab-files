% test1 input 0.2032m/s
t=0:.01:5.04;
w=.01:.01:1.01;
u1=(w*.2032);
u2=.2032*ones(1,101);
u3=.2032*ones(1,101);
u4=.2032-(w*.2032);
u5=0*ones(1,101);
u=[u1 u2 u3 u4 u5];
plot(t,u)