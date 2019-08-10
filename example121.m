function example121(f) 

time = linspace(0,1, 10001);
plot(time, cos(2*pi*f*time), 'Linewidth', 1.5)
hold on

fs = 20; % sampling frequency 
T=1/fs; %sampling period
t = 0:T:1;
stem(t, cos(2*pi*f*t), 'k', 'filled')

if f>fs/2
    plot(time, cos(2*pi*(fs-f)*time), 'r', 'Linewidth', 1.5)
end 
hold off

