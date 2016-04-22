function [ time,load,ext ] = importexcel( file )
%% Fonction d'importation de donn�es d'un fichier excel
%   file doit �tre un .xls situ� dans n'importe quel PATH
%
% SORTIES
%   time repr�sente les donn�es en abscisse et le temps du test
%   load repr�sente les donn�es en ordonn�e et la force appliqu�e
%   ext repr�sente lesdonn�es en abscisse et l'�longation appliqu�e

[num] = xlsread(file);

num(isnan(num)) = 0;

time = num(:,1);
load = num(:,2);
ext  = num(:,3);

%plot(time,load)
end

