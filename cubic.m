function [ ] = cubic(a,b,c,d)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%y=z+(s/z);
    %function []=cubic(f,s,j)
e= (1/a)*(c-(b^2/3*a));
f=(1/a)*(d+((2/27)*(b^3/a^2))-(b*c/3*a));
s= -e/3;

    w = (-f+sqrt(f^2-4*s^3))/2;
    q=(-f-sqrt(f^2-4*s^3))/2;
    z=w^(1/3);
    p=q^(1/3);
    y=z+s/z;
    Y=p+s/p;
    x1=y-(b/3*a);
    x2=Y-(b/3*a);
    x3=conj(x2);
    disp([x1 x2 x3]')
    
    
   
    
    
    
        





end

