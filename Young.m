function [ E ] = Young( extension, Elastic_load, ech)
%% Calcul du modèle de Young
%http://solar.energy.cours.free.fr/doc%20cours%20ing/science%20des%20materiaux/RAPPORT-TRACTION.pdf

%Donner des valeurs dans la zone élastique
%   -extension en mm
%   -load en N
%   -num n° de l'échantillon
%
%Résultat : donne le module de Young

% %% Calcul des surfaces
% %Polyester
% W_PET   = 0.01;     %m
% H_PET   = 0.00005;  %m
% 
% %Cuivre
% W_Cu    = [0 1 2 3 4 5 6 7 9 3.6];%mm
% W_Cu    = W_Cu./1000; %m
% %3.6 est pour le ground hachuré
% H_Cu    = 0.000035;
% 
% %resine adhésif
% W_Epy   = W_PET;
% H_Epy   = 0.00002;
% 
% L       = 0.05;
% 
% A1 = W_PET*H_PET;
% A2 = W_Epy*H_Epy;
% A3 = W_Cu.*H_Cu;
% 
% Surface = (A1+A2+A3);
%On ne prend pas ceux là, mais les données introduite pour les tests.

width = 0.01;
height= 0.05*10^(-3);
Surface = width*height;

XElastic    = extension*10^(-3);    %(m)
LElastic    = XElastic/L;           %(%)
YElastic    = Elastic_load;         %(N)

%      F        1
% E = --- * ----------
%      S     LElastic

E = YElastic/(Surface*LElastic);
% E = YElastic/(Surface(ech)*LElastic);

end