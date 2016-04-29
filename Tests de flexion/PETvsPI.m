%% Comparaison polyester -- polyimide

display = [Line.Ver(2:end).Pente ; Line.PI.Pente];
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilité polyester -- polyimide','NumberTitle','off')

bar(display','hist')
title('Comparaison flexibilité polyester -- polyimide')
xlabel('N° échantillon');
ylabel('Pente (µm/mg)');
legend('Polyester', 'Polyimide','Location','northeast')

clearvars -except Line Papier Res Via Traction Cote