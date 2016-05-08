%% Comparaison polyester -- polyimide

display = [ Line.Ver.Pente ; NaN Line.PI.Pente];
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilité polyester -- polyimide','NumberTitle','off')

bar(display','hist')
title('Comparaison flexibilité polyester -- polyimide')
xlabel('N° échantillon');
ylabel('Pente (µm/mg)');
legend('Polyester', 'Polyimide','Location','northeast')
xlim([ 0.5 10.5 ]);
%C'est le numéro de l'échantillon ... car par le premier !

clearvars -except Line Papier Res Via Traction Cote