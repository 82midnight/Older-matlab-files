%Interpolation Program
I=[1.44	1.14 1.153] ; %input
LI=.053;  %lower range of input
HI=5;    %higher range of input
LO=0;    %lower range of output
HO=.5;    %higher range of output
format('short')
if I<HI & I>LI;
O=(((I-LI)*(HO-LO))/(HI-LI))+LO
else
    display('O = NA')
    display('input value not within limits')
end

