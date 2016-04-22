function [ E ] = Young( extension, Elastic_load)
%% Calcul du modèle de Young
%http://solar.energy.cours.free.fr/doc%20cours%20ing/science%20des%20materiaux/RAPPORT-TRACTION.pdf

%Donner des valeurs dans la zone élastique
%   -extension en mm
%   -load en N
%   -num n° de l'échantillon
%
%Résultat : donne le module de Young

L           = 0.03;
% W_PET       = 0.01;
%H_PET       = 0.05*10^(-3);
% W_Cu        = [0 1 2 3 4 5 6 7 9 3.6];
% W_Cu        = W_Cu*10^(-3);
% H_Cu        = 0.035*10^(-3);
% Surface     = W_PET*H_PET + W_Cu(num)*H_Cu;
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

end