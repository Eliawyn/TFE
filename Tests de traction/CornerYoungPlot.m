figure('name','Module de Young Corner','NumberTitle','off')
for i = 1:10
    stem(i,Traction.Corner(i).YoungM/(10^(9)), 'LineWidth', 1.5)
    hold on
end

xlim([0.5 10.5]);
title('Module de Young des �chantillons de corner en traction')
xlabel('N� �chantillon');
ylabel('Module de Young (GPa)');
legend( '90�, clean', ...
        '90�, tear stop', ...
        '90�, soft cutout', ...
        '45�, clean', ...
        '45�, tear stop', ...
        '45�, clean medium', ...
        'Curved, clean', ...
        'Curved, tear stop', ...
        'Curved, clean medium', ...
        'Curved, clean long', ...
        'Location','northwest')

% figure
% for i = 1:10
%     eval(sprintf('A = max(Traction.Corner(%d).load);',i));
%     LoadMax(i) = A;
%     stem(i,LoadMax(i), 'LineWidth',1.5)
%     hold on
% end
% 
% xlim([0.5 10.5]);
% title('Charge maximum atteinte pour les �chantillons de corner en traction')
% legend( '90�, clean', ...
%         '90�, tear stop', ...
%         '90�, soft cutout', ...
%         '45�, clean', ...
%         '45�, tear stop', ...
%         '45�, clean medium', ...
%         'Curved, clean', ...
%         'Curved, tear stop', ...
%         'Curved, clean medium', ...
%         'Curved, clean long', ...
%         'Location','northwest')
    
clear A i LoadMax