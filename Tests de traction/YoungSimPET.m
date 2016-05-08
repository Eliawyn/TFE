%% Simulation du module de young
%Couche de cuivre sur une couche de polyester en traction
% cuivre :
% http://e-collection.library.ethz.ch/eserv/eth:27479/eth-27479-02.pdf
% PAGE 83
% PET :
% http://www.matweb.com/search/DataSheet.aspx?MatGUID=40559706b4fd4aa0a43f5739799728f5
% resin :
% http://www.engineeringtoolbox.com/young-modulus-d_417.html


%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 30;       %mm
W_PET   = 10;       %mm
H_PET   = 0.05;     %mm

%Cuivre
E_Cu    = 75*10^9;%Pa
L_Cu    = 30;       %mm
W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
%3.6 est pour le ground hachuré
H_Cu    = 0.035;     %mm

%resine
E_Epy   = 2*10^9;
L_Epy   = L_Cu;
W_Epy   = W_PET;
H_Epy   = 0.020;

%Calcul des volumes
V_PET   = L_PET*W_PET*H_PET; %mm^3
V_Cu    = L_Cu*W_Cu*H_Cu;    %mm^3
V_Epy   = L_Epy*W_Epy*H_Epy;

Part_PET= V_PET./(V_PET+V_Cu+V_Epy);% en pourcent
Part_Cu = V_Cu./(V_PET+V_Cu+V_Epy); % en pourcent
Part_Epy = V_Epy./(V_PET+V_Cu+V_Epy); % en pourcent

%Module de Young
E = E_PET*Part_PET + E_Cu*Part_Cu + E_Epy*Part_Epy;

%Graphe du résultat et comparaison
figure('name','Comparaison Module de Young Lignes verticales','NumberTitle','off')
for i = 1:10
    Traction.Line(i).YoungSim = E(i);
end

display = [Traction.Line.YoungM ; Traction.Line.YoungSim];
    
bar(display'/(10^9),'hist')
xlim([0 11]);
title('Comparaison Module de Young -- Polyester')
xlabel('N° échantillon');
ylabel('Module de Young (GPa)');
legend('Module de Young pratique', 'Module de Young théorique','Location','northwest')
grid on
