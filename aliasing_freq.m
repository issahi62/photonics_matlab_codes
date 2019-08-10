fs = 20; % sampling frequency 
N = 1:3; %number of possible aliasing 
f = [0: .1:40]'; 
fa = zeros(401,length(N)); 
for n=1:401
    aliasfreq = abs(N*fs-f(n)); 
    aliasfreq(aliasfreq>f(n)) = NaN; 
    fa(n,:) = aliasfreq; 
end 
figure(1); plot(f/fs, fa/fs); 
axis equal; axis([0,2, 0, 2]); 
xlabel('Frequency as a fraction of the sampling rate') 
ylabel('Aliasing frequency as a fraction of the sampling rate')

    
% conversion from analog frequency to digital frequency through sampling 

figure(2); plot(f/fs, min([f,fa],[],2)/fs, 'k')
axis equal; axis([0,2, 0, 2]); 
xlabel('Frequency of the analog signal') 
ylabel('Frequency of the digital signal')
