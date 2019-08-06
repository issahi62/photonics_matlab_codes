%*************************
% iterative fourier analysis spectral and pulse width developed by : Ibrahim Issah
%*************************

matrSize=size(mu_11);
DeltaX=1:matrSize(2);
DeltaX = DeltaX-matrSize(2)/2;
X=1:matrSize(1);
X = X-matrSize(1)/2;
shiftValue=(1.011536);
muMatrShift=mu_11;
gamMatrShift=gam_11;

for ind=1:matrSize(1)
move=round(X(ind)/shiftValue);
muMatrShift(ind,:)=circshift(muMatrShift(ind,:),[1 -move]);
gamMatrShift(ind,:)=circshift(gamMatrShift(ind,:),[1 -move]);
end

figure(9);
branie = timeratian-median(timeratian)';
subplot(2,2, 3)
imagesc(dfreeq, dfreeq,imrotate(abs(muMatrShift), 90));
%caxis([0,1]); 
colorbar
title('\mu(\Omega, \Delta\Omega)'); 
ylabel('\Omega'); 
xlabel('\Delta\Omega')

subplot(2, 2, 1)
imagesc(branie, branie, imrotate(abs(gamMatrShift),90));
title('\gamma(t, \Deltat)'); 
ylabel('t'); 
xlabel('\Deltat')
colorbar

subplot(2, 2, 2)
plot(dfreeq(1225:1325), mean(abs(muMatrShift(:, 1225:1325))), 'LineWidth', 2);
title('\mu(\Omega, \Delta\Omega)'); 
ylabel('\Omega'); 
xlabel('\Delta\Omega')

subplot(2,2,4)
plot(branie(1225:1325),mean(abs(gamMatrShift(:, 1225:1325))), 'LineWidth', 2);
title('\gamma(t, \Deltat)'); 
ylabel('t'); 
xlabel('\Deltat')