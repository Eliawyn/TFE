%% Graphes
clearvars -except Line Papier Res Via Traction Cote
close all
load('VarGood.mat')

%% Lignes verticales
figure('name','Lignes verticales','NumberTitle','off')

for i = 1:(length(Line.Ver))
   %Graphe des valeurs
   subplot(2,2,1);
   if i==9
       plot(Line.Ver(i).X, Line.Ver(i).Y, '--o', 'DisplayName', 'Masse pleine'          , 'LineWidth', 1.5);
   elseif i==10
       plot(Line.Ver(i).X, Line.Ver(i).Y, '--o', 'DisplayName', 'Masse hachurée'        , 'LineWidth', 1.5);
   else
       plot(Line.Ver(i).X ,Line.Ver(i).Y, '-o' , 'DisplayName', [num2str(i-1) ' lignes'], 'LineWidth', 1.5);
   end
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   if i==9
       plot(Line.Ver(i).Px,Line.Ver(i).Py, '--', 'DisplayName', 'Masse pleine'  , 'LineWidth', 1.5)
   elseif i==10
       plot(Line.Ver(i).Px,Line.Ver(i).Py, '--', 'DisplayName', 'Masse hachurée'  , 'LineWidth', 1.5)
   else
       plot(Line.Ver(i).Px,Line.Ver(i).Py, 'DisplayName', [num2str(i-1) ' lignes'], 'LineWidth', 1.5)
   end
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   if i>8
       stem(i-1,Line.Ver(i).Pente, 'LineWidth', 1.5, 'LineStyle', '--')
   else
       stem(i-1,Line.Ver(i).Pente, 'LineWidth', 1.5)
   end
   hold on
  
end

subplot(2,2,1);
title('Déformation échantillons : Lignes verticales')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Lignes verticales moyennes')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([-0.5 9.5]);

%% Lignes verticales polyimide
figure('name','Lignes verticales polyimide','NumberTitle','off')

for i = 1:(length(Line.PI))
   %Graphe des valeurs
   subplot(2,2,1);
   if i==8
       plot(Line.PI(i).X, Line.PI(i).Y, '--o', 'DisplayName', 'Masse pleine'          , 'LineWidth', 1.5);
   elseif i==9
       plot(Line.PI(i).X, Line.PI(i).Y, '--o', 'DisplayName', 'Masse hachurée'        , 'LineWidth', 1.5);
   else
       plot(Line.PI(i).X ,Line.PI(i).Y, '-o' , 'DisplayName', [num2str(i) ' lignes'], 'LineWidth', 1.5);
   end
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   if i==8
       plot(Line.PI(i).Px,Line.PI(i).Py, '--', 'DisplayName', 'Masse pleine'  , 'LineWidth', 1.5)
   elseif i==9
       plot(Line.PI(i).Px,Line.PI(i).Py, '--', 'DisplayName', 'Masse hachurée'  , 'LineWidth', 1.5)
   else
       plot(Line.PI(i).Px,Line.PI(i).Py, 'DisplayName', [num2str(i) ' lignes'], 'LineWidth', 1.5)
   end
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   if i==8
       stem(i,Line.PI(i).Pente, 'DisplayName', 'Masse pleine', 'LineWidth', 1.5, 'LineStyle', '--')
   elseif i==9
       stem(i,Line.PI(i).Pente, 'DisplayName', 'Masse hachurée', 'LineWidth', 1.5, 'LineStyle', '--')
   else
       stem(i,Line.PI(i).Pente, 'DisplayName', [num2str(i) ' lignes'], 'LineWidth', 1.5)
   end
   if i>6
       
   else
       
   end
   hold on
  
end

subplot(2,2,1);
title('Déformation échantillons : Lignes verticales')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Lignes verticales moyennes')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
legend('Location','northeastoutside')
xlim([0.5 9.5]);

%% Lignes horizontales
figure('name','Lignes horizontales','NumberTitle','off')

for i = 1:(length(Line.Hor))
   %Graphe des valeurs
   subplot(2,2,1);
   plot(Line.Hor(i).X, Line.Hor(i).Y, '-o', 'DisplayName', [num2str(i*2) ' lignes'], 'LineWidth', 1.5);
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   plot(Line.Hor(i).Px,Line.Hor(i).Py, 'DisplayName', [num2str(i*2) ' lignes'], 'LineWidth', 1.5)
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   stem((i)*2,Line.Hor(i).Pente, 'LineWidth', 1.5)
   hold on
   
