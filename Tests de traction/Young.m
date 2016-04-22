function [ E ] = Young( extension, Elastic_load )
%% Calcul du modèle de Young
%http://solar.energy.cours.free.fr/doc%20cours%20ing/science%20des%20materiaux/RAPPORT-TRACTION.pdf

%Donner des valeurs dans la zone élastique
%   -extension en mm
%   -load en N
%
%Résultat : donne le module de Young

L           = 0.03;
Width       = 0.01;
Thickness   = 0.05*10^(-3);
Surface     = Width*Thickness;

Fe          = 50;
LFe         = 1.35;
Re          = Fe/Surface; 

XElastic    = extension*10^(-3);   %(mm)
LElastic    = XElastic/L;       %(%)
YElastic    = Elastic_load;          %(N)

%      F        1
% E = --- * ----------
%      S     LElastic

E = YElastic/(Surface*LElastic);

end