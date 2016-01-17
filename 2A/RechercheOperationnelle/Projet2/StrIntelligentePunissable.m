%% StrIntelligentePunissable
%
% Forme recherchée : ? qui a joué non-coop plus souvent que nous
%
function [x, ok] = StrIntelligentePunissable(ux, uy, n, kMin)

% Parametres
epsilon = 10^-2;
d = 3;
ok = sum(uy(2:n) > 0.75 * (1 + epsilon)) > sum(ux(2:n) > 0.75 * (1 + epsilon));
x = d / 2;

end