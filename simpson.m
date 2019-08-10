function [] = simpson()
div=input('Enter EVEN number of segments: '); 
syms t;  % t---time(independent variable of interest) 
a=8;  %---lower limit of integration 
b=30; %---upper limit of integration 
fprintf('\n\t\t\t\t\tSIMPSONS 1/3 RULE\n');
v=@(t)(2000*log((14e4)/((14e4)-(2100*t))))-(9.8*t); %--giiven function
true_x=int(v,t,a,b); %---computation of true distance
x=double(true_x); %---double type casting of result
fprintf('\nTrue value of distance covered from  time %d to %d = %f metres\n\n',a,b,x);
approx=[];approx_error=100;appr=[];
k=1;
fprintf('\n n \t\t\tapprox\t\t\t T_error\t\t  |Et|\t\t\t |Ea|\n\n');
for n=2:2:div %---n is the numbe of segments
    h=(b-a)/n;
    i=1:2:n-1; %---odd subscripts 
    j=2:2:n-2; %---even subscripts 
    appr(k)=(h/3)*(subs(v,t,a)+(4*sum(subs(v,t,(a+h.*i)))+(2*sum(subs(v,t,(a+h.*j))))+subs(v,t,b)));
    approx=[approx appr(k)]; %--concatenation 
    true_error=x-appr; 
    t_error=abs(true_error/x)*100;
    if k==1
        approx_error(1)=100;
    else
    approx_error(k)=abs((appr(k)-appr(k-1))/appr(k))*100;
    end
    fprintf(' %d\t\t%f\t\t%f\t\t%f\t\t%f\n',n,approx(k),true_error(k),t_error(k),approx_error(k));
 k=k+1;
end 
end 

