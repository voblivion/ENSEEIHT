%% StrIntelligenteNaive
%
% Forme recherchée : ? à qui on peut faire croire qu'on joue fixe
%
function [x, ok] = StrIntelligenteNaive(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;

ok = mean(ux(2:n) .* (d - ux(2:n) - uy(2:n))) > (0.75 ^ 2) + epsilon;
x = d / 2;

end