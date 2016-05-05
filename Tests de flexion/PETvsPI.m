%% Comparaison polyester -- polyimide

display = [0 Line.Ver(2:end).Pente ; 0 Line.PI.Pente];
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilité polyester -- polyimide','NumberTitle','off')

bar(display','hist')
title('Comparaison flexibilité polyester -- polyimide')
xlabel('N° échantillon');
ylabel('Pente (µm/mg)');
legend('Polyester', 'Polyimide','Location','northwest')
xlim([ 1.5 10.5 ]);
%C'est le numéro de l'échantillon ... car par le premier !

clearvars -except Line Papier Res Via Traction Cote