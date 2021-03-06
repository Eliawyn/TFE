%% Comparaison polyester -- polyimide

display = [ Line.PI.Fleche ; NaN Line.PI.Pente];
display(1,:) = display(1,:)*10^4;
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilit� -- polyimide','NumberTitle','off')

b = bar(display','hist');
b(1).FaceColor = 'blue'; 
b(2).FaceColor = 'red'; 
title('Comparaison flexibilit� polyester -- polyimide')
xlabel('N� �chantillon');
ylabel('Pente (�m/mg)');
legend('Pente calcul�e th�oriquement', 'Pente des tests pratiques','Location','northeast')
xlim([ 0.5 10.5 ]);
ylim([0 21]);
%C'est le num�ro de l'�chantillon ... car par le premier !

clearvars -except Line Papier Res Via Traction Cote