%% Détermination du meilleur côté de pliage
% La flexibilité change en fcontion du sens du pliage

Cote(1).X           = [0 50];
Cote(1).interne     = [0 188];
Cote(1).externe = [0 690];
Cote(1).commentaire = '4 hor Res';
Cote(2).X           = [0 50 100];
Cote(2).interne     = [0 171 383];
Cote(2).externe     = [0 280 567];
Cote(2).commentaire = '6 hor Res';
Cote(3).X           = [0 50 100 110];
Cote(3).interne     = [0 300 540 618];
Cote(3).externe     = [0 279 604 708];
Cote(3).commentaire = '8 hor Res';
Cote(4).X           = [0 50 100 180];
Cote(4).interne     = [0 127 259 501];
Cote(4).externe     = [0 57 177 405];
Cote(4).commentaire = '10 hor Res';

Cote(5).X           = [0 50 100 110 160];
Cote(5).interne     = [0 128 339 427 688];
Cote(5).externe     = [0 158 377 900 1139];
Cote(5).commentaire = '4 ver Res';
Cote(6).X           = [0 50 100];
Cote(6).interne     = [0 219 498];
Cote(6).externe     = [0 61 129];
Cote(6).commentaire = '6 ver Res';
Cote(7).X           = [0 50 100 110 160];
Cote(7).interne     = [0 348 595 650 765];
Cote(7).externe     = [0 20 161 274 415];
Cote(7).commentaire = '8 ver Res';
Cote(8).X           = [0 50 100];
Cote(8).interne     = [0 195 75];
Cote(8).externe     = [0 75 175];
Cote(8).commentaire = '10 ver Res';

for i=1:8
    Cote(i).PenteInterne = Cote(i).interne/Cote(i).X;
    Cote(i).PenteExterne = Cote(i).externe/Cote(i).X;
end

display = [Cote.PenteInterne ; Cote.PenteExterne];
display(1,1) = Res.Hor(4).Pente;
display(1,2) = Res.Hor(6).Pente;
display(1,3) = Res.Hor(8).Pente;
display(1,4) = Res.Hor(10).Pente;
display(1,5) = Res.Ver(4).Pente;
display(1,6) = Res.Ver(6).Pente;
display(1,7) = Res.Ver(8).Pente;
display(1,8) = Res.Ver(10).Pente;

figure('name','Influence du sens de pliage sur la flexibilité','NumberTitle','off')

bar(display','hist')
title('Influence du sens de pliage sur la flexibilité')
xlabel('N° échantillon');
ylabel('Pente (µm/mg)');
legend('Flexibilité pliage composant en interne', 'Flexibilité pliage composant en externe','Location','northeast')

clearvars -except Line Papier Res Via Traction Cote
