%80km/hr input Chatter bump 
%t=0:.025:2.925;
%w=0:.005:.29;
%u1=.05+0.05*sin(((200/3.1)*w)-(pi/2));
%u2=zeros(size(u1));
%u=[u1 u2];
%plot(t,u)
%xlabel('time (seconds)')
%ylabel('amplitude displacement(meters)')
%title('Chatter input 80km/hr')

%Input Chatter bump displacment
t=0:.01:30.31;
w=0:.01:(5*pi-.55);
u1=.05+0.05*sin((1.25)*w-(pi/2));
u2=zeros(size(u1));
u=[u1 u2];
plot(t,u)
xlabel('distance (meters)')
ylabel('amplitude displacement(meters)')
title('Chatter bump model')