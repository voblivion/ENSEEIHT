%% Génère des temps d'interpolation selon le critère choisis
% type:
%   1 = uniforme
%   2 = distance
%   3 = distance ^ (1/2)
%   4 = Tchebitchev
function tps = temps(P, type)

n = size(P, 2);
tps = zeros(1, n);
for i = 1:n
    switch type
        case 1
            if i == 1
                tps(1, i) = 0;
            else
                tps(1, i) = i - 1;
            end
        case 2
            if i == 1
                tps(1, i) = 0;
            else
                tps(1, i) = tps(1, i-1) + norm(P(:, i) - P(:, i-1));
            end
        case 3
            if i == 1
                tps(1, i) = 0;
            else
                tps(1, i) = tps(1, i-1) + sqrt(norm(P(:, i) - P(:, i-1)));
            end
        case 4
            tps(1, i) = cos((2 * (i - 1) + 1) * pi / (2 * n + 2));
        otherwise
            error('Type not supported')
    end
end

mi = min(tps);
ma = max(tps);
delta = ma - mi;
tps = (tps - mi) / delta;

end