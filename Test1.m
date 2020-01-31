%System dynamics project2 test

A=[0 1 0 0;0 0 .39651608 0;0 0 0 1;0 0 11.16198172 0];
B=[0;.6993006916;0;-.7647645];
C=[1 0 0 0;0 0 1 0];
D=[0;0];
sys=ss(A,B,C,D);
[num,den]=ss2tf(A,B,C,D)
% test1 input 0.2032m/s
t=0:.01:5.04;
w=.01:.01:1.01;
u1=(w*.2032);
u2=.2032*ones(1,101);
u3=.2032*ones(1,101);
u4=.2032-(w*.2032);
u5=0*ones(1,101);
u=[u1 u2 u3 u4 u5];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
step(sys)


%test
num=[0 0 1]
den=[1.307592371 0 14.595318]
[A,B,C,D]=tf2ss(num,den)