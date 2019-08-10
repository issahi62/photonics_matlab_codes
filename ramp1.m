x = inline('(1/e)*((t>0)&(t<=e))''t''e');
e=1/100; t=[-2,10];
k=(-3:10);
n =(k>=0);
ramp = k.*n;
subplot(2,2,1);
plot(k,ramp);
title('ramp');
subplot(2,2,2);
stem(k,ramp);
title('discrete ramp');
subplot(2,2,3);
fplot(x,t,1e-5,1000,'-',e);
title('impulse');



