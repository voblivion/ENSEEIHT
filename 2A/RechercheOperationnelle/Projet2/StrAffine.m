%% StrAffine
%
% Forme recherchée : y(n) = b * (d - x(n-1))
%
function [x, ok] = StrAffine(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;
[c, e] = polyfit(ux(1:n-1), uy(2:n), 1);

ok = false;
x = 1;
% Si chaque coup est assez proche de l'approximation affine des coups,
% c'est une stratégie affine.
if e.normr / (n - 1) < epsilon && abs(c(1)) > epsilon
    % Calculer la limite de la contre mesure
    by = -c(1);
    bx = 1 / (2 - by);
    x = bx * (d - uy(n));
    for i = 1:10
        y = by * (d - x);
        x = bx * (d - y);
    end
    ok = true;
end

end