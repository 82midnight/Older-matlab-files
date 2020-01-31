L=200000;
R=.036/12;
%M=L*((R*((1+R)^1))/(((1+R)^1)-1));
%A=M-L;
%B=L-A;

for t=1:1:120
M=L*((R*((1+R)^t))/(((1+R)^t)-1))
%A=M-L;
%B=L-A;
%B=L*(((1+R)^t)-((1+R)^t))/(((1+R)^t)-1)
xlabel('time');
ylabel('balance left');
plot(t,B)
hold off
end