end

subplot(2,2,1);
title('Déformation échantillons : Lignes horizontales')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Lignes horizontales moyennes')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([1.5 20.5]);

%% Résistances horizontales
figure('name','Résistances horizontales','NumberTitle','off')

for i = 1:(length(Res.Hor))
   %Graphe des valeurs
   subplot(2,2,1);
   plot(Res.Hor(i).X, Res.Hor(i).Y, '-o', 'DisplayName', [num2str(i) ' résistances'], 'LineWidth', 1.5);
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   plot(Res.Hor(i).Px,Res.Hor(i).Py, 'DisplayName', [num2str(i) ' résistances'], 'LineWidth', 1.5)
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   stem(i,Res.Hor(i).Pente, 'LineWidth', 1.5)
   hold on
  
end

subplot(2,2,1);
title('Déformation échantillons : Résistances horizontales')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Résistances horizontales moyennes')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([0.5 10.5]);

%% Résistances verticales
figure('name','Résistances verticales','NumberTitle','off')

for i = 1:(length(Res.Ver))
   %Graphe des valeurs
   subplot(2,2,1);
   plot(Res.Ver(i).X, Res.Ver(i).Y, '-o', 'DisplayName', [num2str(i) ' résistances'], 'LineWidth', 1.5);
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   plot(Res.Ver(i).Px,Res.Ver(i).Py, 'DisplayName', [num2str(i) ' résistances'], 'LineWidth', 1.5)
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   stem(i,Res.Ver(i).Pente, 'LineWidth', 1.5)
   hold on
  
end

subplot(2,2,1);
title('Déformation échantillons : Résistances verticales')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Résistances verticales moyennes')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([0.5 10.5]);

%% Via
figure('name','Vias','NumberTitle','off')

for i = 1:(length(Via))
   %Graphe des valeurs
   subplot(2,2,1);
   plot(Via(i).X, Via(i).Y, '-o', 'DisplayName', [num2str(i) ' vias'], 'LineWidth', 1.5);
   hold on
   
   %Graphe des droites moyennes
   subplot(2,2,2)
   plot(Via(i).Px,Via(i).Py, 'DisplayName', [num2str(i) ' vias'], 'LineWidth', 1.5)
   hold on

   % Graphe des pentes des droites
   subplot(2,2,3)
   stem(i,Via(i).Pente, 'LineWidth', 1.5)
   hold on
  
end

subplot(2,2,1);
title('Déformation échantillons : Vias')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,2);
title('Déformation échantillons : Vias')
xlabel('Force (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')

subplot(2,2,3)
title('Flexibilité : Pentes des droites de moindres carrés')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([0.5 9.5]);

clear i

%% EXEMPLE DE CALCUL POUR UNE DROITE NE PASSANT PAS PAR ZERO
%
%    %Graphe des droites carrés
%    Polynome = polyfit(Line.Ver(i).X,Line.Ver(i).Y,1);
%    DataPol  = polyval(Polynome, Line.Ver(i).X);
%    subplot(2,2,2);
%    if i==9
%        plot(Line.Ver(i).X, DataPol, '--', 'DisplayName', 'Masse pleine'  , 'LineWidth', 1.5);
%    %elseif i==2
%    %    DroiteTest = DataPol;
%    elseif i==10
%        plot(Line.Ver(i).X, DataPol, '--', 'DisplayName', 'Masse hachurée', 'LineWidth', 1.5);
%    else
%        plot(Line.Ver(i).X, DataPol, 'DisplayName', [num2str(i-1) ' lignes'], 'LineWidth', 1.5);
%    end
%    hold on
%    
%    %Barre des pentes
%    Pentes.LineVer(i) = Polynome(1);
%    subplot(2,2,3)
%    if i>8
%        stem(Px.LineVer(i),Pentes.LineVer(i), 'LineWidth', 1.5,'LineStyle', '--');
%    else
%        stem(Px.LineVer(i),Pentes.LineVer(i), 'LineWidth', 1.5);
%    end
%    hold on