function [] = pmethod(A,lamda)
%A is the matrix
i=0.0000;
previous=0;
eigenconcat=[];
mconcat=[];
iteration=[];
relacot=[];
while i<=10
    
y=A*lamda;
error=y(1:1);
present=error;
m=((1/error)*y);
k=m;
lamda=k;


%mvector should now be the lamda that will multiply the matrix.
relative=abs((error-previous)/error)*100;
eigenconcat=[eigenconcat,present];
mconcat=[mconcat,k];
relacot=[relacot,relative];
previous=error;
if relative<0.5
    break;
end

i=i+1;
iteration=[iteration,       i];
end
sig=floor(2-log10(2*relative));
fprintf('    iterations\n');
disp(iteration);
fprintf('    eigenvalues\n');
disp(eigenconcat);
fprintf('    assumed eigenvalue\n');
disp(mconcat);
fprintf('    relative approximate error\n');
disp(relacot);
fprintf('    the number of significant figures to trust\n');
disp(sig);

end

