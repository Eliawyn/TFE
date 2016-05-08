for i = 1:10
if i==9
       plot(Line.Ver(i).X, Line.Ver(i).Y, '--o', 'DisplayName', 'Masse pleine'          , 'LineWidth', 1.5);
   elseif i==10
       plot(Line.Ver(i).X, Line.Ver(i).Y, '--o', 'DisplayName', 'Masse hachurée'        , 'LineWidth', 1.5);
   else
       plot(Line.Ver(i).X ,Line.Ver(i).Y, '-o' , 'DisplayName', [num2str(i-1) ' lignes'], 'LineWidth', 1.5);
   end
hold on
end
hold off
title('Déformation échantillons : Lignes verticales')
xlabel('Charge (mg)')
ylabel('Flèche (µm)')
legend('Location','southeast')
legend(gca,'show')