%% Simulation du module de young
%Couche de cuivre sur une couche de polyimide en traction
%http://www.dupont.com/content/dam/dupont/products-and-services/membranes-and-films/polyimde-films/documents/DEC-Kapton-summary-of-properties.pdf
%Polyester
E_PI   = 2.5*10^9;   %Pa
L_PI   = 30;       %mm
W_PI   = 10;       %mm
H_PI   = 0.025;     %mm

%Cuivre
E_Cu    = 75*10^9;%Pa
L_Cu    = 30;       %mm
W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
%3.6 est pour le ground hachuré
H_Cu    = 0.035;     %mm

%resine
E_Epy   = 2*10^9;
L_Epy   = L_Cu;
W_Epy   = W_PI;
H_Epy   = 0.020;

%Calcul des volumes
V_PI   = L_PI*W_PI*H_PI; %mm^3
V_Cu    = L_Cu*W_Cu*H_Cu;    %mm^3
V_Epy   = L_Epy*W_Epy*H_Epy;

Part_PI= V_PI./(V_PI+V_Cu+V_Epy);% en pourcent
Part_Cu = V_Cu./(V_PI+V_Cu+V_Epy); % en pourcent
Part_Epy = V_Epy./(V_PI+V_Cu+V_Epy); % en pourcent

%Module de Young
E = E_PI*Part_PI + E_Cu*Part_Cu + E_Epy*Part_Epy;

%Graphe du résultat et comparaison
figure('name','Comparaison Module de Young Lignes verticales','NumberTitle','off')
for i = 1:10
    Traction.PI(i).YoungSim = E(i);
end

display = [Traction.Line.YoungSim ; Traction.PI.YoungSim];
    
bar(display'/(10^9),'hist');
xlim([0 11]);
title('Comparaison Module de Young -- Polyester et Polyimide')
xlabel('N° échantillon');
ylabel('Module de Young (GPa)');
legend('Polyester', 'Polyimide','Location','northwest')
grid on
