clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Variance du bruit additif gaussien :
sigma_bruit = 0.1;

% Poids du terme d'attache aux donnees :
lambda = 0.025;				

% Niveau de gris maximal :
I_max = 255;

% Lecture de l'image :
u0 = imread('cameraman.tif');
[nb_lignes,nb_colonnes,nb_canaux] = size(u0);
u0 = double(u0);

% Ajout d'un bruit gaussien :
u0 = u0 + sigma_bruit*I_max*randn(nb_lignes,nb_colonnes);

% Affichage de l'image corrompue :
figure('Name','Debruitage de type Tikhonov','Position',[0,0,L,0.67*H]);
subplot(1,2,1);
imagesc(max(0,min(1,u0/I_max)),[0 1]);
colormap gray;
axis equal;
axis off;
axis ij;
title('Image bruitee','FontSize',20);

%
N = nb_lignes * nb_colonnes;

% Calcul de Dx (operateur de derivation selon x) :
Dx = - speye(N) + spdiags(ones(N, 1), nb_lignes, N, N);
Dx((nb_colonnes-1)*nb_lignes+1:N, :) = zeros(length((nb_colonnes-1)*nb_lignes+1:N), N);

% Calcul de Dy (operateur de derivation selon y) :
Dy = - speye(N) + spdiags(ones(N, 1), 1, N, N);
Dy(nb_lignes:nb_lignes:N, :) = zeros(length(nb_lignes:nb_lignes:N), N);

% Calcul de A et b (matrice et second membre du systeme) :
A = lambda * speye(N) - (- Dx'*Dx - Dy'*Dy);
b = lambda * u0(:);

% Resolution du systeme Au = b :
u = reshape(A\b,nb_lignes,nb_colonnes);

% Affichage de l'image restauree :
subplot(1,2,2);
imagesc(max(0,min(1,u/I_max)),[0 1]);
colormap gray;
axis equal;
axis off;
axis ij;
title('Image restauree','FontSize',20);
