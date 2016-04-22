%% Variables
clc
clearvars -except Line Papier Res Via Traction

%% Chargement des variables
load('VarBrut.mat')
disp('Chargement des variables ...')

%% Changement de variables
for i=1:10
    %Lignes verticales
    Line.Ver(i).X           = eval(sprintf('X%d', i-1));
    Line.Ver(i).Y           = eval(sprintf('Y%d', i-1));
    Line.Ver(i).Taille      = length(Line.Ver(i).X);
    Line.Ver(i).Commentaire = sprintf('%d lignes verticales', i-1);
    
    %Lignes horizontales
    Line.Hor(i).X           = eval(sprintf('Xh%d', i*2));
    Line.Hor(i).Y           = eval(sprintf('Yh%d', i*2));
    Line.Hor(i).Taille      = length(Line.Hor(i).X);
    Line.Hor(i).Commentaire = sprintf('%d lignes horizontales', i*2);
    
    %Résistances horizontales
    Res.Hor(i).X            = eval(sprintf('Xrh%d', i));
    Res.Hor(i).Y            = eval(sprintf('Yrh%d', i));
    Res.Hor(i).Taille       = length(Res.Hor(i).X);
    Res.Hor(i).Commentaire  = sprintf('%d Résistances horizontales', i);
        %Décalage des valeurs à zéro
        Shift               = Res.Hor(i).Y(1);
        Res.Hor(i).Y        = Res.Hor(i).Y - Shift;
    
    %Résistances verticales
    Res.Ver(i).X            = eval(sprintf('Xrv%d', i));
    Res.Ver(i).Y            = eval(sprintf('Yrv%d', i));
    Res.Ver(i).Taille       = length(Res.Ver(i).X);
    Res.Ver(i).Commentaire  = sprintf('%d Résistances verticales', i);
        %Décalage des valeurs à zéro
        Shift               = Res.Ver(i).Y(1);
        Res.Ver(i).Y        = Res.Ver(i).Y - Shift;
    
    %Vias
    if i<10
        Via(i).X            = eval(sprintf('Xvia%d', i));
        Via(i).Y            = eval(sprintf('Yvia%d', i));
        Via(i).Taille       = length(Via(i).X);
        Via(i).Commentaire  = sprintf('%d Vias', i);
            %Décalage des valeurs à zéro
            Shift           = Via(i).Y(1);
            Via(i).Y        = Via(i).Y - Shift;
    end
    
    %Papier
    Papier.X                = XPapier;
    Papier.Y                = YPapier;
    Papier.Taille           = length(Papier.X);
    Papier.Commentaire      = 'Flexibilité papier';
end
disp('Variables modifiées')

%% Tests de variables
for i=1:10
    if(length(Line.Ver(i).X) ~= length(Line.Ver(i).Y))
        disp('Problème de taille dans Line.Ver')
    elseif(length(Line.Hor(i).X) ~= length(Line.Hor(i).Y))
        disp('Problème de taille dans Line.Hor')
    elseif(length(Res.Hor(i).X) ~= length(Res.Hor(i).Y))
        disp('Problème de taille dans Res.Hor')
    elseif(length(Res.Ver(i).X) ~= length(Res.Ver(i).Y))
        disp('Problème de taille dans Res.Ver')
    elseif(i<10 && length(Via(i).X) ~= length(Via(i).Y))
        disp('Problème de taille dans Via')
    elseif(length(Papier.X) ~= length(Papier.Y))
        disp('Problème de taille dans Papier')
    end
end
disp('Variables OK')

%% Elasticité
% %line ver
% Line.Ver(1).ElasticLow  = [9 66 66 60 80];
% Line.Ver(1).ElasticHigh = [894 989 986 961 932];
% LineTestElastic         = [9 894 66 989 66 986 60 961 80 932];
% Line.Ver(2).ElasticLow  = [85 5 14 8];
% Line.Ver(2).ElasticHigh = [1783 1750 1836 1820];
% Line.Ver(3).ElasticLow  = [1 76 84];
% Line.Ver(3).ElasticHigh = [1024 1032 1071];
% Line.Ver(4).ElasticLow  = [3 70 33];
% Line.Ver(4).ElasticHigh = [923 908 854];
% Line.Ver(5).ElasticLow  = [7 63 76];
% Line.Ver(5).ElasticHigh = [1469 1507 1483];
% Line.Ver(6).ElasticLow  = [4 91 123];
% Line.Ver(6).ElasticHigh = [1450 1490 1535];
% Line.Ver(7).ElasticLow  = [2 64 97];
% Line.Ver(7).ElasticHigh = [1255 1286 1293];
% Line.Ver(8).ElasticLow  = [3 69 63];
% Line.Ver(8).ElasticHigh = [1125 1121 1130];
% Line.Ver(9).ElasticLow  = [-4 46 55];
% Line.Ver(9).ElasticHigh = [849 858 861];
% Line.Ver(10).ElasticLow = [416 445 438];
% Line.Ver(10).ElasticHigh= [1499 1560 1578];
% 
% %line hor
% Line.Hor(1).ElasticLow  = [57 48];
% Line.Hor(1).ElasticHigh = [1863 1913];
% Line.Hor(3).ElasticLow  = [-5 -30];
% Line.Hor(3).ElasticHigh = [1901 1880];
% Line.Hor(5).ElasticLow  = [-7 36];
% Line.Hor(5).ElasticHigh = [1700 1900];
% Line.Hor(7).ElasticLow  = [-2 64];
% Line.Hor(7).ElasticHigh = [1782 1716];
% Line.Hor(9).ElasticLow  = [16 70];
% Line.Hor(9).ElasticHigh = [1325 1395];
% 
% %res hor
% Res.Hor(1).ElasticLow   = [1195 1183 1979];
% Res.Hor(1).ElasticHigh  = [2038 1897 1979];
% Res.Hor(3).ElasticLow   = [986 1013];
% Res.Hor(3).ElasticHigh  = [1367 1377];
% Res.Hor(4).ElasticLow   = [1478 1620];
% Res.Hor(4).ElasticHigh  = [2082 2118];
% Res.Hor(6).ElasticLow   = [1018 1300];
% Res.Hor(6).ElasticHigh  = [1752 1771];
% Res.Hor(7).ElasticLow   = [342 443];
% Res.Hor(7).ElasticHigh  = [1494 1447];
% Res.Hor(9).ElasticLow   = [316 535];
% Res.Hor(9).ElasticHigh  = [1367 1258];
% 
% %res ver
% Res.Ver(2).ElasticLow   = [-269 -278 -275];
% Res.Ver(2).ElasticHigh  = [1085 1115 1104];
% Res.Ver(4).ElasticLow   = [1035 1144];
% Res.Ver(4).ElasticHigh  = [2001 1942];
% Res.Ver(6).ElasticLow   = [77 172 183];
% Res.Ver(6).ElasticHigh  = [960 1012 1018];
% Res.Ver(8).ElasticLow   = [-461 -414 -460];
% Res.Ver(8).ElasticHigh  = [1074 1072 1035];
% 
% %Via
% Via(6).ElasticLow       = [-1007 -1020 -1003];
% Via(6).ElasticHigh      = [286 308 350];

%% Ajout de l'erreur


%% Nettoyage
clearvars -except Line Papier Res Via LineTestElastic Traction

%% Sauvegarde
save('VarGood.mat')
disp('Variables sauvées dans VarGood.mat')