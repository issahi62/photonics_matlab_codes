function [ x y ] = quadratic( a,b,c )
%UNTITLED2 Summary of this function goes here
% a b -> coefficient of x from x^2 to X
% c-> constant
% quadratic functions 

x= (-b+sqrt(b^2-(4*a*c)))/(2*a);
y= (-b-sqrt(b^2-(4*a*c)))/(2*a);

root_checker= (b^2-(4*a*c));
if root_checker<0;
    fprintf('COMPLEX ROOTS\n');
elseif root_checker>0;
    fprintf('REAL ROOTS\n');
else 
   fprintf('EQUAL ROOTS\n');
end

end

