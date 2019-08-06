% 
% temp123 = zeros(2050, 2050); 
% 
% for jb = 1: 4 
%     temp123 = temp123 + kron(conj(storerEnt(:,jb)), storerEnt(:, jb)');
% end 
% actual_answer = temp123/4; 
% 
% % relevant codes using kronecker function for the simulation
% for omega11 = 1:2050
%     for omega22 = 1:2050
%           = conj(Y(omega11, 0.5*(omega11+omega2)))
%    
%     end 
% % storerEnt =   zeros(TT, R_samp); 
% storerISn =   zeros(TT, R_samp);  
% S_Ent     =  zeros(TT, R_samp); 
% sSn_ensem =  zeros(TT, R_samp); 
% Sn_storer = zeros(TT, R_samp); 
% In_storer = zeros(TT, R_samp); 
% Sn_ensem  = zeros(TT, R_samp);
% In_ensem  = zeros(TT, R_samp);
% yy_omega1 = zeros(TT, R_samp);
% xx_omega2 = zeros(R_samp, TT);
% Sn_omega1 = zeros(TT, R_samp); 
% Sn_omega2 = zeros(R_samp, TT); 
% yy1_time1 = zeros(TT, R_samp);
% xx1_time2 = zeros(R_samp, TT);
% In_time1  = zeros(TT, R_samp); 
% In_time2  = zeros(R_samp, TT); 
%     %cross spectral density section
%     for bb = 1:size(Ent,1)
%             
%      %*****************************
%          % Cross-spectral section with omega 1 and omega 2  
%      sSn_ensem(:, bb) = kron(storerISn(:, k), conj(storerISn(bb , k))); 
%      Sn_ensem(:, bb) = kron(Sn_storer(:, k), Sn_storer(bb , k));
%      
%       %***********************************
%      % Mutual domain with omega 1 and omega 2
%      S_Ent(:, bb) = kron(storerEnt(:, k), conj(storerEnt(bb , k))); 
%      In_ensem(:, bb) = kron(In_storer(:, k), In_storer(bb , k)); 
%      
%     end
%     % spectral ensembles 
%     % Cross spectral ensembles of the fields 
%     yy_omega1(:, k) = sum(sSn_ensem, 2);
%     xx_omega2(k, :) = sum(sSn_ensem, 1);
%     %spectral power
%     Sn_omega1(:, k) = sum(Sn_ensem, 2); 
%     Sn_omega2(k, :) = sum(Sn_ensem, 1); 
%     
%     % temporal ensembles 
%     % temporal domain 
%     yy1_time1(:, k) = sum(S_Ent, 2);
%     xx1_time2(k, :) = sum(S_Ent, 1);
%     % time 1 and time 2 
%     In_time1(:, k) = sum(In_ensem, 2); 
%     In_time2(k, :) = sum(In_ensem, 1); 
% end
% 
% %% Frequency domain Analysis 
% 
% % difference of the fields in frequency domain
% % difference and average of omega 1 and 2
% mm_CSD = 0.5.*(xx_omega2'+yy_omega1);
% uu_CSD = xx_omega2' - yy_omega1;
% Snn = sqrt(Sn_omega1.*Sn_omega2');
% deg_coh_ave = 1/N_runs.*(mm_CSD./Snn); 
% deg_coh_delta = 1/N_runs.*(uu_CSD./Snn);
% 
% %% Time Domain Analysis 
% 
% mm_MCF= 0.5.*(xx1_time2'+yy1_time1);
% uu_MCF = xx1_time2' - yy1_time1;
% Inn = sqrt(In_time1.*In_time2');
% Mc_coh_ave = 1/N_runs.*(mm_MCF./Inn); 
% Mc_coh_delta = 1/N_runs.*(uu_MCF./Inn);
% 
%      % plotting for omega1 and omega2 // time1 and time2 
%      bredas = figure(2); 
%      subplot(2,2, 1)
%      plot(1/N_runs.*abs(sum(yy_omega1, 1)), 1/N_runs.*abs(sum(xx_omega2,2)))
%      title('W(\Omega_{1}, \Omega_{2})'); 
%      ylabel('\Omega_{1}'); 
%      xlabel('\Omega_{2}')
%      colormap;
%      colorbar;
%      
%      subplot( 2, 2, 2) 
%      plot(1/N_runs.*abs(sum(yy1_time1, 1)), 1/N_runs.*abs(sum(xx1_time2,2))) 
%      title('\Gamma(t_{1}, t_{2})'); 
%      ylabel('t_{1}'); 
%      xlabel('t_{2}', 'Rotation', 0)
%      colormap;
%      colorbar;
% 
%       %*********************************
%       %plotting of the delta omega and delta t
%       %*********************************
%       
%      subplot(2,2, 3)
%      plot(abs(sum(deg_coh_ave, 2)), abs(sum(deg_coh_delta, 2)))
%      title('\mu(\Omega, \Delta\Omega)'); 
%      xlabel('\Delta\Omega'); 
%      ylabel('\Omega')
%      colormap;
%      colorbar;
%      
%      subplot( 2, 2, 4) 
%      plot(abs(sum(Mc_coh_ave, 2)), abs(sum(Mc_coh_delta, 2))) 
%      title('\gamma(t, \Deltat)'); 
%      xlabel('\Deltat'); 
%      ylabel('t')
%      colormap;
%      colorbar;
%      
%     saveas(bredas, fullfile(gname, sprintf('Sn_t_files.png'))); 
%     saveas(bredas, fullfile(gname, sprintf('Sn_t_files.fig')));
% tic