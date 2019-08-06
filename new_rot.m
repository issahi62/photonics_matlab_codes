% check which way Delta x and xbar should be

%**********************************
% codes for rotating the normalized csd of the realizations 
%**********************************
[X1,X2]=meshgrid(dfreeq,dfreeq);
Xbar0=(X1+X2)/2;
DeltaX0=X2-X1;
Delta_x=dfreeq;
xbar=dfreeq/2;
[Xbar,DeltaX]=meshgrid(Delta_x,xbar);
% MUrot=griddata(Xbar0,DeltaX0,MU,Xbar,DeltaX,'nearest');
MUrot=griddata(Xbar0,DeltaX0,mu_11,Xbar,DeltaX);
MUrot(isnan(MUrot))=0;
Sumplot = mean(MUrot, 2);
%**********************************
% codes for rotating the normalized mcf of the realizations 
%**********************************
branie = timeratian-median(timeratian)';
[Y1, Y2] = meshgrid(branie, branie);
Ybar0=(Y1+Y2)/2;
DeltaY0=Y2-Y1;
Delta_y=branie;
ybar=branie/2;
[Ybar,DeltaY]=meshgrid(Delta_y,ybar);
GArot=griddata(Ybar0,DeltaY0,gam_11,Ybar,DeltaY);
GArot(isnan(GArot))=0;
Sumplot_2 = mean(GArot, 2);

%****************************
%plotting figures of the last_step 
%***************************
kobby1 = figure(1); 
subplot(2,2,1)
imagesc(branie, branie, abs(gam_11))
title('\gamma(t_{1}, t_{2})'); 
ylabel('t_{1}'); 
xlabel('t_{2}')
colorbar
%colormap(viridis);
caxis([0, 1])

subplot(2,2,2)
imagesc(Delta_y,ybar,abs(GArot))
title('\gamma(t, \Deltat)'); 
xlabel('t'); 
ylabel('\Deltat')
colorbar 
%colormap(viridis);
caxis([0, 1])

subplot(2,2,3)
imagesc(dfreeq,dfreeq,abs(mu_11))
title('\mu(\Omega_{1}, \Omega_{2})'); 
ylabel('\Omega_{1}'); 
xlabel('\Omega_{2}')
%colormap(viridis);
colorbar
caxis([0, 1])

subplot(2,2,4)
imagesc(Delta_x,xbar,abs(MUrot))
title('\mu(\Omega, \Delta\Omega)'); 
xlabel('\Omega'); 
ylabel('\Delta\Omega')
%colormap(viridis);
colorbar
caxis([0, 1])


%spectral width and pulse width
kobby2 = figure(2);

subplot(2,2,1)
imagesc(Delta_y,ybar,abs(GArot))
title('\gamma(t, \Deltat)'); 
xlabel('t'); 
ylabel('\Deltat')
colorbar 
%colormap(plasma);
caxis([0, 1])

subplot(2,2,2)
%plot(Delta_y, abs(Sumplot_2))
plot(Delta_y(1491:1556), abs(Sumplot_2(1491:1556)))
title('Pulse Width')

subplot(2,2,3)
imagesc(Delta_x,xbar,abs(MUrot))
title('\mu(\Omega, \Delta\Omega)'); 
xlabel('\Omega'); 
ylabel('\Delta\Omega')
%colormap(plasma);
colorbar
caxis([0, 1])

subplot(2,2,4)
%plot(Delta_x, abs(Sumplot))
plot(Delta_x(1491:1556), abs(Sumplot(1491:1556)))
title('Spectral Width')

%******************
% saving the graphs
%******************
saveas(kobby1, fullfile(gname, sprintf('coherence_20.png')));
saveas(kobby2, fullfile(gname, sprintf('coherence_21.png')));

