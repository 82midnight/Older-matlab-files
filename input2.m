% 1 m/s input .1m drop from side walk
t=0:.01:19.99;
w=.01:.01:5;
u1=(w/50);
u2=0*ones(1,500);
u3=(w/50);
u4=0*ones(1,500);
u=[u1 u2 u3 u4 ];
plot(t,u)