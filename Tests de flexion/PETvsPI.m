%% Comparaison polyester -- polyimide

display = [0 Line.Ver(2:end).Pente ; 0 Line.PI.Pente];
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilit� polyester -- polyimide','NumberTitle','off')

bar(display','hist')
title('Comparaison flexibilit� polyester -- polyimide')
xlabel('N� �chantillon');
ylabel('Pente (�m/mg)');
legend('Polyester', 'Polyimide','Location','northwest')
xlim([ 1.5 10.5 ]);
%C'est le num�ro de l'�chantillon ... car par le premier !

clearvars -except Line Papier Res Via Traction Cote