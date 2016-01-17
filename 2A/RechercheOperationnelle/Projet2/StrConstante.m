%% StrConstante (coopératif ou autre)
%
% Forme recherchée : y(n) = C
%
function [x, ok] = StrConstante(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;

% Coup à jouer si stratégie constante
x = 1 / 2 * (d - uy(n));
% Si chaque coup est assez proche de la moyenne des coups, c'est une
% stratégie constante
ok = false;

if abs(uy - mean(uy)) < epsilon
    ok = true;
end

end