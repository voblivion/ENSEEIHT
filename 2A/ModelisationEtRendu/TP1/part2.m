load part1;
close all;

%% Calcul des classes binaires
colors = C(:, 3:5);
idy = kmeans(colors, 2);

%% Calcul de l'image binarisée
I2 = zeros(size(I, 1), size(I, 2));
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        id = idy(idx(i, j));
        I2(i, j) = (id == 1);
    end
end

%% Les points de l'objet sont à 1
% Prédicat : il y a plus de points dans le decors que dans l'objet
idz0 = find(I2 == 0);
idz1 = find(I2 == 1);
if length(idz0) < length(idz1)
    I2 = ~I2;
end

imshow(I2);

save part2;