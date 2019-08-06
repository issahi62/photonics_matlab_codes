%*************************
% iterative fourier analysis developed by : Ibrahim Issah
%*************************

%%
tic
clc; 
close all; 
clear 
%%... 
%starting of codes 
% ***********************************
% storer of mutual coherence % complex degree of coherence

% number of iterations for convergence
N_runs = 1000;
% shows the number of samples to pick
R_samp = 200;

load('data.mat'); 
gname = '/Users/kobbyTilly/Desktop/IFTA_4thlab/Coherence_Sn_files';
fname = '/Users/kobbyTilly/Desktop/IFTA_4thlab/Sn_files';
% constant values
h = 6.62607004e-34/(2*pi);
T = 40; 
padding_value = 1000;
% total size of matrix 
TT = size(R95to96(:,1),1)+padding_value;
%storing variables of the forloop 
storerEnt =   zeros(TT, R_samp); 
storerISn =   zeros(TT, R_samp);   
Sn_storer = zeros(TT, R_samp); 
In_storer = zeros(TT, R_samp);
% energy values 
energies = (R95to96(:, 1).*(1.6e-19)); 
%angular frequency
omega = energies./h;
% omega n_o is the middle of the frequency 
wo = median(omega); 
dw = omega(2)- omega(1);
% frequencies
frqq = omega./(2*pi);

%     
%frqq= [frqq; zeros(1, padding_value)']; 
% change in frequency 
dfreq = (frqq-median(frqq)); 
 
% to sample among different fields
N_sampler =R_samp; 

%% 
% Animation with two figures

 kobby = figure(1);
for k = 1:N_sampler
    %sample each spectral field
    Sn = R95to96(:, k+1); 
    
    % zero padding
    Sn_padding = [Sn; zeros(1, padding_value)'];
    % size of the spectrum
    N = size(Sn_padding, 1);
    %%
    % time
    t = s_space(-200, 200, N)';
    % time difference 
    dt = t(2)-t(1);
    % frequency domain 
    f = s_space(0, 1/dt, N)'; 
    % frequence difference
    df = f(2)-f(1); 
    %%
   % frequency from data
   dfreeq = s_space(min(dfreq), max(dfreq), N)';
   dyfu = dfreeq(2)- dfreeq(1); 
   
   timeratian = s_space(0, 1/dyfu, N)'; 
   dytu = timeratian(2) - timeratian(1); 
   
    %using rand function for the phase
    phasorvalue = randn(N,1);
    ISn=sqrt(Sn_padding).*exp(1i.*(phasorvalue)); 
    Initial_ISn= ISn./2*pi;
%%     

    for i = 1:N_runs

        % first fft analysis
        Ent = FTrans(Initial_ISn, dyfu);
        % intensity in the time domain
        I_o = 1;
        I_t=I_o.*exp(-(timeratian-median(timeratian)).^2./((T*10^-15)^2));
        Amp=I_t; 
        % filtering
        Ent_prime=Amp.*exp(1i.*angle(Ent));
        % attaining the spectral field back
        ISn_prime = IFTrans(Ent_prime, dytu);
        New_Sn_padding = interp1(dfreq, Sn, dfreeq);
        Initial_ISn = sqrt(New_Sn_padding).*exp(1i.*angle(ISn_prime));

%       subplotting of results in animation form
        subplot(2,2,1)
        plot(timeratian-median(timeratian), abs(Ent), 'b.');
        title('Temporal domain (PV/m)'); 
        xt = get(gca, 'XTick');
        set(gca, 'XTick', xt, 'XTickLabel', xt*10^(15));
        yt = get(gca, 'YTick');
        set(gca, 'YTick', yt, 'YTickLabel', yt/10^15)
        xlabel('time (fs)'); 
        ylabel('$E_{n}(t$)', 'interpreter', 'latex'); 
%         colorbar; 
%         colormap(fireice);
        
        subplot(2,2,2)
        plot(timeratian-median(timeratian), unwrap(angle(Ent)), 'b.');
        title('Temporal phase'); 
        xt = get(gca, 'XTick');
        set(gca, 'XTick', xt, 'XTickLabel', xt*10^(15));
        xlabel('time(fs)')
         ylabel('\phi(t)')
%         colorbar
%         colormap(fireice);
        drawnow
        pause(0.05);

         %subplotting in an animation form 
        subplot(2,2,3)
        plot(dfreeq, abs(Initial_ISn), 'b');
        title('Spectral domain'); 
        xt = get(gca, 'XTick');
        set(gca, 'XTick', xt, 'XTickLabel', xt*10^(-15));
        xlabel('frequency (PHz)'); 
        ylabel('$E_{n}(\Omega$)', 'interpreter', 'latex'); 
%         colorbar; 
%         colormap(fireice); 

        subplot(2,2,4)
         plot(dfreeq, unwrap(angle(Initial_ISn)), 'm');
         title('Spectral phase');
         xt = get(gca, 'XTick');
         set(gca, 'XTick', xt, 'XTickLabel', xt*10^(-15));
         xlabel('frequency (PHz)')
         ylabel('\phi(\Omega)')
%          colorbar
%          colormap(fireice); 
         drawnow
         pause(0.05);
%%
    end
    % storing values of the temporal domain and the spectral domain
    saveas(kobby, fullfile(fname, sprintf('%d.png', k))); 
    saveas(kobby, fullfile(fname, sprintf('%d.fig', k)));
    
    storerEnt(:,k) = Ent;
    storerISn(:,k) = Initial_ISn;
    Sn_storer(:,k) = abs(Initial_ISn).^2; 
    In_storer(:,k) = abs(Ent).^2;
    
end