x=linspace(-2,2,10);
y=-2:0.1:2;
joy=exp(x);
asamany=exp(y);
subplot(2,2,1);
plot(x,joy);
title('joy Asamany first plot');
xlabel('x values');
ylabel('y values');
subplot(2,2,2);
plot(y,asamany);
title('joy Asamany second plot');
xlabel('x values');
ylabel('y values');