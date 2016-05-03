clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture de l'image originale I :
I = double(imread('empreinte.png')); 
[nb_lignes,nb_colonnes] = size(I);

% Affichage de l'image originale :
figure('Name','Decomposition cartoon+texture par le modele ROF','Position',[0,0,L,0.5*H]);
subplot(1,3,1);
imagesc(I);
axis equal;
axis off;
colormap gray;
title('Image originale','FontSize',20);

% Parametres a regler :
lambda = 0.15;
epsilon = 0.01;
nb_iterations = 30;
pas_affichage = 1;
seuil = 3;

% Operateur gradient :
N = nb_lignes * nb_colonnes;
Dx = - speye(N) + spdiags(ones(N, 1), nb_lignes, N, N);
Dx((nb_colonnes-1)*nb_lignes+1:N, :) = zeros(length((nb_colonnes-1)*nb_lignes+1:N), N);
Dy = - speye(N) + spdiags(ones(N, 1), 1, N, N);
Dy(nb_lignes:nb_lignes:N, :) = zeros(length(nb_lignes:nb_lignes:N), N);

% Second membre du systeme :
sm = lambda * I;

% Resolution iterative (cf. exercice_2 du TP8) :
C = I;
for ii = 1:nb_iterations

	% Calcul de la matrice W (poids) :
	W = spdiags(1 ./ sqrt(epsilon + (Dx*C(:)).^2 + (Dy*C(:)).^2), 0, N, N);

	% Calcul de la matrice A du systeme :
	A = lambda * speye(N) - (- Dx'*W*Dx - Dy'*W*Dy);

	% Resolution du systeme :
	C = reshape(A\sm(:), nb_lignes, nb_colonnes);
    T = I - C;

	% Affichage de C et T toutes les pas_affichage iterations :
    subplot(1,3,2);
    imagesc(T);
    axis equal;
    axis off;
    colormap gray;
    title('Texture','FontSize',20);
    
    S = T > seuil;
    subplot(1,3,3);
    imagesc(S);
    axis equal;
    axis off;
    colormap gray;
    title('Seuillé','FontSize',20);
    pause(0.1);
end

