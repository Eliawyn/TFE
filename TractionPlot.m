function TractionPlot(genre,num,~)
%% Fonction tra�ant le graphe pour les essais de traction
%   genre DOIT �tre un string
%       - soit Line, qui trace la s�rie d'�chantillons de lignes verticales
%       - soit Corner, qui trace la s�rie avec les diff�rents coins
%
%   n est le num�ro du graphe s�lectionn�
%       Il ne peut pas �tre un string ! 
%
% Appel type : TractionPlot('corner',6);

%try
    %Chargement des variables
    load('VarTraction')
    
    eval(sprintf('time = Traction.%s(%d).time;',genre,num));
    eval(sprintf('theload = Traction.%s(%d).load;',genre,num));
    eval(sprintf('ext = Traction.%s(%d).ext;',genre,num));
    
    %Si on ne sp�cifie pas de filtrage
    if nargin < 3 
        %Appel du plot
        figure
        h = plot(ext,theload);
        hold on
        eval(sprintf('plot(Traction.%s(%d).Px,Traction.%s(%d).Py, ''LineWidth'', 1.5);',genre,num,genre,num));
        
    %Si on sp�cifie qu'on veut filtrer le graphe
    else
        %Param�trage du filtrage
        decay_factor = 0.975;
        first_value_y = 0;
        b = 1-decay_factor;

        % Initiate output
        K = length(theload);
        y = zeros(K,1);
        y(1) = first_value_y; 

        %Application du filtre
        %   Si la prochaine valeur est x,
        %   non, tu bouges que de x/b !
        for n = 2:K
            y(n) = y(n-1) + b*(theload(n) - y(n-1));
        end
        
        %Appel du plot
        figure
        h = plot(time,y);
    end
    
    %Caract�ristiques du plot
    grid on
    set(h, 'LineWidth', 1.5);
    title(sprintf('D�formation de l''�chantillon %s_%d suite � une traction longitudinale'...
                    ,genre,num),'Interpreter','none')
    xlabel('D�formation relative (mm)')
    ylabel('Charge (N)')
    legend('Donn�es essai de traction','Pente du domaine �lastique','Location','Southwest','Orientation','horizontal')
    %xlim([0 ext(end)+10])
    
    clear t K 
% catch 
%      warning('You must use TractionPlot(''Corner'',X) or TractionPlot(''Corner'',X,1)')
% end

end

