function[]=streetlights()

%Example: LED and sodium street lights.
%Spectral radiant flux of LED (W/m)
%First column wavelength
load stled.txt
%And sodium lamp
load stsod.txt

%Let's see how LED looks
plot(stled(:,1),stled(:,2))
xlabel('Wavelength (nm)');
ylabel('Spectral radiant flux (W/m)')
%pause
%And sodium...
plot(stsod(:,1),stsod(:,2))
xlabel('Wavelength (nm)');
ylabel('Spectral radiant flux (W/m)')
%pause

%The data is from 380 to 780 nm with interval of 5 nm.
%Let's load vlambda with same values
%Again first column wavelength
load vlam5nm.txt

%Luminous flux of LED
%Note! Now interval 5 nm and unit of spectral radiant flux W/m
LFL=683*sum(stled(:,2).*vlam5nm(:,2)*5*10^-9)
%Luminous flux of sodium
LFS=683*sum(stsod(:,2).*vlam5nm(:,2)*5*10^-9)
%pause
%Electric power in watts
%LED
PL=197;
%Sodium
PS=400;

%efficacy, led
effL=LFL/PL
%And sodium
effS=LFS/PS
%pause
%Let's load also scotopic vision curve v' lambda
load vprimelam5nm.txt

%Let's calculate scotopic lumens with v', first LED
SLFL=1700*sum(stled(:,2).*vprimelam5nm(:,2)*5*10^-9)
%And then sodium
SLFS=1700*sum(stsod(:,2).*vprimelam5nm(:,2)*5*10^-9)

%Scotopic efficacy, led
SeffL=SLFL/PL
%And sodium
SeffS=SLFS/PS