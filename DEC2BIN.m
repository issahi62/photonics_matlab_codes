function [x]=DEC2BIN(num,base)
whole = floor(num);
decpart=num-whole;
res=[];
% for whole part%
if (whole == 0)
res = [];
end
while ( whole >0)
 bina = rem(whole,base);
 res = [num2str(bina) res ];
 whole = floor(whole/base);
end
 if (decpart > 0)
  res=[res '.'];   
 end
while decpart > 0
 decpart= decpart*base;
 decfor = floor(decpart);
 res    = [res num2str(decfor)];
 decpart= decpart-decfor;
end
 
  %fprintf('%f in base %d is %s\n', num,base,res);
  x=res;
  



 
 
 
 
 
 
 