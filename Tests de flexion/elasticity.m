%% Plot de l'élasticité
% close all
figure

for i=1:10
    Line.Ver(i).MoyElastic = (Line.Ver(i).ElasticLow + Line.Ver(i).ElasticHigh)/2;
    Line.Ver(i).Var= std(Line.Ver(i).MoyElastic);
    Line.Hor(i).MoyElastic = (Line.Hor(i).ElasticLow + Line.Hor(i).ElasticHigh)/2;
    Line.Hor(i).Var= std(Line.Hor(i).MoyElastic);
    Res.Hor(i).MoyElastic  = (Res.Hor(i).ElasticLow  + Res.Hor(i).ElasticHigh)/2;
    Res.Hor(i).Var= std(Res.Hor(i).MoyElastic);
    Res.Ver(i).MoyElastic  = (Res.Ver(i).ElasticLow  + Res.Ver(i).ElasticHigh)/2;
    Res.Ver(i).Var= std(Res.Ver(i).MoyElastic);
    
    subplot(2,2,1)
    stem(i,Line.Ver(i).Var);
    xlim([0.5 10.5]);
    hold on
    subplot(2,2,2)
    stem(i,Line.Hor(i).Var);
    xlim([0.5 10.5]);
    hold on
    subplot(2,2,3)
    stem(i,Res.Hor(i).Var);
    xlim([0.5 10.5]);
    hold on
    subplot(2,2,4)
    stem(i,Res.Ver(i).Var);
    xlim([0.5 10.5]);
    hold on
    
end
% 
% %Exemple
% figure
% Polynome = polyfit(Line.Hor(7).MoyElasticX, Line.Hor(7).MoyElastic,1);
% DataPol  = polyval(Polynome, Line.Hor(7).MoyElasticX);
% plot(Line.Hor(7).MoyElasticX, DataPol, '--', 'LineWidth', 1.5)
% hold on
% plot(Line.Hor(7).ElasticLow, 'LineWidth', 1.5);
% hold on
% plot(Line.Hor(7).ElasticHigh, 'LineWidth', 1.5);
% hold on
% plot(Line.Hor(7).MoyElastic, 'LineWidth', 1.5);
% legend('Droite','Seuil bas','Seuil haut','Moyenne');
figure
plot(LineTestElastic)

