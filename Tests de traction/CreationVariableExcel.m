%% Script d'enregistrement des variables de fichiers excels
clc
clearvars -except Line Papier Res Via LineTestElastic Cote
close all

disp('Création des variables via les fichiers Excel ...')
disp(' ')

%% Variables pour les corners

for i=1:10
    s = sprintf('Importation de Corner_%d',i);
    disp(s)
    eval(sprintf('[Traction.Corner(%d).time,Traction.Corner(%d).load, Traction.Corner(%d).ext] = importexcel(''Corner_%d'');',i,i,i,i));
    eval(sprintf('time = Traction.Corner(%d).time;',i));
    eval(sprintf('theload = Traction.Corner(%d).load;',i));
    
    %Graphe des droites carrés sur les 20 premières secondes
    %L'index des valeurs inférieur à 10s
    mintime = find(time<=20);
    %Calcul de la pente moyenne
    %Ici X\Y car matrice colonne
    Traction.Corner(i).Pente = time(mintime)\theload(mintime);
    %Données de la droite moyenne
    Traction.Corner(i).Px = time(mintime);
    Traction.Corner(i).Py = Traction.Corner(i).Px * Traction.Corner(i).Pente;
    
%     %Calcul du module de Young, point à 10 secondes
%     point = find(Traction.Corner(i).time <= 10);
%     point = point(end);
%     Traction.Corner(i).YoungM = Young(Traction.Corner(i).ext(point),Traction.Corner(i).load(point),i);
end
disp(' ')

%% Variables pour les lignes
% ATTENTION, l'index ici représente le n° de l'échantillon
% et NON le nombre de lignes présentes sur l'échantillon.
for i=1:10
    s = sprintf('Importation de Line_%d',i);
    disp(s)
    eval(sprintf('[Traction.Line(%d).time, Traction.Line(%d).load, Traction.Line(%d).ext] = importexcel(''line_%d'');',i,i,i,i));
    eval(sprintf('time = Traction.Line(%d).time;',i));
    eval(sprintf('theload = Traction.Line(%d).load;',i));
    
    %Graphe des droites carrés sur les 10 premières secondes
    %L'index des valeurs inférieur à 10s
    mintime = find(time<=10); 
    %Calcul de la pente moyenne
    Traction.Line(i).Pente = time(mintime)\theload(mintime);
    %Données de la droite moyenne
    Traction.Line(i).Px   = time(mintime); 
    Traction.Line(i).Py   = Traction.Line(i).Px * Traction.Line(i).Pente;
    
    %Calcul du module de Young, point à 10 seconde
    point = find(Traction.Line(i).time <= 10);
    point = point(end);
    Traction.Line(i).YoungM = Young(Traction.Line(i).ext(point),Traction.Line(i).load(point));
end

clear i s time theload mintime point
save('VarTraction');