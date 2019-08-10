function [] = backwards( t,delta_t)
%backwards differentiation
%   t=time
%   delta_t is the change in time 
 title1=[];
 title2=[];
 title3=[];
 
 previous=0;

 
 i=0;
while i==0
    v=2000*log(14e4/(14e4-2100*t))-9.8*t;
    v_2=2000*log(14e4/(14e4-2100*(t-delta_t)))-9.8*(t-delta_t);
    a_a=(v-v_2)/delta_t;
    
    present=a_a;
    if previous == 0
    title1=([title1;0]);
    title2=([title2; delta_t]);
    title3=([title3; a_a]);    
    else
    error=((present-previous)/present)*100;
    abs_error=abs(error);
    
    
    if delta_t == 0.125/2
        break
    end
    
    title1=([title1;abs_error]);
    title2=([title2; delta_t]);
    title3=([title3; a_a]);
    
    
    end
    delta_t=delta_t/2;
    previous=present;
end
significant=floor(2-(log10(abs_error/0.5)));
fprintf('change in t  acceleration  error\n\n\n');
  disp([title2 title3 title1]);
  fprintf('significant error =');
   disp(significant);
  
    
    
    %Issah Ibrahim
    %10493626
    
    
    
 


end

