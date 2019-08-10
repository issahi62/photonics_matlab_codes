function  [x,y] = quad1(a,b,c)
x = (-b+(b^2 - 4*a*c))/(2*a);
y = (-b-(b^2 - 4*a*c))/(2*a);
