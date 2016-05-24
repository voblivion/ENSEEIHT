function [distance, padding, indices] = score(sample, data)
% Paramètres
depth = 0.2;

% Centrer les données
min_t_s = min(sample(:, 1));
sample(:, 1) = sample(:, 1) - min_t_s;
min_t_d = min(data(:, 1));
data(:, 1) = data(:, 1) - min_t_d;

% Calcul de la distance
max_t_s = max(sample(:, 2));
max_t_d = max(data(:, 2));
n_s = size(sample, 1);
distance = inf;
padding = 0;
indices = [];
for p = 0:depth:(max_t_d-max_t_s)
    d = 0;
    is = zeros(1, n_s);
    for j = 1:n_s
        s = [sample(j, 1)+p sample(j, 2)];
        [e, i] = sub_score(s, data);
        d = d + e;
        is(j) = i;
    end
    if d < distance
        distance = d;
        padding = p;
        indices = is;
    end
end

padding = padding - min_t_s + min_t_d;

end

