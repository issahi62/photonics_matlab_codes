function[]=functionname(x)
i=1;
while i<4
fxn=x^3-(0.165*x)+3.993*10^-4;
fxn2=(3*x^2)-0.165;
newtons=fxn/fxn2;
newtonraphson=x-newtons;
i=i+1;
disp(newtonraphson);
end

end