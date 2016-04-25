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
H_Cu    = ones(1,10)*0.000035;   %m
H_Cu(1) = 0;

%dimensions
W = W_Cu + W_PET;
H = H_Cu + H_PET;
% Inertie
I = (W.*power(H,3))./12;

% Force appliquée
mg = 100;       %mg
F = mg*mgToN;   %N

%% Calcul 
% Traction.Line(i).YoungM
for i = 1:10
    Line.Ver(i).Fleche = (1/48)*((F*power(L_PET,3))/(Traction.Line(i).YoungM*I(i)));
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