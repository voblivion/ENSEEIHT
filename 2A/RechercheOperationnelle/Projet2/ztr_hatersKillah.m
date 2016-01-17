function [x, str] = str_hatersKillah(numpart,tx,ty,gx,gy)

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
