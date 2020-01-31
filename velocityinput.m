%11m/s input Chatter bump 
t=0:.025:2.925;
w=0:.005:.29;
u1=.05+0.05*sin(((200/3.1)*w)-(pi/2));
u2=zeros(size(u1));
u=[u1 u2];
subplot(221);plot(t,u)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('Chatter input 11m/s')

% 1 m/s input .1m drop from side walk
t=0:.01:19.99;
w=.01:.01:5;
u1=(w/50);
u2=0*ones(1,500);
u3=(w/50);
u4=0*ones(1,500);
u=[u1 u2 u3 u4 ];
subplot(222);plot(t,u)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('sidewalk bump model 1m/s')

%Input 15m ride swell at 11m/s
t=0:.05:2.85;
w=0:.01:.28;
u1=0.6*sin((200/18.7)*w);
u2=zeros(size(u1));
u=[u1 u2];
subplot(223);plot(t,u)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('15m ride swell model 11m/s')