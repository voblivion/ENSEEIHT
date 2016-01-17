clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage de l'image originale apres traversee du filtre de Bayer :
image_originale = imread('image_originale.png');
[nb_lignes nb_colonnes,nb_canaux] = size(image_originale);
figure('Name','Image originale apres traversee du filtre de Bayer','Position',[0,0,0.33*L,0.3*L]);
imagesc(image_originale);
axis off;
axis equal;

% Conversion en doubles :
image_originale = double(image_originale);

% Initialisation de l'image RVB :
image_RVB = zeros(nb_lignes/2,nb_colonnes/2,nb_canaux);

% Ecriture du canal R :
% A DECOMMENTER/COMPLETER
% image_RVB(:,:,1) = ...

% Ecriture du canal V :
% A DECOMMENTER/COMPLETER
% image_RVB(:,:,2) = ...

% Ecriture du canal B :
% A DECOMMENTER/COMPLETER
% image_RVB(:,:,3) = ...

% Affichage de l'image RVB convertie en entiers non signes :
% A DECOMMENTER
% figure('Name','Image originale convertie en RVB','Position',[0.33*L,0,0.33*L,0.3*L]);
% imagesc(uint8(image_RVB));
% axis off;
% axis equal;
