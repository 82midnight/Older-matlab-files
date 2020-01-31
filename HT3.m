%heat transfer parabolic Project BM
l=0.03;  %(m) length
k=237;   %(W/m-k)
h=35;    %(W/m^2-k)
Tb=100;  %(C)
Ts=30;   %(C)
w=1;     %(m) width
n=1;     %sample starting
s=0.001;  %(m)spacing
%t=0.003
for t=0:0.00001:0.01
p=(2*w);
A=w*t;
m=sqrt((2*h)/(k*t));
E=(2/(1+sqrt((2*m*l)^2 +1)));
C1=sqrt(1+(t/l)^2);
N=(1/(t+s))

Afin=N*w*l*(C1+(l/t)*log((t/l)+C1))
Aunf=1-N*A;
Qfin=E*h*Afin*(Tb-Ts);
Qunf=h*Aunf*(Tb-Ts);
Qtotal=Qfin+Qunf;
Qwofin=h*1*(Tb-Ts);
ETotal=Qtotal/Qwofin
%if ETotal>=21.42
    %break
%end
plot(t,ETotal)
grid on
hold on
xlabel('thickness')
ylabel('overall effectiveness')
Y(n)=ETotal;
n=n+1;
   end
   max(Y)