%Problem B-5-18 BM
t=0:0.1:100;
A=[0 1 0 0;-9 -2 6 2;0 0 0 1;3 1 -3 -1];
B=[0;0;0;0.05];
C=[1 0 0 0;0 0 1 0];
D=[0;0];
sys=ss(A,B,C,D);
t1=0:0.1:10;
t2=10.1:0.1:100;
t2=zeros(size(t2));
u=[t1,t2];
[y,t]=lsim(sys,u,t);
y1=[1 0]*y';
y2=[0 1]*y';
subplot(221);plot(t,y1)
subplot(222);plot(t,y2)
subplot(223);plot(t,y2-y1)
