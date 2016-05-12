# Travail de fin d'�tudes
> Maxime Bosquet - 17 mai 2016

- Au pr�alable, faire un *click droit* sur le dossier **TFE** dans MATLAB et *Add to path - Selected folder and subfolders*
- Concentration des calculs et outils utilis�s pour le TFE
- Tous les fichiers MATLAB sont pr�sents

## Tests de traction
#### Variables
- **VarTraction.mat** comprend toutes les donn�es concernant les tests de traction
- Les donn�es sont pr�sent�es de la même mani�re que pour les tests de flexion

#### Fichiers
- Dossier **Fichiers source** pr�sente les fichiers texte comprenant les donn�es r�cup�r�es de la machine
- **Fichiers excel** sont les fichiers texte import�s dans Excel
- **VarTraction.mat** est tir� des fichiers excel

#### Fonctions
- **importexcel.m** permet d'importer un fichier excel
```matlab
[time, load, ext] = importexcel('Corner_8')    % Exemple
```
- **TractionPlot.m** permet de tracer les courbes d'un �chantillon choisi, il permet aussi d'appliquer un filtre IIR d'ordre 1 pour lisser la courbe
```matlab
TractionPlot('Line',5)    % Exemple
TractionPlot('Line',5,1)  % Avec filtre
```
- **Young.m** permet de calculer le module de Young avec un load et une extension donn�s
```matlab
[E] = Young(0.3645, 50.1562)    % Exemple
```
- **shadeplot** permet de cr�er une zone de couleur dans un plot
```matlab
[A,B,C] = shadedplot([0 11], [9 9], [13 13], [1 0.7 0.7], 'r');
```

#### Scripts
- **CreationVariableExcel** permet d'importer les donn�es des fichiers excel dans VarTraction.mat
- **AllLinePlot** et **AllCornerPlot** permet d'afficher tous les graphes des donn�es
- **LineYoungPlot** et **CornerYoungPlot** permet d'afficher les diff�rents modules de Young
- **YoungSimPET** et **YoungSimPI** permettent de simuler et trouver th�oriquement le module de Young sur les �chantillons de lignes verticales en polyester ou en polyimide. 
- **TearStrength** permet de calculer et afficher les r�sistances aux fissures des diff�rents �chantillons en coin, et comparer les diff�rents syst�mes de s�curit� de circuits

## Tests de flexion
#### Variables
- **VarBrut.mat** reprend les donn�es basiques r�cup�r�es du test
- **VarGood.mat** reprend les donn�es �dit�es pour une meilleure compr�hension

> Chaque structure est repr�sent�e par un poids (X), une fl�che (Y) et un commentaire. 

Diff�rentes mani�res d'appeler une variable :
```matlab
Line.Ver(1)      % Retourne les informations de Line.Ver
```
```matlab
for i = 1:10
    figure
    plot(Res.Ver(i).X, Res.Ver(i).Y)
    % Graphe de tous les �chantillons de r�sistances verticales
end
```

#### Scripts
- **Variables** transformation des **VarBrut** en **VarGood**
- **plotting** permet de mettre en graphe toutes les donn�es
- **main** permet de faire les deux � la suite
- **FlexSimPET** et **FlexSimPI** permettent de faire une simulation des fl�ches de chaque �chantillon
- **CoteRes** permet de comparer l'effet du sens du pliage en interne ou externe
- **FlexPI** permet de comparer la flexibilit� du polyimide
- **PlotOne** sert � afficher les donn�es de flexion
- **Encapsulation** permet de simuler la flexibilit� pour l'ajout d'une encapsulation en silicone
- **YoungComp** et **PlotPente** sont inutiles, juste pour information personnelle
> Les graphes pr�sentent les donn�es, le moyennage de celles-ci et le r�sultat. Les autres fichiers *.m* sont � titre personnel d'information et ne sont pas utiles ici.

## Tests d'�lasticit�
Non termin�.

## Contributeur
Maxime Bosquet
