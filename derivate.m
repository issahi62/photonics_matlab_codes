function[k]=derivate()
a=20;
%b=40;
x=0:2*pi;
y=a*sin(x/2);
k=diff(y);

end

