%System dynamics project acceleration input 3
b=2000;
A=[0 1 0 0;-4888.88 -b/36 444.44 b/36;0 0 0 1;66.667 b/240 -66.667 -b/240];
B=[0;4444.44;0;0];
C=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D=[0;1;0;1];
sys=ss(A,B,C,D);
%Input 15m ride swell at 31m/s
t=0:.025:1.475;
w=0:.005:.095;
u1=0.6*sin((200/6.3)*w);
u2=zeros(size(u1));
u3=zeros(size(u1));
u=[u1 u2 u3];
[y,t]=lsim(sys,u,t);
y1=[1 0 0 0]*y';
y2=[0 1 0 0]*y';
y3=[0 0 1 0]*y';
y4=[0 0 0 1]*y';
%plot(t,y1,'g') %mass 1 tire
subplot(221);plot(t,y4,'g')%mass 2 chasis
hold on
plot(t,u,'k','linewidth',2)
xlabel('time (seconds)')
ylabel('amplitude acceleration(m/s^2)')
title('acceleration response y')
%for relative response
A=[0 1 0 0;-4888.88 -b/36 444.44 b/36;0 0 0 1;66.667 b/240 -66.667 -b/240];
B=[0;4444.44;0;0];
C=[1 0 0 0;0 0 1 0];
D=[0;0];
sys=ss(A,B,C,D);
%Input 15m ride swell at 31m/s
t=0:.025:1.475;
w=0:.005:.095;
u1=0.6*sin((200/6.3)*w);
u2=zeros(size(u1));
u3=zeros(size(u1));
u=[u1 u2 u3];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
subplot(222);plot(t,y1-u,'g')
hold on
plot(t,u,'k','linewidth',2)
title('Relative response x-u')
subplot(223);plot(t,y2-y1,'g')
hold on
plot(t,u,'k','linewidth',2)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('Relative response y-x')
