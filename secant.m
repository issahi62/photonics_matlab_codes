function [  ] = secant(delta_t,x1 )
format long
i=1;
%previous=0;
iterations=[];
xi=[];
xi_1=[];
abs_err=[];
x2=[];
fxn_1=[];
tolerance=0.5;
while i<10
    
    f2=(x1^3)-(0.165*(x1^2))+(3.993*(10^-4));
    f1=((delta_t)^3)-(0.165*((delta_t)^2))+(3.993*(10^-4));
  secant1=x1-(f2*(x1-delta_t)/(f2-f1));
   functions=(secant1^3)-(0.165*(secant1^2))+(3.993*(10^-4));
  error=((secant1-x1)/secant1)*100;  
  abs_error= abs(error);
 
  
 iterations=([iterations; i]);
 xi=([xi;x1]);
 x2=([x2; secant1]);
 xi_1=([xi_1; delta_t]);
 abs_err=([abs_err; abs_error]);
 fxn_1=([fxn_1; functions]);
 delta_t=x1;
 x1=secant1;
   i=i+1;
  if abs_error==tolerance
     break
  end
end
fprintf('iterations     xi-1       xi      xi+1    abserror    f(xi+1)\n');
disp([iterations  xi_1 xi x2 abs_err fxn_1])
  
end

