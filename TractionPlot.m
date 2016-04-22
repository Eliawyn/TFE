function TractionPlot(genre,num,~)
%% Fonction traçant le graphe pour les essais de traction
%   genre DOIT être un string
%       - soit Line, qui trace la série d'échantillons de lignes verticales
%       - soit Corner, qui trace la série avec les différents coins
%
%   n est le numéro du graphe sélectionné
%       Il ne peut pas être un string ! 
%
% Appel type : TractionPlot('corner',6);

%try
    %Chargement des variables
    load('VarTraction')
    
    eval(sprintf('time = Traction.%s(%d).time;',genre,num));
    eval(sprintf('theload = Traction.%s(%d).load;',genre,num));
    
    %Si on ne spécifie pas de filtrage
    if nargin < 3 
        %Appel du plot
        figure
        h = plot(time,theload);
        hold on
        eval(sprintf('plot(Traction.%s(%d).Px,Traction.%s(%d).Py, ''LineWidth'', 1.5);',genre,num,genre,num));
        
    %Si on spécifie qu'on veut filtrer le graphe
    else
        %Paramétrage du filtrage
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
    
    %Caractéristiques du plot
    grid on
    set(h, 'LineWidth', 1.5);
    title(sprintf('Déformation de l''échantillon %s_%d suite à une traction longitudinale'...
                    ,genre,num),'Interpreter','none')
    xlabel('Temps (s)')
    ylabel('Load (N)')
    %xlim([0 time(end)])
    
    clear t K 
% catch 
%      warning('You must use TractionPlot(''Corner'',X) or TractionPlot(''Corner'',X,1)')
% end

end

