%% Tear Strength calcul
for i = 1:10
    point = find(Traction.Corner(i).time <= 15);
    point = point(end);
    
    Strength_Y = Traction.Corner(i).load(point);
    Strength_X = Traction.Corner(i).ext(point);
    Traction.Corner(i).TearStrength = Strength_Y/Strength_X; %N/mm ou kN/m
    
end

figure('name','Comparaison de la r�sistance aux fissures des �chantillons en coins','NumberTitle','off')
display = [Traction.Corner.TearStrength];
%[A,B,C] = shadedplot([0 11], [9 9], [13 13], [1 0.7 0.7], 'r');
hold on
h = bar(display);
set(gca,'XTick',1:10)
set(gca,'XTickLabels', {'90�, absent', ...
                        '90�, cuivre', ...
                        '90�, d�coupe', ...
                        '45�, absent', ...
                        '45�, cuivre', ...
                        '45�, longueur moyenne', ...
                        'courb�, absent', ...
                        'courb�, cuivre', ...
                        'courb�, rayon moyen', ...
                        'courb�, rayon grand'})
set(gca,'XTickLabelRotation', 45)
%l = legend([C h],'R�sistance aux fissures Polyester','R�sistance aux fissures des �chantillons','Location','northwest');
hold off

xlim([0.5 10.5]);
title('Comparaison de la r�sistance des �chantillons en coins')
%xlabel('N� �chantillon');
ylabel('R�sistance aux fissures (N/mm)');
grid on