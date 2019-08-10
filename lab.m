function [ conversion ] = myfunction( decimal basic )
%codes to change decimals to binary
%   for division a quotient and the remainder should be considered.

display=[];
while i>0;
     basic<=decimal
    remainder=rem(floor(decimal) basic);
    quotient=(decimal-remainder)/basic;
    display=[remainder display];
   
        
  
    end
    multiplier=10;
    while b>1;
        decimal_part=decimal - floor(decimal);
        recording=floor(decimal_part)/multiplier;
        multiplier=multiplier*10;
        remaining=decimal_part- floor(decimal_part);
    end
    conversion=display + recording;
    
   
        
        
        
        
    
    
    

end

