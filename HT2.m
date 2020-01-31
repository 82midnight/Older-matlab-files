%heat transfer rectangular Project BM
l=0.03;  %(m) length
k=237;   %(W/m-k)
h=35;    %(W/m^2-k)
Tb=100; %(C)
Ts=30;   %(C)
w=1;     %(m) width
n=1;     %sample starting
%s=0.001;  %(m)spacing
t=0.001
for s=0:0.000001:0.0001;
p=(2*w);
A=w*t;
lc=l+(t/2);
m=sqrt((h*p)/(k*A));
E=(tanh(m*lc))/(m*lc);

N=(1/(t+s));

Afin=N*2*(w*l)+(A);
Aunf=1-N*A;
Qfin=E*h*Afin*(Tb-Ts);

Qunf=h*Aunf*(Tb-Ts);
Qtotal=Qfin+Qunf;
Qwofin=h*1*(Tb-Ts);
ETotal=Qtotal/Qwofin;
%if ETotal>=36.8;
   % break
%end
plot(t,ETotal,'g')
xlabel('thickness')
ylabel('overall effectiveness')
grid on
hold on
Y(n)=ETotal;
n=n+1;
   end
   max(Y)
   