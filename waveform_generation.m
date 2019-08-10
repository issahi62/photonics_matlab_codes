fs = 10000; % sampling frequency
f = 80; % frequency 
T= 1/fs; % sampling period
t = 0:T:2; % time vector
y = sawtooth(2*pi*f*t);
figure(1); plot(t, y); 
axis([0, .5, -1.1 1.1]); 

f_a = 2000; 
fs_a = 50000; 
T = 1/fs_a; 
time = 0:T:0.5;
% at t=0 phase of the signal is pi/4; 

y = sawtooth(2*pi*f*time+pi/4); 

figure(2); plot(time, y); 
axis([0.01 .5, -1.1 1.1]); 
