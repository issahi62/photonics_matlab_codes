function [x] = vprime( t,delta_t )
%UNTITLED Summary of this function goes here
%Detailed explanation goes here
vfunc= 2000*log(14*10^4/14*10^4-2100*t) - 9.8*t;
v1=vfunc + delta_t;
v2=vfunc;

x=(v1-v2)/delta_t;
disp(x);

end
%function [y]=vprime(t,delta_t)
%vfunc= 2000*log(14*10^4/14*10^4-2100*t) - 9.8*t;






%end

