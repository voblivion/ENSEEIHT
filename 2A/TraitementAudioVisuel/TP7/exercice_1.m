clear; 
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres a modifier :
sigma = 10;				% Parametre du filtrage gaussien
T = ceil(3*sigma);			% Taille du noyau gaussien

% Image a segmenter :
I = imread('coins.png');
[nb_lignes,nb_colonnes,nchannels] = size(I);
if nchannels==3 			% Si l'image est RGB, on la convertit en niveaux de gris
	I = rgb2gray(I); 
end
I_max = max(double(I(:)));
I = double(I)/I_max;

% Affichage de l'image a segmenter :
figure('Name','Caracteristiques de l''image d''origine','Position',[0,0.5*H,L,0.37*H]);
subplot(1,3,1);
imagesc(I);
colormap gray;
axis equal;
axis off;
axis xy;
title('Image d''origine','FontSize',15);

% Calcul de l'energie externe Eext :
[Gx, Gy] = gradient(I);
Eext = -(Gx.^2 + Gy.^2);

% Calcul du gradient (Fx,Fy) de Ext :
[Fx, Fy] = gradient(Eext);

% Affichage de l'energie externe :
subplot(1,3,2);
imagesc(Eext);
colormap gray;
axis equal;
axis off;
axis xy;
title('Energie externe','FontSize',15);

% Affichage du champ de forces externes :
pas_fleches = 4;
taille_fleches = 4;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_quiver = Fx(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_quiver = Fy(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
subplot(1,3,3);
hold on;
imagesc(I);
colormap gray;
hq = quiver(x,y,Fx_quiver,Fy_quiver,taille_fleches);
set(hq,'LineWidth',1);
set(hq,'Color',[1,0,0]);
axis equal;
axis off;
axis xy;
title('Champ de forces externes','FontSize',15);

% Idem avec pre-filtrage :
% Noyau Gaussien
G = fspecial('gaussian', [T T], sigma);

% Calcul de l'energie externe Eext :
[Gx, Gy] = gradient(conv2(I, G, 'same'));
Eext = -(Gx.^2 + Gy.^2);

% Calcul du gradient (Fx,Fy) de Ext :
[Fx, Fy] = gradient(Eext);

% Affichage de l'energie externe :
subplot(1,3,2);
imagesc(Eext);
colormap gray;
axis equal;
axis off;
axis xy;
title('Energie externe','FontSize',15);

% Affichage du champ de forces externes :
pas_fleches = 4;
taille_fleches = 4;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_quiver = Fx(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_quiver = Fy(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
subplot(1,3,3);
hold on;
imagesc(I);
colormap gray;
hq = quiver(x,y,Fx_quiver,Fy_quiver,taille_fleches);
set(hq,'LineWidth',1);
set(hq,'Color',[1,0,0]);
axis equal;
axis off;
axis xy;
title('Champ de forces externes','FontSize',15);
