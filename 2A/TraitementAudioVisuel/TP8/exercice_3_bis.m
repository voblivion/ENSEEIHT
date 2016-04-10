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
u0 = imread('fleur.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(u0);
u0 = double(u0);

% Ajout d'un bruit gaussien :
u0 = u0 + sigma_bruit*I_max*randn(nb_lignes,nb_colonnes, 3);
u0r = u0(:, :, 1);
u0v = u0(:, :, 2);
u0b = u0(:, :, 3);

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
br = lambda * u0r(:);
bv = lambda * u0v(:);
bb = lambda * u0b(:);

% Initialisation de l'algorithme de point fixe :
u = u0;
ur = u0r;
uv = u0v;
ub = u0b;

% Iterations de point fixe :
for it = 1:nb_iterations

	% Calcul de la matrice W (poids) :
	Wr = spdiags(1 ./ sqrt(epsilon + (Dx*ur(:)).^2 + (Dy*ur(:)).^2), 0, N, N);
	Wv = spdiags(1 ./ sqrt(epsilon + (Dx*uv(:)).^2 + (Dy*uv(:)).^2), 0, N, N);
	Wb = spdiags(1 ./ sqrt(epsilon + (Dx*ub(:)).^2 + (Dy*ub(:)).^2), 0, N, N);

	% Calcul de la matrice A du systeme :
	Ar = lambda * speye(N) - (- Dx'*Wr*Dx - Dy'*Wr*Dy);
	Av = lambda * speye(N) - (- Dx'*Wv*Dx - Dy'*Wv*Dy);
	Ab = lambda * speye(N) - (- Dx'*Wb*Dx - Dy'*Wb*Dy);

	% Resolution du systeme :
	ur = reshape(Ar\br,nb_lignes,nb_colonnes);
	uv = reshape(Av\bv,nb_lignes,nb_colonnes);
	ub = reshape(Ab\bb,nb_lignes,nb_colonnes);
	
	% Affichage :
    u(:,:,1) = ur;
    u(:,:,2) = uv;
    u(:,:,3) = ub;
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

