%% StrContreMoyenne
%
% Forme recherchée : y = 1 / 2 * (d - mean(x))
%
function [x, ok] = StrContreMoyenne(ux, uy, n, nMax)

% Parametres
epsilon = 10^-8;
d = 3;

ok = true;
k = 2;
% si l'autre joue non coop sur notre moyenne ? jouer d/2 (limite de
% stackelberg)
x = d/2;

while k < n && ok
    if abs(uy(k) - 1 / 2 * (d - mean(ux(1:k-1)))) > epsilon
        ok = false;
    end
    k = k + 1;
end

end