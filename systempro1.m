%System dynamics project input 1
b=2700;
A=[0 1 0 0;-4888.88 -b/36 444.44 b/36;0 0 0 1;66.667 b/240 -66.667 -b/240];
B=[0;4444.44;0;0];
C=[1 0 0 0;0 0 1 0];
D=[0;0];
sys=ss(A,B,C,D);
%Input Chatter bump displacment
t=0:.025:2.925;
w=0:.005:.29;
u1=.05+0.05*sin(((200/3.1)*w)-(pi/2));
u2=zeros(size(u1));
u=[u1 u2];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
plot(t,u,'k','linewidth',2)
hold on 
subplot(221);plot(t,y1-u)
title('Relative response x-u')
subplot(223);plot(t,y2-y1)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('Relative response y-x')
