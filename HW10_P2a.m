% BM Homework10 P2a 
%solves and graphs differential equation of capacitor

dt=[15 5 0.1]; %set time step sizes in matrix
C=0.1;   %capacitance in fared
R=100;   %resistance in ohms
graph = strcat('g','b','r');  %string concatenation for 3 plots
for A=1:length(dt);
 clear t y  
    y(1)=100;
    t=0:dt(A):90;
 for k=1:length (t)-1;
     y(k+1)=y(k)-dt(A)/(R*C)*y(k); 
 end
 % set up graph for 3 plots
    hold on
    plot(t,y,graph(A))
    title('Voltage vs time of capacitor')
    xlabel('time in seconds')
    ylabel('voltage')
end

