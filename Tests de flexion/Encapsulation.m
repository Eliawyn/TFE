%% Simulation du module de young
%Couche de cuivre sur une couche de polyester en traction
% cuivre :
% http://e-collection.library.ethz.ch/eserv/eth:27479/eth-27479-02.pdf
% PAGE 83
% PET :
% http://www.matweb.com/search/DataSheet.aspx?MatGUID=40559706b4fd4aa0a43f5739799728f5
% resin :
% http://www.engineeringtoolbox.com/young-modulus-d_417.html
% Silicon :
% http://www.matbase.com/material-categories/natural-and-synthetic-polymers/elastomers/material-properties-of-silicone-rubber.html#properties

mgToN = 0.00000981;

%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 30;       %mm
W_PET   = 10;       %mm
H_PET   = 0.05;     %mm

%Cuivre
E_Cu    = 75*10^9;%Pa
L_Cu    = 30;       %mm
W_Cu    = 5;%mm
%3.6 est pour le ground hachuré
H_Cu    = 0.035;     %mm

%resine
E_Epy   = 2*10^9;
L_Epy   = L_Cu;
W_Epy   = W_PET;
H_Epy   = 0.020;

%Silicone
E_Sil   = 5*10^6;
L_Sil   = L_Cu;
W_Sil   = W_PET;
H_Sil   = 0.1:0.1:10;

%Calcul des volumes
V_PET   = L_PET*W_PET*H_PET; %mm^3
V_Cu    = L_Cu*W_Cu*H_Cu;    %mm^3
V_Epy   = L_Epy*W_Epy*H_Epy;
V_Sil   = L_Sil*W_Sil*H_Sil;

Part_PET= V_PET./(V_PET+V_Cu+V_Epy);% en pourcent
Part_Cu = V_Cu./(V_PET+V_Cu+V_Epy); % en pourcent
Part_Epy = V_Epy./(V_PET+V_Cu+V_Epy); % en pourcent
Part_Sil = V_Sil./(V_PET+V_Cu+V_Epy); % en pourcent

%Module de Young
E = E_PET*Part_PET + E_Cu*Part_Cu + E_Epy*Part_Epy + E_Sil*Part_Sil;
for i = 1:length(E)
    Line.Sil(i).YoungSim = E(i);
end

%% Changement de variable
%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 0.04;     %m
W_PET   = 0.01;     %m
H_PET   = 0.00005;  %m

%Cuivre
E_Cu    = 110*10^9;   %Pa
L_Cu    = 0.04;       %m
W_Cu    = 0.005; %mm
%3.6 est pour le ground hachuré
H_Cu = 0.000035;

%resine adhésif
E_Epy   = 2*10^9;
L_Epy   = L_Cu;
W_Epy   = W_PET;
H_Epy   = 0.00002;

%Silicone
E_Sil   = 5*10^6;
L_Sil   = L_Cu;
W_Sil   = W_PET;
H_Sil   = 0.1:0.1:10; %mm
H_Sil    = H_Sil./1000; %m

%% Calcul centre de gravité
%http://bendingmomentdiagram.com/fr/tutorials/beam-section-centroid/
ASil1 = W_Sil.*H_Sil/2;
ySil1 = H_Sil/4;
A1 = W_PET*H_PET;
y1 = H_Sil/2 + H_PET/2;
A2 = W_Epy*H_Epy;
y2 = H_Sil/2 + H_PET + H_Epy/2;
A3 = W_Cu*H_Cu;
y3 = H_Sil/2 + H_PET + H_Epy + H_Cu/2;
ASil2 = W_Sil.*H_Sil/2;
ySil2 = H_Sil/2 + H_PET + H_Epy + H_Cu + H_Sil/4;

H_Centre = (A1*y1 + A2*y2 + A3*y3 + ASil1.*ySil1 + ASil2.*ySil2)./(A1 + A2 + A3 + ASil1 + ASil2);

%% Calcul du moment d'inertie
%http://bendingmomentdiagram.com/fr/tutorials/calculating-beam-section-moment-of-inertia/
%Calcul silicone en bas
ISil1 = (W_Sil.*power(H_Sil/2,3))./12;
dSil1 = abs(H_Sil/4 - H_Centre);
%Calcul de la partie PET
I1 = (W_PET.*power(H_PET,3))./12;
d1 = abs(H_Sil/2 + H_PET/2 - H_Centre);
%Calcul de la partie Epy
I2 = (W_Epy.*power(H_Epy,3))./12;
d2 = abs(H_Sil/2 + H_PET + H_Epy/2 - H_Centre);
%Calcul de la partie Cu
I3 = (W_Cu.*power(H_Cu,3))./12;
d3 = abs(H_Sil/2 + H_PET + H_Epy + H_Cu/2 - H_Centre);
%Calcul silicone en haut
ISil2 = (W_Sil.*power(H_Sil/2,3))./12;
dSil2 = abs(H_Sil/2 + H_PET + H_Epy + H_Cu + H_Sil/4 - H_Centre);

%Mise en commun des moments d'inerties
I  = (ISil1 + ASil1.*power(dSil1,2)) + (I1 + A1.*power(d1,2)) + (I2 + A2.*power(d2,2)) + (I3 + A3.*power(d3,2))+ (ISil2 + ASil2.*power(dSil2,2));  

%% Calcul théorique de la flèche
% Force appliquée
mg = 100;       %mg
F = mg*mgToN;   %N

for i = 1:length(E)
    Line.Sil(i).Fleche = (1/48)*((F*power(L_PET,3))/(Line.Sil(i).YoungSim*I(i)));
end

figure('name','Comparaison de la flexibilité des échantillons','NumberTitle','off')

display = [Line.Sil.Fleche];
display = display*10^4;
%*10^4 car 0.0015 [m/100mg] = 15[mµ/mg]

plot(H_Sil*1000,display', 'LineWidth', 1.5)
%set(gca, 'XTick',0.1:0.1:10)

xlim([0 1]);
title('Flexibilité  avec Encapsulation en silicone -- Polyester')
xlabel('Epaisseur Silicone (mm)');
ylabel('Pente (µm/mg)');
grid on

clearvars -except Line Papier Res Via Traction Cote