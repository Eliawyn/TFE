%Polyester
E_PET   = 4*10^9;   %Pa
L_PET   = 30;       %mm
W_PET   = 10;       %mm
H_PET   = 0.05;     %mm
Surf_PET = W_PET*H_PET*10^(-6);%m^2

%Cuivre
E_Cu    = 110*10^9;%Pa
L_Cu    = 30;       %mm
W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
%3.6 est pour le ground hachuré
H_Cu    = 0.035;     %mm
Surf_Cu = W_Cu*H_Cu*10^(-6);%m^2

%Calcul des volumes
V_PET   = L_PET*W_PET*H_PET; %mm^3
V_Cu    = L_Cu*W_Cu*H_Cu;    %mm^3

Part_PET= V_PET./(V_PET+V_Cu);% en pourcent
Part_Cu = 1-Part_PET;        % en pourcent

for i = 1:10
    %Point à 10 seconde
    point = find(Traction.Line(i).time <= 10);
    point = point(end);
    X = (Traction.Line(i).ext(point)*10^(-3))/(L_PET*10^(-3));
    Y = Traction.Line(i).load(point);
    
    %Module de Young pour le PET
    %      F        1
    % E = --- * ----------
    %      S     LElastic
    Em_PET = Y/(Surf_PET*X);
    
    if i==1
        Em_Cu = 0;
    else
        %Module de Young pour le cuivre
        Em_Cu  = Y/(Surf_Cu(i)*X);
    end
    
    %Rassemblement
    Traction.Line(i).YoungM = Em_PET*Part_PET(i) + Em_Cu*Part_Cu(i);
end
