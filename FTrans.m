function y = FTrans(x, dt)
[nr, nc] = size(x); 
if nr == 1
    N = nc; 
else 
    N = nr; 
end 
y = N*dt*ifft(x); 