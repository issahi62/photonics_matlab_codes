t=-1:0.01:1;
unitstep = (t>=0);
ramp = (t.*unitstep);
plot(t,ramp);
title('ramp');
xlabel('x_axis');
ylabel('y_axis');
diary off 
