%System dynamics project acceleration input 3
b=5000;
A=[0 1 0 0;-4888.88 -b/36 444.44 b/36;0 0 0 1;66.667 b/240 -66.667 -b/240];
B=[0;4444.44;0;0];
C=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D=[0;1;0;1];
sys=ss(A,B,C,D);
%Input 15m ride swell at 80km/hr
t=0:.05:2.85;
w=0:.01:.28;
u1=0.6*sin((200/18.7)*w);
u2=zeros(size(u1));
u=[u1 u2];
[y,t]=lsim(sys,u,t);
y1=[1 0 0 0]*y';
y2=[0 1 0 0]*y';
y3=[0 0 1 0]*y';
y4=[0 0 0 1]*y';
%plot(t,y1,'g') %mass 1 tire
subplot(221);plot(t,y4,'b')%mass 2 chasis
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
%Input 15m ride swell at 80km/hr
t=0:.05:2.85;
w=0:.01:.28;
u1=0.6*sin((200/18.7)*w);
u2=zeros(size(u1));
u=[u1 u2];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
subplot(222);plot(t,y1-u,'b')
hold on
plot(t,u,'k','linewidth',2)
title('Relative response x-u')
subplot(223);plot(t,y2-y1,'b')
hold on
plot(t,u,'k','linewidth',2)
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('Relative response y-x')
