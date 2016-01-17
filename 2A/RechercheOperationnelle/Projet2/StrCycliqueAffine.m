%% StrCycliqueAffine
%
% Forme recherchée : y(n) = b(n%m) * (d - x(n-1)) avec m un entier et b
%                                                 indépendant de x
%
function [x, ok] = StrCycliqueAffine(ux, uy, n, kMin)

% Parametres
epsilon = 10^-10;
d = 3;

% Mettre 1 là où y a joué 0 (car alors x vaut 3 donc dx vaut 0)
uy(find(uy == 0)) = 1;
dx = d - ux(1:n-1);
by = uy(2:n) ./ dx;

ok = false;
p = n-1;
b = by(p);
m = ceil(p/2);
o = p-1;
% Indices des valeurs égales au dernier coup joué
indices = find(abs(by(m:o) - b) < epsilon | by(m:o) == inf) + m - 1;
x = 0;
for i = indices
    k = 0;
    ok = true;
    while 1 <= i - k && ok
        ok = (abs(by(p-k) - by(i - k) < epsilon) | by(p-k) == inf | by(i-k) == inf);
        k = k + 1;
    end
    if ok
        % Recherche du prochain coefficient du concurent
        taille_cycle = p-i;
        j = i+1;
        while j > 0 && by(j) == inf
            j = j - taille_cycle;
        end
        % Si on n'en trouve pas (car que des valeurs indéfinies)
        if j <= 0
            x = d/4;
        else
            x = 1/2 * (d - by(j) * (3 - ux(n)));
            return;
        end
    end
end

end