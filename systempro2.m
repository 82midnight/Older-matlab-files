%System dynamics project input 3
b=2500;
A=[0 1 0 0;-4888.88 -b/36 444.44 b/36;0 0 0 1;66.667 b/240 -66.667 -b/240];
B=[0;4444.44;0;0];
C=[1 0 0 0;0 0 1 0];
D=[0;0];
sys=ss(A,B,C,D);
% 1 m/s input drop from side walk
t=0:.01:19.99;
w=.01:.01:5;
u1=(w/50);
u2=0*ones(1,500);
u3=(w/50);
u4=0*ones(1,500);
u=[u1 u2 u3 u4 ];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
plot(t,u,'k','linewidth',2)
hold on 
%plot(t,y1,'g') %mass 1 tire
plot(t,y2,'g')  %mass 2 chasis
xlabel('time (seconds)')
ylabel('amplitude displacement(meters)')
title('Time domain response')
%plot(t,y2-y1,'b')
