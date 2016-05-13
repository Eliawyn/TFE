%% Tear Strength calcul
for i = 1:10
    point = find(Traction.Corner(i).time <= 15);
    point = point(end);
    
    Strength_Y = Traction.Corner(i).load(point);
    Strength_X = Traction.Corner(i).ext(point);
    Traction.Corner(i).TearStrength = Strength_Y/Strength_X; %N/mm ou kN/m
    
end

figure('name','Comparaison de la résistance aux fissures des échantillons en coins','NumberTitle','off')
display = [Traction.Corner.TearStrength];
%[A,B,C] = shadedplot([0 11], [9 9], [13 13], [1 0.7 0.7], 'r');
hold on
h = bar(display);
set(gca,'XTick',1:10)
set(gca,'XTickLabels', {'90°, absent', ...
                        '90°, cuivre', ...
                        '90°, découpe', ...
                        '45°, absent', ...
                        '45°, cuivre', ...
                        '45°, longueur moyenne', ...
                        'courbé, absent', ...
                        'courbé, cuivre', ...
                        'courbé, rayon moyen', ...
                        'courbé, rayon grand'})
set(gca,'XTickLabelRotation', 45)
%l = legend([C h],'Résistance aux fissures Polyester','Résistance aux fissures des échantillons','Location','northwest');
hold off

xlim([0.5 10.5]);
title('Comparaison de la résistance des échantillons en coins')
%xlabel('N° échantillon');
ylabel('Résistance aux fissures (N/mm)');
grid on