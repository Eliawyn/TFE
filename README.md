# Travail de fin d'étude
> Maxime Bosquet
- Concentration des calculs et outils utilisés pour le TFE
- Tous les fichiers MATLAB sont présents

### Tests de flexion
##### Variables
- *VarBrut.mat* reprend les données basiques récupérées du test
- *VarGood.mat* reprend les données éditées pour une meilleure compréhension

> Chaque structure est représentée par un poids (X), une flèche (Y) et un commentaire. 

Différentes manières d'appeler une variable :
```matlab
Line.Ver.X      % Retourne la colonne X dans Line.Ver
```
```matlab
for i = 1:10
    figure
    plot(Res.Ver(i).X, Res.Ver(i).Y)
    % Graphe de tous les échantillons de résistances verticales
end
```

##### Scripts
- *Variables* transformation des **VarBrut** en **VarGood**
- *plotting* permet de mettre en graphe toutes les données
- *main* permet de faire les deux à la suite
> Les graphes présente les données, le moyennage de celles-ci et le résultat. Les autres fichiers *.m* sont à titre personnel d'information et ne sont pas utiles ici.

### Tests de traction
##### Variables
- *VarTraction.mat* comprend toutes les données concernant les tests de traction
- Les données sont présentées de la même manière que pour les tests de flexion

##### Fichiers
- Dossier *Fichiers source* présente les fichiers texte comprenant les données récupérées de la machine
- *Fichiers excel* sont les fichiers texte importés dans Excel
- *VarTraction.mat* est tiré des fichiers excel

##### Fonctions
- *importexcel.m* permet d'importer un fichier excel
```matlab
[time, load, ext] = importexcel('Corner_8')    % Exemple
```
- *TractionPlot.m* permet de tracer les courbes d'un échantillon choisi
```matlab
TractionPlot('Line',5)    % Exemple
```
- *Young.m* permet de calculer le module de Young avec un load et une extension donnés
```matlab
[E] = Young(0.3645, 50.1562)    % Exemple
```

##### Scripts
- *CreationVariableExcel* permet d'importer les données des fichiers excel dans VarTraction.mat
- *AllLinePlot* et *AllCornerPlot* permet d'afficher tous les graphes des données
- *LineYoungPlot* et *CornerYoungPlot* permet d'afficher les différents modules de Young

### Tests d'élasticité
Non terminé.

# Contributeur
Maxime Bosquet