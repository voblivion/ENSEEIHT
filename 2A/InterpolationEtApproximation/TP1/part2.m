clear all;

%% Paramètres
% limites des abcisses/ordonnées à générer
mi = 0;
ma = 4;
% pas des abcisses/ordonnées à générer
pas = 0.5;
% Types à générer (tous : 1:4)
types = 4; % seulement Tchebitchev
% précision de l'interpolation (pas de temps pour diviser [0, 1]
pas_t = 0.01;

%% Génération des points à interpoller
% abcisses et en ordonnées de la génération
dxy = mi:pas:ma;
n = size(dxy, 2);
% création de la surface
g = grille(dxy, dxy);
figure
hold on
surf(g(:,:,1), g(:,:,2), g(:,:,3));
view(17, 42)
pause

%% Génération de la surface selon différentes répartition temporrelles
% temps de la surface à générer
ups = 0:pas_t:1;
m = size(ups, 2);
for type = types
    tmp = zeros(n, m, 3);
    for i = 1:n
        X = g(i,:,1);
        Y = g(i,:,2);
        Z = g(i,:,3);
        P = [X; Y; Z];
        tps = temps(P, type);
        if i == 1
            disp('i');
            disp(P);
            disp(tps);
        end
        res = Neville(P, tps, ups);
        tmp(i,:,1) = res(1,:);
        tmp(i,:,2) = res(2,:);
        tmp(i,:,3) = res(3,:);
    end
    pts = zeros(m, m, 3);
    for j = 1:m
        X = tmp(:,j,1)';
        Y = tmp(:,j,2)';
        Z = tmp(:,j,3)';
        P = [X; Y; Z];
        tps = temps(P, type);
        if j == 1
            disp('j');
            disp(P);
            disp(tps);
        end
        res = Neville(P, tps, ups);
        pts(:,j,1) = res(1,:);
        pts(:,j,2) = res(2,:);
        pts(:,j,3) = res(3,:);
    end
    view(17, 42)
    surf(pts(:,:,1),pts(:,:,2),pts(:,:,3));
    if type ~= 4
        pause
    end
    hold off
end
