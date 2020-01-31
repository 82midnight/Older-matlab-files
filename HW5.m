%Homework 5 P5_2
format short G

x=12*200/(240^2)
A=10+x
B=10-x

Z=[A 0 5 -10 0 0 ;0 A 5 0 -x 5;5 5 1600 0 -5 400;-10 0 0 A 0 5;0 -x -5 0 A -5;0 5 400 5 -5 1600]
Q=125000*Z
F=[5000 0 0 0 0 0]'

D=Q\F

D1=[0 0 0 .0017122 -.68818 -.0017307]'
D3=[.0017122 .68618 -.0017224 0 0 0]'

C1=10*(30e6)/240
C2=200*(30e6)/(240^3)

Kp=[C1 0 0 -C1 0 0;0 12*C2 6*C2*240 0 -12*C2 6*C2*240;0 6*C2*240 4*C2*240^2 0 -6*C2*240 2*C2*240^2; -C1 0 0 C1 0 0;0 -12*C2 -6*C2*240 0 12*C2 -6*C2*240; 0 6*C2*240 2*C2*240^2 0 -6*C2*240 4*C2*240^2]
F1=Kp*D1
F2=Kp*D
F3=Kp*D3

G=[x 0 -5 -x 0 -5 0 0 0 0 0 0;0 10 0 0 -10 0 0 0 0 0 0 0;-5 0 800 5 0 400 0 0 0 0 0 0;-x 0 5 A 0 5 -10 0 0 0 0 0;0 -10 0 0 A 5 0 -x 5 0 0 0;-5 0 400 5 5 1600 0 -5 400 0 0 0;0 0 0 -10 0 0 A 0 5 -x 0 5;0 0 0 0 -x -5 0 A -5 0 -10 0;0 0 0 0 5 400 5 -5 1600 -5 0 400;0 0 0 0 0 0 -x 0 -5 x 0 -5;0 0 0 0 0 0 0 -10 0 0 10 0;0 0 0 0 0 0 5 0 400 -5 0 800]
V=[0 0 0 .68818 .0017122 -.0017307 .68618 -.0017122 -.0017224 0 0 0]'
R=G*V

