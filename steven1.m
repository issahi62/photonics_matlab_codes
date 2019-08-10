function [] = steven1()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i=0;
p=1:2:5
x=[1 4 4 ]
y=polyval(p,x);
disp(y)
while i<=100;
    fprintf('hello world\n');
    i=i+1;
end 

end

