clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

eta = 64;

% Lecture de l'image originale I :
I = double(imread('Barbara.png'));
[nb_lignes,nb_colonnes] = size(I);

% Affichage de l'image originale :
figure('Name','Filtrage frequentiel','Position',[0,0,L,H]);
subplot(2,3,1);
imagesc(I);
axis equal;
axis off;
colormap gray;
title('Image originale','FontSize',20);

% Spectre de I :
S = fft2(I);
S = fftshift(S);			% Permet de positionner l'origine (n_x,n_y) = (0,0) au centre

% Affichage du logarithme du module du spectre de I :
subplot(2,3,4);
imagesc(log(abs(S)));
axis equal;
axis off;
colormap gray;
title('Spectre','FontSize',20);

% Frequences en x et en y (axes = repere matriciel) :
[n_x,n_y] = meshgrid(1:nb_lignes,1:nb_colonnes);
n_x = n_x - nb_lignes*0.5;		% Frequences dans l'intervalle [-0.5,0.5]
n_y = n_y - nb_colonnes*0.5;

% Filtrage passe-bas :
Phi_b = eta ./ (n_x.^2 + n_y.^2 + eta);

% Affichage du logarithme du module du spectre de C :
subplot(2,3,5);
imagesc(log(abs(S.*Phi_b)));
axis equal;
axis off;
colormap gray;
title('Basses frequences','FontSize',20);

% Affichage de C :
C = real(ifft2(ifftshift(S.*Phi_b)));
subplot(2,3,2);
imagesc(C);
axis equal;
axis off;
colormap gray;
title('Cartoon','FontSize',20);

% Filtrage passe-haut :
Phi_h = 1 - Phi_b;

% Affichage du logarithme du module du spectre de T :
subplot(2,3,6);
imagesc(log(abs(S.*Phi_h)));
axis equal;
axis off;
colormap gray;
title('Hautes frequences','FontSize',20);

T = real(ifft2(ifftshift(S.*Phi_h)));
subplot(2,3,3);
imagesc(T);
axis equal;
axis off;
colormap gray;
title('Texture','FontSize',20);
