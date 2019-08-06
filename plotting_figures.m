%*************************
% iterative fourier analysis meshc plotting developed by : Ibrahim Issah
%*************************
kobby3 = figure(3); 
branie = timeratian-median(timeratian)';
subplot(2,2,1) 
imagesc(branie,branie, abs(G)); 
view(0,90);
title('\Gamma(t_{1}, t_{2})'); 
ylabel('t_{1}'); 
xlabel('t_{2}');
colorbar 
%colormap(jet)

subplot(2,2,2)
imagesc(branie,branie,unwrap(angle(G)));
view(0,90);
title('Temporal phase');  
ylabel('\phi(t)')
colorbar
%colormap(fireice)

subplot(2,2,3)
imagesc(dfreeq, dfreeq, abs(W))
view(0,90)
title('W(\Omega_{1}, \Omega_{2})'); 
ylabel('\Omega_{1}'); 
xlabel('\Omega_{2}')
%colormap(jet)
colorbar

subplot(2,2,4)
imagesc(dfreeq, dfreeq, unwrap(angle(W)))
view(0,90)
title('Spectral phase');  
ylabel('\phi(\Omega)')
%colormap(fireice)
colorbar




% plotting for omega and t and deltat section
 kobby4 = figure(4); 
 
subplot(2,2,1) 
meshc(abs(imrotate(G, 45, 'nearest', 'loose'))); 
view(0,90);
title('\Gamma(t_{1}, t_{2})'); 
ylabel('t_{1}'); 
xlabel('t_{2}')
colorbar 
colormap(fireice)

subplot(2,2,2)
meshc(angle(imrotate(G, 45, 'nearest', 'loose')));
view(0,90);
title('Temporal phase');  
ylabel('\phi(t)')
colorbar
colormap(jet)

subplot(2,2,3)
meshc(abs(imrotate(W, 45, 'nearest', 'loose')))
view(0,90)
title('W(\Omega_{1}, \Omega_{2})'); 
ylabel('\Omega_{1}'); 
xlabel('\Omega_{2}')
colormap(jet)
colorbar

subplot(2,2,4)
meshc(angle(imrotate(W, 45, 'nearest', 'loose')))
view(0,90)
title('Spectral phase');  
ylabel('\phi(\Omega)')
colormap(fireice)
colorbar

% plotting for omega and t and deltat section
 kobby5 = figure(5); 
 
subplot(2,2,2) 
new_time = s_space(min(timeratian), max(timeratian), 3600);
branie1 = new_time-median(new_time);
imagesc(branie1, branie1, abs(imrotate(gam_11, 45, 'nearest', 'loose'))); 
view(0,90);


subplot(2,2,1)
meshc(branie,branie, abs(gam_11));
view(0,90);
title('\gamma(t_{1}, t_{2})'); 
ylabel('t_{1}'); 
xlabel('t_{2}')
colorbar
colormap('jet')

subplot(2,2,3)
%new1_dfreeq = s_space(min(dfreeq), max(dfreeq), 2045); 
% mu_11(isnan(mu_11)) = 0;
% mu_11(mu_11 ==0 ) = [];
% mu_11 = reshape(mu_11, 2045, []);
meshc(dfreeq,dfreeq, abs(mu_11))
view(0,90)
title('\mu(\Omega_{1}, \Omega_{2})'); 
ylabel('\Omega_{1}'); 
xlabel('\Omega_{2}')
colormap(jet)
colorbar

subplot(2,2,4)
%new_dfreeq = s_space(min(dfreeq), max(dfreeq), 2893);
image_ro =imrotate(mu_11, 45, 'nearest', 'loose'); 
meshc(new_dfreeq, new_dfreeq, abs(image_ro))
view(0,90)
title('\mu(\Omega, \Delta\Omega)'); 
ylabel('\Omega'); 
xlabel('\Delta\Omega')
colormap(jet)
colorbar

% 
saveas(kobby3, fullfile(gname, sprintf('coherence_1.png'))); 
%saveas(kobby3, fullfile(gname, sprintf('coherence_1.fig')));
saveas(kobby4, fullfile(gname, sprintf('coherence_2.png'))); 
%saveas(kobby4, fullfile(gname, sprintf('coherence_2.fig')));
saveas(kobby5, fullfile(gname, sprintf('norm_coherence_2.png'))); 
%saveas(kobby5, fullfile(gname, sprintf('norm_coherence_2.fig')));