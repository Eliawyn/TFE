%% Calcul théorique de la flèche sur un film en flexion sur deux appuis
%
%            1     F*L^3
% f_max =  ---- * -------
%           48      E*I
%
% Avec I = (b*h^3)/12

%% Variables
%Transformation milligramme en Newton
mgToN = 0.00000981;

%Dimensions E=Module de Young, L=longueur, W=largeur, H=épaisseur
%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 0.04;     %m
W_PET   = 0.01;     %m
H_PET   = 0.00005;  %m

%Cuivre
E_Cu    = 110*10^9;   %Pa
L_Cu    = 0.04;       %m
W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
W_Cu    = W_Cu./1000; %m
%3.6 est pour le ground hachuré
H_Cu = 0.000035;

%resine adhésif
E_Epy   = 2*10^9;
L_Epy   = L_Cu;
W_Epy   = W_PET;
H_Epy   = 0.00002;

%% Calcul centre de gravité
%http://bendingmomentdiagram.com/fr/tutorials/beam-section-centroid/
A1 = W_PET*H_PET;
y1 = H_PET/2;
A2 = W_Epy*H_Epy;
y2 = H_PET + H_Epy/2;
A3 = W_Cu.*H_Cu;
y3 = H_PET + H_Epy + H_Cu/2;

H_Centre = (A1*y1 + A2*y2 + A3*y3)./(A1 + A2 + A3);

%% Calcul du moment d'inertie
%http://bendingmomentdiagram.com/fr/tutorials/calculating-beam-section-moment-of-inertia/
%Calcul de la partie PET
I1 = (W_PET.*power(H_PET,3))./12;
d1 = abs(H_PET/2 - H_Centre);
%Calcul de la partie Epy
I2 = (W_Epy.*power(H_Epy,3))./12;
d2 = abs(H_PET + H_Epy/2 - H_Centre);
%Calcul de la partie Cu
I3 = (W_Cu.*power(H_Cu,3))./12;
d3 = abs(H_PET + H_Epy + H_Cu/2 - H_Centre);

%Mise en commun des moments d'inerties
I  = (I1 + A1.*power(d1,2)) + (I2 + A2.*power(d2,2)) + (I3 + A3.*power(d3,2));  

%% Calcul théorique de la flèche
% Force appliquée
mg = 100;       %mg
F = mg*mgToN;   %N

for i = 1:10
    Line.Ver(i).Fleche = (1/48)*((F*power(L_PET,3))/(Traction.Line(i).YoungSim*I(i)));
end


%% Comparaison des pentes en µm/mg
figure('name','Comparaison de la flexibilité des échantillons','NumberTitle','off')

display = [Line.Ver.Pente ; Line.Ver.Fleche];
display(2,:) = display(2,:)*10^4;
%*10^4 car 0.0015 [m/100mg] = 15[mµ/mg]
bar(display','hist')

xlim([0 11]);
title('Comparaison de la flexibilité des échantillons')
xlabel('N° échantillon');
ylabel('Pente (µm/mg)');
legend('Pente des tests pratiques', 'Pente calculée théoriquement','Location','northeast')

clearvars -except Line Papier Res Via Traction Cote