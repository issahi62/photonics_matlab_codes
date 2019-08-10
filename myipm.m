function [v e] = myipm (A , n)
% Performs the inverse power method .
% Inputs : A -- a square matrix .
% n -- the number of iterations to perform .
% Outputs : v -- the estimated eigenvector .
% e -- the estimated eigenvalue .
[ L U P] = lu(A ); % LU decomposition of A with pivoting
m = size (A ,1); % determine the size of A
v = ones (m ,1); % make an initial vector with ones
for i = 1: n
pv = P*v ; % Apply pivot
y = L \ pv ; % solve via LU
v = U \y;
% figure out the maximum entry in absolute value , retaining its sign
M = max ( v );
m = min ( v );
if abs (M ) >= abs (m )
el = M;
else
el = m;
end
v = v / el ; % divide by the estimated eigenvalue of the inverse of A
end
e = 1/ el ; %