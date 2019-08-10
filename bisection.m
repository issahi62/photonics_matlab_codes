function [x] = bisection(x1,x2)
%UNTITLED Summary of this function goes here
previous=0;
xlower=[];
xupper=[];
relative_error=[];
func_xm=[];
iteration=[];
xmiddle=[];
i=1;
while i<=3
   x3=(x1+x2)/2;
    %functions to be multiplied
    fxn1=(x1^3)-(0.165*(x1^2))+(3.993*(10^-4));
    %fxn2=(x2^3)-(0.165*(x2^2))+(3.993*(10^-4));
    format long
   fxn3=(x3^3)-(0.165*(x3^2))+(3.993*(10^-4));
   %middle number
   xlower=[xlower; x1];
    
    w=fxn1*fxn3;
    %the conditions
    if w<0
        x1=x1;
        x2=x3;
       
    elseif w>0
        x2=x2;
        x1=x3;
        
    else
        x3=x3;
    end
    error=((x3-previous)/x3)*100;
    abs_error=abs(error);
    
    previous=x3;
    
    %an array to display the table
    relative_error=[relative_error;  abs_error];
    format long
    func_xm=[func_xm; fxn3];
    format short
    xupper=[xupper; x2];
    
    iteration=[iteration; i];
    xmiddle=[xmiddle; x3];
      
    i=i+1;
    
    if abs_error<0.5
      break
    end
end
fprintf('  iterations  xlower    xupper   xmiddle  relative-e  fxn(xm)\n');
disp([iteration xlower xupper xmiddle relative_error func_xm]);
x=xmiddle(length(xmiddle));


end

