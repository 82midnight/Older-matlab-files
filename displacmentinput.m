%displacment models
%Input 1 Chatter bump displacment
t=0:.01:30.31;
w=0:.01:(5*pi-.55);
u1=.05+0.05*sin((1.25)*w-(pi/2));
u2=zeros(size(u1));
u=[u1 u2];
subplot(221);plot(t,u)
xlabel('distance (meters)')
ylabel('amplitude displacement(meters)')
title('Chatter bump model')

% Input .1m drop from side walk
t=0:.01:19.99;
w=.01:.01:5;
u1=(w/50);
u2=0*ones(1,500);
u3=(w/50);
u4=0*ones(1,500);
u=[u1 u2 u3 u4 ];
subplot(222);plot(t,u)
xlabel('distance (meters)')
ylabel('amplitude displacement(meters)')
title('sidewalk bump model')

%Input 15m ride swell displacement
t=0:.46875:29.53125;
w=0:.1:pi;
u1=0.6*sin((1)*w);
u2=zeros(size(u1));
u=[u1 u2];
subplot(223);plot(t,u)
xlabel('distance (meters)')
ylabel('amplitude displacement(meters)')
title('15m ride swell model')