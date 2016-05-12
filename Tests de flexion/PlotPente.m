figure

for i = 1:(length(Via))
   % Graphe des pentes des droites
   stem(i,Via(i).Pente, 'LineWidth', 1.5)
   hold on
   
end

title('Flexibilit� : R�sistances verticales')
ylabel('Pente (�m/mg)');
xlabel('Echantillons');
xlim([0.5 9.5]);
