
function[] =cub(a,c,b,d)%a,b,c,d are the coefficients of the cubic equation
  a=input('enter value a:');
  b=input('enter value b:');
  c=input('enter value c:');
  d=input('enter value d:');
  e=(c-b^2/3*a)/a;
  f=(d+ ((2*b^3)/(27*a^2))-(b*c/3*a));
  s=(-e/3);
  w=roots([1,f,(-(e^3)/27)]);
  r=abs(w(1));
  p=angle(w(1));
  for k=0:1:2
      z= (r^(1/3))*((cos((p+(2*pi*k))/3))+i*(sin(p+(2*pi*k)/3)));
      y=z+(s/z);
      x(k+1)=y-(b/3*a)
  end
  
end
