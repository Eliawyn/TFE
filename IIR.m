%Tests de filtrage
% Créer des data load ...

decay_factor = 0.975;
first_value_y = 0;

% Program
b = 1-decay_factor;

% Initiate output
K = size(load, 1);
y = zeros(K,1);
y(1) = first_value_y; 

for n = 2:K
    y(n) = y(n-1) + b*(load(n) - y(n-1));
end

figure(1)
hold on
plot(time, y)
plot(time, load)
hold off