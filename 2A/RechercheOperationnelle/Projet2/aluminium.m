function [x, str] = aluminium(numpart,tx,ty,gx,gy)

% Cas Décaller le jeu si numpart ne commence pas à 1
k = 1;
while k < numpart && tx(k) == 0
    k = k + 1;
end
ux = tx(k:numpart);
uy = ty(k:numpart);
vx = gx(k:numpart);
vy = gy(k:numpart);

% Nombre de coups joués
n = numpart-k;

% Demande
d = 3;
% Nombre de parties
kMin = size(tx, 2);

%% Coup initial 1
if n == 0;
    str = 'coup initial 1';
    x = d/2-0.00007; % -0.00007 pour signer le coup
    return;
end
%% Détection de moi même
[x, ok] = StrHatersKillah(ux, uy, n, kMin);
if ok
    str = 'stratégie aluminium';
    return;
end
%% Coup initial 2
if n == 1
    str = 'coup initial 2';
    x = d/2;
    return;
end
%% Détection des stratégies constantes
[x, ok] = StrConstante(ux, uy, n, kMin);
if ok
    str = 'stratégie constante';
    return;
end
%% Coup initial 3
if n == 2
    str = 'coup initial 3';
    x = d/2;
    return;
end
%% Détection des stratégies affines NON CONSTANTES
[x, ok] = StrAffine(ux, uy, n, kMin);
if ok
    str = 'stratégie affine';
    return;
end
%% Détection des stratégies cycliques NON CONSTANTES
[x, ok] = StrCyclique(ux, uy, n, kMin);
if ok
    str = 'stratégie cyclique';
    return;
end
%% Détection des stratégies cycliques affines NON AFFINES
[x, ok] = StrCycliqueAffine(ux, uy, n, kMin);
if ok
    str = 'stratégie cyclique affine';
    return;
end
%% Détection des stratégies contre-moyennes
[x, ok] = StrContreMoyenne(ux, uy, n, kMin);
if ok
    str = 'stratégie contre-moyenne';
    return;
end
%% Détection des stratégies aleatoires
[x, ok] = StrAleatoire(ux, uy, n, kMin);
if ok
    str = 'stratégie aléatoire';
    return;
end

%% Cas des stratégies intelligentes naives
[x, ok] = StrIntelligenteNaive(ux, uy, n, kMin);
if ok
    str = 'stratégie intelligente naïve';
    return;
end

%% Cas des stratégies intelligentes punissables
[x, ok] = StrIntelligentePunissable(ux, uy, n, kMin);
if ok
    str = 'stratégie intelligente punissable';
    return;
end

str = 'stratégie intelligente équitable';
x = d / 4;

end

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

%% StrAleatoire
%
% Forme recherchée : y = a + b * rand()
%
function [x, ok] = StrAleatoire(ux, uy, n, kMin)

% Parametres
epsilon = 10^-5;
d = 3;

% TODO
% Faire plutôt en fonction des a et b (ax + b)
ok = true;
x = 1 / 2 * (d - mean(uy));
for i = 1:n
    c = sum(abs(uy - uy(i)) < epsilon);
    if c > n / 4
        ok = false;
    end
end

end

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