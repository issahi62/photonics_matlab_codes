function [ x ] = Conv(a,b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
e = [ ];
i= 1;

while i;
    if b<=a
        r=rem(a,b);
        q=(a-r)/b;
        a=q;
        e =[r e];
    end
    else
        r=a;
        e=[r e];
        x= e;
        break;
    end
    i=i+1;
    
end


end

