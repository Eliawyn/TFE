%% Tear Strength calcul
for i = 1:10
    point = find(Traction.Corner(i).time <= 15);
    point = point(end);
    
    Strength_Y = Traction.Corner(i).load(point);
    Strength_X = Traction.Corner(i).ext(point);
    Traction.Corner(i).TearStrength = Strength_Y/Strength_X; %N/mm ou kN/m
    
end

figure('name','Comparaison de la résistance des échantillons en coins','NumberTitle','off')
display = [Traction.Corner.TearStrength];
[A,B,C] = shadedplot([0 11], [9 9], [13 13], [1 0.7 0.7], 'r');
hold on
h = bar(display);
l = legend([C h],'Tear Strength of Polyester','Tear Strength of samples','Location','northwest');
hold off

xlim([0 11]);
title('Comparaison de la résistance des échantillons en coins')
xlabel('N° échantillon');
ylabel('Résistance à la fissure (kN/m)');