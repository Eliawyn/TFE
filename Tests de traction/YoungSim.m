%% Simulation du module de young

%Couche de cuivre sur une couche de polyester en traction

%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 30;       %mm
W_PET   = 10;       %mm
H_PET   = 0.05;     %mm

%Cuivre
E_Cu    = 110*10^9;%Pa
L_Cu    = 30;       %mm
W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
%3.6 est pour le ground hachuré
H_Cu    = 0.035;     %mm

%Calcul des volumes
V_PET   = L_PET*W_PET*H_PET; %mm^3
V_Cu    = L_Cu*W_Cu*H_Cu;    %mm^3

Part_PET= V_PET./(V_PET+V_Cu);% en pourcent
Part_Cu = 1-Part_PET;         % en pourcent

%Module de Young
E = E_PET*Part_PET + E_Cu*Part_Cu;

%Graphe du résultat et comparaison
figure('name','Comparaison Module de Young Lignes verticales','NumberTitle','off')
for i = 1:10
    Traction.Line(i).YoungSim = E(i);
end

display = [Traction.Line.YoungM ; Traction.Line.YoungSim];
    
bar(display'/(10^9),'hist')
xlim([0 11]);
title('Comparaison Module de Young')
xlabel('N° échantillon');
ylabel('Module de Young (GPa)');
legend('Module de Young pratique', 'Module de Young théorique','Location','northwest')
