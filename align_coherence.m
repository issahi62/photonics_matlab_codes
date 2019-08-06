v = [-1 -12];
theta = 45;

R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
vR = W*R;
quiver(0,0,v(1),v(2))
hold on
quiver(0,0,vR(1),vR(2))

for omega = 1:size(dfreeq,1)
    for omega2 = 1:size(dfreeq, 1) 
        x = 0.5*(omega+omega2); 
        y = omega2-omega1;
        
        BB(omega, omega2) = W(x,y); 
    end 
end 

for outputCol = 1 : 2050
    for outputRow = 1 : 2050
        inputRow = (outputCol+outputRow)/2; 
        inputCol =  outputRow-outputCol; 
        % Exercise left for the poster: Make sure input row and column are inside the image.
        % To be simple, just round the row and column.  To be more accurate do bilinear interpolation.
        outputImage(outputRow, outputCol) = W(inputRow, inputCol);
    end
end

for theta=pi/4; 
    rp = [ cos(theta) -sin(theta); sin(theta) cos(theta)];
    r = rp*W
    

temp2 = 0; 
for i =1: 2050
    for j = 1: 2050
        temp2 = temp2 + (conj(0.5*(Breda(omega1)+Breda(omega2))) * (Breda(omega2)-Breda(omega1)));
         Yaw2u(i, j) = temp2; 
         temp2 = 0;
    end 
     
   
end 
x = 0:size(Yaw2u,2)-1;
y = 0:size(Yaw2u,1)-1;
[X,Y] = meshgrid(x,y);
meshc(X,Y, abs(Yaw2u))
view(0,90);

n_rows = size(W, 1); 
n_columns = size(W, 2); 
KK=0; KB=0; 
for a = 1:1:n_rows
    for b = 2:1:n_columns
      KK = KK + (0.5*(G(a, b-1)+ G(a,b))); 
      KB = KB + G(a,b) - G(a, b-1); 
      
      kwabena(a,b) = conj(KK) * KB;
    
      
     KK =0; 
    KB = 0; 
    end
    
end



 [m,n]=size(W);
        for i=1:m
         for j=n:-1:1
           BBB(j,i) = W(i,j);
         end
        end
        
        
        
   phi = @(x)(x>0).*exp(-1./x.^2);
R = @(xx,zz)phi(xx).*phi(1-xx).*phi(zz).*phi(1-zz);
    % generate the grid
[omega,theta]= meshgrid(linspace(0,5,200),linspace(0,2*pi,200));
D= zeros(size(omega)); % preallocate the memory
for ii= 1:size(omega,1)
    for jj= 1:size(omega,2)
        f= @(xx,zz)R(xx,zz).*exp(20.*omega(ii,jj).*1i.*...
            ((sin(theta(ii,jj))).*xx+(cos(theta(ii,jj))).*zz));
        D(ii,jj)= exp((10*1i*omega(ii,jj))./(40*pi)).*integral2(f,0,5,0,5);
    end
end
    % convert to Cartesian coordinates
[x,y] = pol2cart(theta,omega);
    % draw the results
figure;
surface(x,y,abs(D))
shading interp; axis square; view(3)
figure;
surface(x,y,real(D))
shading interp; axis square; view(3)
figure;
surface(x,y,imag(D))
shading interp; axis square; view(3)


[omega,theta]= meshgrid(dfreeq, dfreeq);
D= zeros(size(omega)); % preallocate the memory
for ii= 1:size(omega,1)
    for jj= 1:size(omega,2)
        rot = [
        D(ii,jj)=
    end
end
    % convert to Cartesian coordinates
[x,y] = pol2cart(theta,omega);
    % draw the results
figure;
surface(x,y,abs(D))
shading interp; axis square; view(3)
figure;
surface(x,y,real(D))
shading interp; axis square; view(3)
figure;
surface(x,y,imag(D))
shading interp; axis square; view(3)


for omega1 = 1:size(Ent,1)
    for omega2= 1:size(Ent,1)
        if omega == 0.5*(omega1+omega2)
            B(omega1,:) = W(omega1, omega2); 
        elseif ch_omega == omega2 - omega1
            
            
            
            [m,n] = size(W);    
for i =1:m
        d1 = norm(W(i,:));
        for j =1:m
            d2 =  norm(W(j,:));
            if i ==j
                continue;
            else
                z = max((sqrt((W(i,:)*W(j,:)')^2 ))/(d1*d2));
            end
        end
end


 C_Om = min(dfreeq): dyfu/2: max(dfreeq); 
 ch_Om = min(dfreeq): dyfu: max(dfreeq);
 
ShifterX=0;
ShifterY=+0;
 [staff, ahmed] = size(W); 
Kplus = zeros(staff, ahmed); 
for n = 1:2050
    Kplus(:, n) = [W(end+1-n:end, n); W(1:end-n,n)];
end
finalimage =  [Kplus(:, 1001:end), Kplus(:, 1:1000)];


KB=0;
KC=0;
for a = 1:2050
for b = 2:2050
KB = KB + 0.5*(W(a, b-1)+ W(a, b))*(W(a,b)-W(a,b-1)); 
BB_12(a, b) = conj(KB);

end 
KB=0;
end 

kobby=0; 
kobby2=0; 
for i = 1:2050
for j = 2:2050
    kobby = kobby + 0.5*(G(i)+G(j));
    kobby2 = kobby2 + (G(j)-G(i)); 
    
     bradas_kobby(i,j) = conj(kobby)*kobby2;
     
    
end 
 
 kobby = 0; 
 kobby2 = 0;   
end 



[th, W] = cart2pol(W(, y);
[nx, ny] = pol2cart(th+pi/4, W)