function [x1 x2 x3] = cubicfxn(a,b,c,d)
%matlab for cubic functions
%kobby bryan
%x1 x2 x3  -> roots of cubic funcitions
%a b c -> coefficient of a cubic function x^3--x
%d-> constant
 
e= (1/a)*(c-((b^2)/(3*a)));
f=(1/a)*(d+((2/27)*((b^3)/(a^2)))-((b*c)/(3*a)));
s=(-e)/3;
%almighty formula for the w using the positive square root sign.
%w^2-wf+s^3;
  w=(-f+sqrt((f^2)-(4*(s^3))))/2;
  
  %takes the real number
    k=real(w);
    
    %takes the imaginary number
   m=imag(w);
   
   %magnitude of a complex number
   R=sqrt((k^2)+(m^2));
   
   %angle in radians(O is the angle)
   O=atan2(m,k);
   z1=(R^(1/3))*((cos((O)/3)+(1i*sin((O)/3))));
   z2=(R^(1/3))*((cos((O+2*pi)/3)+(1i*sin((O+2*pi)/3))));
   z3=(R^(1/3))*((cos((O+4*pi)/3)+(1i*sin((O+4*pi)/3))));
   
   %back substitution
   y1=z1+(s/z1);
   y2=z2+(s/z2);
   y3=z3+(s/z3);
   
   %the roots to be displayed 
   x1=y1-(b/(3*a));
   x2=y2-(b/(3*a));
   x3=y3-(b/(3*a));
   
   
   %Issah Ibrahim
  % 10493626

end

