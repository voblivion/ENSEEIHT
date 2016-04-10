clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Variance du bruit additif gaussien :
sigma_bruit = 0.1;

% Poids du terme d'attache aux donnees :
lambda = 0.025;				

% Parametre pour garantir la differentiabilite de la norme TV :
epsilon = 0.01;

% Nombre d'iterations de point fixe :
nb_iterations = 20;

% Niveau de gris maximal :
I_max = 255;

% Lecture de l'image :
u0 = imread('cameraman.tif');
[nb_lignes,nb_colonnes,nb_canaux] = size(u0);
u0 = double(u0);

% Ajout d'un bruit gaussien :
u0 = u0 + sigma_bruit*I_max*randn(nb_lignes,nb_colonnes);

% Affichage de l'image corrompue :
figure('Name','Debruitage par variation totale','Position',[0,0,L,0.67*H]);
subplot(1,2,1);
imagesc(max(0,min(1,u0/I_max)),[0 1]);
colormap gray;
axis equal;
axis off;
axis ij;
title('Image originale','FontSize',20);

% Affichage de l'image restauree initiale :
subplot(1,2,2);
imagesc(max(0,min(1,u0/I_max)),[0 1]);
colormap gray;
axis equal;
axis off;
axis ij;
title('Image restauree','FontSize',20);

% Calcul de Dx, Dy, Lap et b (cf. exercice 1) :
N = nb_lignes * nb_colonnes;
Dx = - speye(N) + spdiags(ones(N, 1), nb_lignes, N, N);
Dx((nb_colonnes-1)*nb_lignes+1:N, :) = zeros(length((nb_colonnes-1)*nb_lignes+1:N), N);
Dy = - speye(N) + spdiags(ones(N, 1), 1, N, N);
Dy(nb_lignes:nb_lignes:N, :) = zeros(length(nb_lignes:nb_lignes:N), N);
b = lambda * u0(:);

% Initialisation de l'algorithme de point fixe :
u = u0;

% Iterations de point fixe :
for it = 1:nb_iterations

	% Calcul de la matrice W (poids) :
	W = spdiags(1 ./ sqrt(epsilon + (Dx*u(:)).^2 + (Dy*u(:)).^2), 0, N, N);

	% Calcul de la matrice A du systeme :
	A = lambda * speye(N) - (- Dx'*W*Dx - Dy'*W*Dy);

	% Resolution du systeme :
	u = reshape(A\b,nb_lignes,nb_colonnes);
	
	% Affichage :
	subplot(1,2,2);
	imagesc(max(0,min(1,u/I_max)),[0 1]);
	colormap gray;
	axis equal;
	axis off;
	axis ij;
	title(['Image restauree (' num2str(100*it/nb_iterations,'%.0f') ' %)'],'FontSize',20);
	drawnow;
	pause(0.01);

end

