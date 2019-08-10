function [] = newtonRaphson( x1 )
    b=1;
    newtons=[];
    iterations=[];
    abs_err=[];
    guessed_value=[];
   while b<=10
       %this is the real function
    functions=(x1^3)-(0.165*(x1^2))+(3.993*(10^-4));
    %thus the functions derivative
    k=3*(x1^2)-(2*0.165*x1);
    %ratio between the function and it's derivative
    newton=functions/k;
    %the newton Raphson equation
    x=x1-newton;
    
    %relative approximate error
    error=((x-x1)/x)*100;
    abs_error=abs(error);
   %an array for concatunation
   iterations=[iterations; b];
   abs_err=[abs_err; abs_error]; 
   newtons=[newtons; x];
   guessed_value=[guessed_value; x1];
    %thus where the newton raphson guessed value changes
   x1=x;
   %the iterator increment
   b=b+1;
   
   if abs_error<0.5
       break
   end
   end
  
  fprintf(' iterations     xi      xi+1    absolute error\n');
   disp([iterations guessed_value newtons abs_err]);
   m=floor(2-log10(2*abs_error));
   disp(m)


end

