figure

for i = 1:(length(Via))
   % Graphe des pentes des droites
   stem(i,Via(i).Pente, 'LineWidth', 1.5)
   hold on
   
end

title('Flexibilité : Résistances verticales')
ylabel('Pente (µm/mg)');
xlabel('Echantillons');
xlim([0.5 9.5]);
