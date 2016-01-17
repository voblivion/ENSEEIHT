%% StrCyclique
%
% Forme recherchée : y(n) = k(n%m) avec m un entier et k indépendant de x
%
function [x, ok] = StrCyclique(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;

ok = false;
y = uy(n);
m = ceil(n/2);
o = n-1;
% Indices des valeurs égales au dernier coup joué
indices = find(abs(uy(m:o) - y) < epsilon) + m - 1;
x = 0;
for i = indices
    k = 0;
    ok = true;
    while 1 <= i - k && ok
        ok = (uy(n-k) == uy(i - k));
        k = k + 1;
    end
    if ok
        x = 1 / 2 * (d - uy(i+1));
        return;
    end
end

end
