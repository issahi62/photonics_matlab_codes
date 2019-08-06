function y = IFTrans(x, dt)
[nr, nc] = size(x); 
if nr == 1
    N = nc; 
else 
    N = nr; 
end 
y = (1/(N*dt))*fft(x); 