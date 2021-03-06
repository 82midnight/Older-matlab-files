%For Circle Iterations

%T=2.318;
%Y=(.7117*Cosd(T))-.3571;
%Z=(.7117*Sind(T))-.6159;
%Y=Y*25.4;
%Z=Z*25.4;
%N10=[Y Z]

%for Iter=0:119;
%dT=Iter/2    ;
%Y=(.7117*Cosd(dT))-.3571;
%Z=(.7117*Sind(dT))-.6159;
%Y=Y*25.4;
%Z=Z*25.4;
%N=[Y Z]
%end

%T2=59.9276;
%Y=(.7117*Cosd(T2))-.3571;
%Z=(.7117*Sind(T2))-.6159;
%Y=Y*25.4;
%Z=Z*25.4;
%N=[Y Z]

%for 19.09mm cutter no comp
%y0 is -.3571 from center
%Z0 is .6606 from top of part
for Iter=0:180;
dT=Iter/2    ;
Y=(1.0899*Cosd(dT))-0.0;
Z=(1.0899*Sind(dT))-1.0899;
Y=Y*25.4;
Z=Z*25.4;
G1=[Y,Z]
end

%for 20mm cutter no comp
%y0 is -.3571 from center
%Z0 is .6606 from top of part
%for Iter=0:180;
%dT=Iter/2    ;
%Y=(1.1052*Cosd(dT))-0.0;
%Z=(1.1052*Sind(dT))-1.1052;
%Y=Y*25.4;
%Z=Z*25.4;
%G1=[Y,Z]
%end


