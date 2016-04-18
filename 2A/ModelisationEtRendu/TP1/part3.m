%load part2;
%close all;
clear max;

%% Recherche des composantes connexes
% connex_comps = connexComps(I2);
nbr_connex_comps = max(max(connex_comps));

%% Recherche de l'objet
% Prédicat : l'objet représente la majorité des points de l'image à 1
maximum = 0;
k_max = 0;
for k = 1:nbr_connex_comps
    % Recherche d'un point dans la composante k
    is = find(connex_comps == k);
    [i, j] = ind2sub(size(connex_comps), is(1));
    % Garder cette composante si c'est blanc et "maximal"
    if I2(i, j) == 1 && length(is) > maximum
        maximum = length(is);
        k_max = k;
    end
end

%% Calcul du contours de l'objet
% Recherche d'un point sur le bord de l'objet
is = find(connex_comps == k_max);
[is, js] = ind2sub(size(connex_comps), is);
[i, ind] = min(is);
j = js(ind);
contour = bwtraceboundary(I2, [i, j], 'N');

%% Ajout au contour de celui des composantes connexe du décors interne
for k = 1:nbr_connex_comps
    is = find(connex_comps == k);
    [i, j] = ind2sub(size(connex_comps), is(1));
    if I2(i, j) == 0
        is = i*ones(1, 4);
        js = j*ones(1, 4);
        while is(1) > 1 && connex_comps(is(1)-1, js(1)) == connex_comps(i, j)
            is(1) = is(1) - 1;
        end
        while is(2) < size(connex_comps, 1) && connex_comps(is(2)+1, js(2)) == connex_comps(i, j)
            is(2) = is(2) + 1;
        end
        while js(3) > 1 && connex_comps(is(3), js(3)-1) == connex_comps(i, j)
            js(3) = js(3) - 1;
        end
        while js(4) < size(connex_comps, 2) && connex_comps(is(4), js(4)+1) == connex_comps(i, j)
            js(4) = js(4) + 1;
        end
        % Si la composante touche l'objet
        if is(1) > 1 && connex_comps(is(1)-1, js(1)) == k_max
            contour = [contour; bwtraceboundary(I2, [is(1)-1, js(1)], 'N')]; %#ok<*AGROW>
        elseif is(2) < size(connex_comps, 1) && connex_comps(is(2)+1, js(2)) == k_max
            contour = [contour; bwtraceboundary(I2, [is(2)+1, js(2)], 'N')];
        elseif js(3) > 1 && connex_comps(is(3), js(3)-1) == k_max
            contour = [contour; bwtraceboundary(I2, [is(3), js(3)-1], 'N')];
        elseif js(4) < size(connex_comps, 2) && connex_comps(is(4), js(4)+1) == k_max
            contour = [contour; bwtraceboundary(I2, [is(4)+1, js(4)], 'N')];
        end
    end
end
B = contour;
I3 = zeros(size(I2));
for i = 1:size(B, 1)
    I3(B(i, 1), B(i, 2)) = 1;
end

%% Sous-échantilloner le contour
B = B(1:5:size(B, 1), :);

%% Mettre en noir ce qui n'est pas dans l'objet
for k = 1:nbr_connex_comps
    % Recherche d'un point dans la composante k
    is = find(connex_comps == k);
    [i, j] = ind2sub(size(connex_comps), is(1));
    if I2(i, j) == 1 && k ~= k_max
        I2(is) = 0;
    end
end


imshow(I2);

hold on;
imshow(I3);

% Attention ! x et y <-> j et i
[vx, vy] = voronoi(B(:, 2), B(:, 1));
for i = 1:size(vx, 2)
    x1 = min(max(1, round(vx(1, i))), size(I2, 2));
    x2 = min(max(1, round(vx(2, i))), size(I2, 2));
    y1 = min(max(1, round(vy(1, i))), size(I2, 1));
    y2 = min(max(1, round(vy(2, i))), size(I2, 1));
    if I2(y1, x1) == 0 || I2(y2, x2) == 0
        vx(:, i) = 0;
    end
end
[v, c] = voronoin(B);
vy = vy(:, sum(vx) ~= 0);
vx = vx(:, sum(vx) ~= 0);
plot(vx, vy)
