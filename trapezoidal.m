function [] = trapezoidal()
div=input('Enter number of segments: '); 
syms t; %t---time(independent variable of interest) 
a=8;  %---lower limit of integration 
b=30; %---upper limit of integration    
fprintf('\n\t\t\t\t\tTRAPEZOIDAL RULE\n\n');
v=@(t)(2000*log((14e4)/((14e4)-(2100*t))))-(9.8*t);  
true_x=int(v,t,a,b);%---computation of true distance
x=double(true_x); %---double type casting of result
fprintf('\nTrue value of distance covered from  time %.2f to %.2f = %f metres\n\n',a,b,x);
approx=[];
for n=1:div %---n is the number of segments
    h=(b-a)/n; 
    i=1:1:n-1;
    appr=(h/2)*(subs(v,t,a)+(2*sum(subs(v,t,(a+(h.*i)))))+subs(v,t,b)); 
    approx=[approx appr];%--concatenation
end
fprintf('n\t\tdistance\t\tt_error\t\t \tt_error\t\t  \ta_error\t\n\n');
for k=1:div
    if k==1 
    eapprox(1)=100;
    else 
    eapprox(k)=abs((approx(k)-approx(k-1))/approx(k))*100;
    end
    fprintf('%d\t\t%.3f\t\t%.3f \t\t%.3f\t\t\t%.3f\t\n',k ,approx(k),(x-approx(k)),(abs((x-approx(k))/x)*100),eapprox(k));
end      
end 

