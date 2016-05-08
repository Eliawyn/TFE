%% Comparaison polyester -- polyimide

display = [ Line.Ver.Pente ; NaN Line.PI.Pente];
%Sans le premier vu qu'il n'existe pas en polyimide

figure('name','Comparaison flexibilit� polyester -- polyimide','NumberTitle','off')

bar(display','hist')
title('Comparaison flexibilit� polyester -- polyimide')
xlabel('N� �chantillon');
ylabel('Pente (�m/mg)');
legend('Polyester', 'Polyimide','Location','northeast')
xlim([ 0.5 10.5 ]);
%C'est le num�ro de l'�chantillon ... car par le premier !

clearvars -except Line Papier Res Via Traction Cote