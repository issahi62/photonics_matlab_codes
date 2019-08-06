%*************************
% IFTA coherence measurement developed by : Ibrahim Issah
%*************************

%%
% coherence function codes
G = zeros(size(Ent, 1), size(Ent, 1));
W = zeros(size(Ent, 1), size(Ent, 1));
SS = zeros(size(Ent, 1), size(Ent, 1));
II = zeros(size(Ent, 1), size(Ent, 1));

% storing with temporal zeroth value
temp1=  0;
temp2 = 0; 
temp3 = 0; 
temp4 = 0; 

for omega1 = 1: size(Ent, 1) 
    for omega2 = 1: size(Ent, 1)
        for n = 1: R_samp
            %temporal section 
         temp1 = temp1 + (conj(storerEnt(omega1, n)) * storerEnt(omega2, n));
              %spectral section 
         temp2 = temp2 + (conj(storerISn(omega1, n)) * storerISn(omega2, n));
              %spectrum
         temp3 = temp3 + (Sn_storer(omega1, n)) * Sn_storer(omega2, n);
         % intensity 
         temp4 = temp4 + (conj(In_storer(omega1, n)) * In_storer(omega2, n));
            %manipulation of mean spectrum 
        end
        %MCF of omega1 and omega2 
        G(omega1,omega2) = temp1/R_samp; 
         % CSD of omega1 and omega2 
         W(omega1, omega2) = temp2/R_samp;  
         %Spectrum of realizations 
          SS(omega1, omega2) = temp3/R_samp;  
         
        %temporal intensity 
         II(omega1,omega2) = temp4/R_samp; 
         
        temp1 = 0; 
        temp2 = 0; 
        temp3 = 0; 
        temp4 = 0;  
    end 
end 

[X,Y] = meshgrid(dfreeq,dfreeq); 

 mu_11 = W./sqrt(SS); 
% 
 gam_11 = G./sqrt(II); 



