
%% Parameters
k = 256;
m = 10;
maxiter = 200;

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
J = zeros(size(I));
R_couleurs_classes = floor(255*(1+sin(1:k + 0.1))/2);
V_couleurs_classes = floor(255*(1+sin(1:k + 0.5))/2);
B_couleurs_classes = floor(255*(1+sin(1:k + 0.7))/2);
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        kij = (i-1) * size(I, 2) + j;
        id = idx(kij);
        J(i, j, 1) = floor(C(id, 3));
        J(i, j, 2) = floor(C(id, 4));
        J(i, j, 3) = floor(C(id, 5));
    end
end

%% Affichage des superpixels
subplot(1,2,2);
imagesc(uint8(lab2rgb(J) * 255));
