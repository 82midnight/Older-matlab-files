%Bode digram for transfer function
b=2700;
num=[160000*b 2560000000];
den=[8640 276*b 42816000 160000*b 2560000000];
bode(num,den)
grid
hold on 