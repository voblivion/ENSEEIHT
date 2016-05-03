clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture de l'image originale I :
I = double(imread('Barbara.png')); 
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
lambda = 0.01;
epsilon = 0.01;
nb_iterations = 50;
pas_affichage = 1;
gamma = 1;
eta = 64;

% Operateur gradient :
N = nb_lignes * nb_colonnes;
Dx = - speye(N) + spdiags(ones(N, 1), nb_lignes, N, N);
Dx((nb_colonnes-1)*nb_lignes+1:N, :) = zeros(length((nb_colonnes-1)*nb_lignes+1:N), N);
Dy = - speye(N) + spdiags(ones(N, 1), 1, N, N);
Dy(nb_lignes:nb_lignes:N, :) = zeros(length(nb_lignes:nb_lignes:N), N);

% Second membre du systeme :
sm = lambda * I;

% Frequences en x et en y (axes = repere matriciel) :
[n_x,n_y] = meshgrid(1:nb_lignes,1:nb_colonnes);
n_x = n_x - nb_lignes*0.5;		% Frequences dans l'intervalle [-0.5,0.5]
n_y = n_y - nb_colonnes*0.5;

% Filtrage passe-bas :
Phi_b = eta ./ (n_x.^2 + n_y.^2 + eta);

% Resolution iterative (cf. exercice_2 du TP8) :
C = I;
for ii = 1:nb_iterations

	% Calcul de la matrice W (poids) :
	W = spdiags(1 ./ sqrt(epsilon + (Dx*C(:)).^2 + (Dy*C(:)).^2), 0, N, N);

	% Resolution du systeme :
    grad = gamma * (lambda*real(ifft2(ifftshift(Phi_b.*(fftshift(fft2(C)) - fftshift(fft2(I)))))) - reshape((- Dx'*W*Dx - Dy'*W*Dy) * C(:), nb_lignes, nb_colonnes));
	C = C - grad;
    T = I - C;

	% Affichage de C et T toutes les pas_affichage iterations :
    % Affichage de T :
    subplot(1,3,2);
    imagesc(C);
    axis equal;
    axis off;
    colormap gray;
    title('Cartoon','FontSize',20);
    subplot(1,3,3);
    
    imagesc(T);
    axis equal;
    axis off;
    colormap gray;
    title('Texture','FontSize',20);
    pause(0.1);
end

