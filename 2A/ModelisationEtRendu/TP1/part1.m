clear;
close all;

%% Parameters
k = 256;
m = 10;
maxiter = 100;

%% Chargement des données
I = imread('images/D018.ppm');
I = double(I);

%% Affichage de l'image originale
f = figure('Name', 'Superpixels');
subplot(1,2,1);
imagesc(uint8(I));
pause(0.1);
I = rgb2lab(I / 255);

%% Calcul des superpixels
[idx, C] = superpixels(I, k, m, maxiter);

%% Calcul de l'image issue des superpixels
I1 = zeros(size(I));
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        id = idx(i, j);
        I1(i, j, 1) = floor(C(id, 3));
        I1(i, j, 2) = floor(C(id, 4));
        I1(i, j, 3) = floor(C(id, 5));
    end
end

%% Affichage des superpixels
subplot(1,2,2);
imagesc(uint8(lab2rgb(I1) * 255));

save part1;
