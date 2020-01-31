%Input 15m ride swell at 31m/s
t=0:.025:.975;
w=0:.005:.095;
u1=0.6*sin((200/6.3)*w);
u2=zeros(size(u1));
u=[u1 u2];
plot(t,u)