
function Assignment
clc
clear all
 
function a=f(t)
  a = 2000*log((14*10^4)/(14*10^4-(2100*t)))-(9.8*t);
end
 t = sym('t','real');
 disp((sprintf('-----------Assignment 2 31/08/2015--------')))
 % input the value of the differential that is needed
 tv= input('Input the value of the differential needed:');
 h = input('Input the value of the step size needed');
 n = input('Input the number of times you want to half the iteration');
 disp(sprintf('Here is our function'))
 disp(f(t))
 disp(sprintf('And here is its differentiation'))
 soln = diff(f(t))
 disp(sprintf('After our differentiation we would evaluate the exact value'))
 Ev = subs(soln,t,tv)
 disp(sprintf('Now for our  main work'))
  j = zeros(1,n);
  N = zeros(1,n);
  H = zeros(1,n);
  Av = zeros(1,n);
  
  for i = 1 : n
  j(i) = i;
  N(i) = 2^(i-1);
  H(i) = h/(N(i));
  Av(i) = (f(tv)-(f(tv-H(i))/H(i)));
  Et(i) = Ev - Av(i);
  et(i) = abs(Et(i)/Ev*100);
  end
  
  results = [ H' Av' Et' et'];
  disp(results)
      
 
end
