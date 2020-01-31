%PID controller for project2
Wn=5;
A=.7647645443;

%for i=-10:5:10
%kp=60
%ki=150
%kd=12.5

kp=(2.15*Wn^2-11.16198172)/A
ki=(Wn^3)/A
kd=1.75*Wn/A
O=(A*kp)+11.16198172-(ki/kd)

num=A*[kd kp ki];
den=[1 A*kd (A*kp+11.16198172) A*ki];
sys1=tf(num,den)
t=0:0.01:2;
step(sys1,t)
%legend('kd=1.4','kd=6.4')
hold on 
%end
kp=60
ki=150
kd=12.5
num=A*[kd kp ki];
den=[1 A*kd (A*kp+11.16198172) A*ki];
sys1=tf(num,den)
t=0:0.01:2;
step(sys1,t)
legend('ITAE','manually tuned')