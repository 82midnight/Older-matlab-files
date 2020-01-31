%AEM Data calculation
%Load data
[data]=xlsread('Log1.xlsx'); 
[Tables]=xlsread('AEM accel tables.xlsx'); 
textdata={'Seconds' ,'d+Throttle','AccelFuel','AccelFuel+Max','Accelmod','Accel dTPS','Accel dTPS Latched','Engine Load','EngineSpeed','FuelInj1Pulse','FuelMap','FuelTrimAccel','O2','Throttle'}; 
datastart = data;

%calculating for O2 time delay
X=data(:,7);
Y=-.0002*X+.5634;
D=Y/.020;
DIV=round(D);
%for n=1:length(data); %add seconds to O2 to compensate for delay.
  %  NX=DIV(n,1);
   % O2Del=data(n+NX,11);
%end

%Filter data
indices = find(data(:,2)<=1.6);
% find all row indices in the second column of your matrix X that are equal to zero
%data(indices,:) = [];
% get rid of all the rows in X that correspond to the row indices you found in the step before

%data(:,10) = [];
%textdata(:,10) = [];
% get rid of colomn 10
%data(:,4) = [];
%textdata(:,4) = [];
% get rid of colomn 4
%data(:,4) = [];
%textdata(:,4) = [];

Load = data(:,8);
O2 = data(:,13);
O2Ideal=-.229*Load+12.5;
% 0 = 12.5, -2.0 = 12.8, -4.0 = 13.2, -5.7 = 13.5, -7.7 = 14.1, -9.6 = 14.7
O2delta= O2Ideal-O2;


%Split columns
Seconds = data(:,1);
dThrottle = data(:,2);
AccelFuel = data(:,3);
AccelFuelMax = data(:,4);
AccelMod = data(:,5);
AcceldTPS = data(:,6);
AcceldTPSLatched = data(:,7);
EngineLoad = data(:,8);
Enginespeed = data(:,9);
FuelInj1pulse = data(:,10);
FuelMap = data(:,11);
FuelTrimAccel= data(:,12);
O2 = data(:,13);
Throttle = data(:,14);

%Calculations
Gas=.00715; %gas flow (g/ms)
Fuelingrams=Gas*FuelInj1pulse; %(grams)
IdealFuel=(Fuelingrams.*O2)./O2Ideal; %(grams)
Fueltarget=IdealFuel./Gas;%(ms)

%Data_delta=[Seconds,O2,O2Ideal,Enginespeed,dThrottle,Throttle];
%Data_ms=[Seconds,AccelFuel,FuelMap,FuelInj1pulse,Fueltarget];

%Dtaccel Calculation/Interpolation
for n=1:length(dThrottle);
    for m=1:16%length(Tables(4,:));
    if dThrottle(n,1)>= Tables(4,m)&& dThrottle(n,1)<= Tables(4,m+1);
        I=dThrottle(n,1);        
        LI=Tables(4,m);  %lower range of input
        HI=Tables(4,m+1);    %higher range of input
        LO=Tables(5,m);    %lower range of output
        HO=Tables(5,m+1);    %higher range of output
        format('short')
        I<HI & I>LI;
        AccelDT(n,1)=(((I-LI)*(HO-LO))/(HI-LI))+LO;
        end;
    end;
end

%Throttle Accel Calculation/Interpolation
for n=1:length(Throttle);
    for m=1:16%length(Tables(1,:));
    if Throttle(n,1)>= Tables(1,m)&& Throttle(n,1)<= Tables(1,m+1);
        I=Throttle(n,1);        
        LI=Tables(1,m);  %lower range of input
        HI=Tables(1,m+1);    %higher range of input
        LO=Tables(2,m);    %lower range of output
        HO=Tables(2,m+1);    %higher range of output
        format('short')
        I<HI & I>LI;
        AccelTH(n,1)=(((I-LI)*(HO-LO))/(HI-LI))+LO;
        end;
    end;
end

%RPM Accel Calculation/Interpolation
for n=1:length(Enginespeed);
    for m=1:16;
    if Enginespeed(n,1)>= Tables(7,m)&& Enginespeed(n,1)<= Tables(7,m+1);
        I=Enginespeed(n,1);        
        LI=Tables(7,m);  %lower range of input
        HI=Tables(7,m+1);    %higher range of input
        LO=Tables(8,m);    %lower range of output
        HO=Tables(8,m+1);    %higher range of output
        format('short')
        I<HI & I>LI;
        AccelRPM(n,1)=(((I-LI)*(HO-LO))/(HI-LI))+LO;
        end;
    end;
end

%Calculation
AccSen=.91; %Accel Sensitivity .091
%ACC=AccSen*FuelMap.*AccelRPM.*AccelTH.*AccelDT./1000000;%ran through interpolator 
ACC=AccSen*FuelMap.*AccelMod.*AcceldTPSLatched.*AccelRPM./1000000;
ABB=ACC+FuelMap%+(FuelTrimAccel-AccelFuel);
ACC(indices,:) = [0]; %zero nonactive accel

Atables=[Seconds,AccelFuel,ABB,FuelInj1pulse]
ZZ=(FuelMap+FuelTrimAccel)
AC=(AccelFuel-ACC)
ABC=AC+ABB
xlswrite('Atables.xlsx',Atables);% export to excel


%PLOT 
subplot(222)
%plot(Seconds,ZZ,'b')
%hold on
%plot(Seconds,AccelFuel,'p')
%hold on
%plot(Seconds,ACC,'r')%Calculated Accelfuel
%hold on
%plot(Seconds,ABC,'g')%Calculated
%hold on
plot(Seconds,FuelInj1pulse,'y')
hold on
%plot(Seconds,AC,'o')
%hold on
plot(Seconds,FuelMap,'c')
hold on
plot(Seconds,ABB,'m')%Calculated INJ
hold on
xlabel('time (seconds)')
ylabel('ABC(ms)')
title('plot')

%subplot(222);plot(Seconds,AccelFuel,'r')
%xlabel('time (seconds)')
%ylabel('AccelFuel(ms)')
%hold on
%subplot(223);plot(Seconds,FuelInj1pulse,'g')
%xlabel('time (seconds)')
%ylabel('FuelInj1pulse(ms)')
%hold on

%Check=[dThrottle,AccelDT,Throttle, AccelTH,Enginespeed, AccelRPM,];