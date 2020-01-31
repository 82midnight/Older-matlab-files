%Input 15m ride swell at 11m/s
t=0:.05:2.85;
w=0:.01:.28;
u1=0.6*sin((200/18.7)*w);
u2=zeros(size(u1));
u=[u1 u2];
plot(t,u)

%Input 15m ride swell displacement
%t=0:.46875:29.53125;
%w=0:.1:pi;
%u1=0.6*sin((1)*w);
%u2=zeros(size(u1));
%u=[u1 u2];
%plot(t,u)