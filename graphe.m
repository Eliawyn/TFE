d= [Traction.Line.YoungSim];
bar(d/(10^9),'y')

xlabel('N° échantillon');
ylabel('Module de Young (GPa)');
xlim([0 11]);
title('Simulation Module de Young -- Polyester')
grid on