function [ time,load,ext ] = importexcel( file )
%% Fonction d'importation de données d'un fichier excel
%   file doit être un .xls situé dans n'importe quel PATH
%
% SORTIES
%   time représente les données en abscisse et le temps du test
%   load représente les données en ordonnée et la force appliquée
%   ext représente lesdonnées en abscisse et l'élongation appliquée

[num] = xlsread(file);

num(isnan(num)) = 0;

time = num(:,1);
load = num(:,2);
ext  = num(:,3);

%plot(time,load)
end

