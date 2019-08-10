function [] = regression()
%regression by
% Issah Ibrahim
%  10493626
%an array to display the table.
ben=[];
issah=[];
sarah=[];
robert=[];
steven=[];

%reading of data
array=csvread('redata.csv');
%regression values
firstcolumn=array(:,1);
n=length(firstcolumn);
addition1=sum(firstcolumn);
secondcolumn=array(:,2);
addition2=sum(secondcolumn);
newsy=sum(secondcolumn.^2);
syy=(newsy-(n*(addition2/n)^2));
thesquare1=sum(firstcolumn.^2);
themultiplier=sum(firstcolumn.*secondcolumn);
% the b bar of the linear regression
beta=((n*themultiplier)-(addition1*addition2))/((n*thesquare1)-(addition1^2));
% the a of the linear regression
alpha=(addition2/n)-(beta*(addition1/n));
%Xr=(1:53:n);
y=alpha+(beta.*firstcolumn);
r2=((((n*themultiplier)-(addition1*addition2))/n)^2)/((((n*thesquare1)-(addition1^2))/n)*syy);
k=r2*100;
p=sqrt(r2);
%concatunation of the values to produce a table
ben=[ben,firstcolumn];
issah=[issah, secondcolumn];
sarah=[sarah,firstcolumn.^2];
robert=[robert,secondcolumn.^2];
steven=[steven,firstcolumn.*secondcolumn];
%displaying the tables in the various y
fprintf('A TABLE TO SHOW THE VARIOUS VARIABLES\n\n');
fprintf('           x              y              Sum of x^2                 Sum of y^2              Sum of x and y\n');
disp([ben issah sarah robert steven])

%to display the summation of x y Sxx Syy and Sxy
fprintf('THE SUM OF THE VARIOUS VARIABLES ABOVE\n\n');
fprintf('the sum of x:.....');
disp(addition1);
fprintf('the sum of y:....');
disp(addition2);
fprintf('the sum of Sum of x^2:....');
disp(thesquare1);
fprintf('the sum of  Sum of y^2:...');
disp(newsy);
fprintf('the sum of  Sum of x * y:....');
disp(themultiplier);
fprintf('THE VALUES OF THE CONSTANTS AND THE PEARSON"S CORRELATIONS\n\n');

%the values to be displaced on for the line of best fit
fprintf('the value of the b:.....');
disp(beta);
fprintf('the value of the constant a:....'); 
disp(alpha);
fprintf('coefficient of determination:....');
disp(r2);
fprintf('coefficient of determination in percentage:.....');
disp(k);
fprintf('Pearson correlation:......');
disp(p);
%to draw the scatter diagram with the grids on
scatter(firstcolumn,secondcolumn,'*b');
hold on
plot(firstcolumn,y);
title('Regression of: Ghana standard Authority');
xlabel('Ghana"s economy');
ylabel('rise in goods');
zoom on

grid on


end

