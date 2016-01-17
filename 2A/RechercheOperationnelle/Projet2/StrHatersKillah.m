%% StrHatersKillah
%
% Forme recherchée : notre stratégie
%
function [x, ok] = StrHatersKillah(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;

x = d / 4;
ok = (abs(uy(1) - (d/2-0.00007)) < epsilon);

end