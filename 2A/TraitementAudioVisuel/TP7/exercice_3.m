clear; 
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres GVF :
mu_GVF = 2; 				% Parametre du modele GVF
gamma_GVF = 0.05; 			% Parametre du modele GVF
nb_iterations_GVF = 500;		% Nombre d'iterations pour le calcul du GVF

% Image a segmenter :
I = imread('coins.png');
[nb_lignes,nb_colonnes,nchannels] = size(I);
if nchannels==3				% Si l'image est RGB, on la convertit en niveaux de gris
	I = rgb2gray(I); 
end
I_max = max(double(I(:)));
I = double(I)/I_max;

% Affichage de l'image a segmenter :
figure('Name','Image a segmenter','Position',[0,0,0.5*L,0.67*H]);
hold on;
imagesc(I);
axis equal;
axis off;
axis xy;
colormap gray;

% Champ de forces externes du modele de base (calcul de Ext, Fx et Fy comme dans l'exo 1) :
% Calcul de l'energie externe Eext sans filtrage:
[Gx, Gy] = gradient(I);
Eext = -(Gx.^2 + Gy.^2);
% Calcul du gradient (Fx,Fy) de Eext avec filtrage:
[Fx, Fy] = gradient(Eext);
% Calcul du gradient (dxE, dyE) de Eext sans filtrage:
[dxE, dyE] = gradient(Eext);
% Norme gradient Eext
norme_gradient_Eext = (dxE.^2 + dyE.^2);

% Affichage du champ de forces externes du modele de base :
pas_fleches = 2;
taille_fleches = 2;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_quiver = Fx(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_quiver = Fy(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
hq = quiver(x,y,Fx_quiver,Fy_quiver,taille_fleches);
set(hq,'LineWidth',1,'Color',[1,0,0]);
title('Champ de forces externes du modele de base','FontSize',15);

% Champ de forces externes du modele GVF (calcul du nouveau potentiel (Fx,Fy)) :
for k = 1:nb_iterations_GVF
    Fx = Fx - gamma_GVF * (norme_gradient_Eext.*(Fx - dxE) - mu_GVF * del2(Fx));
    Fy = Fy - gamma_GVF * (norme_gradient_Eext.*(Fy - dyE) - mu_GVF * del2(Fy));
end


% Affichage de l'image :
figure('Position',[0.5*L,0,0.5*L,0.67*H]);
hold on;
imagesc(I);
colormap gray;
axis equal;
axis off;
axis xy;

% Normalisation du champ :
norme = sqrt(Fx.*Fx+Fy.*Fy); 		% Norme euclidienne du champ de forces externes
Fx_ = Fx./(norme+eps); 
Fy_ = Fy./(norme+eps); 

% Affichage du champ de forces externes du modele GVF :
taille_fleches = 1;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_quiver = Fx_(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_quiver = Fy_(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
hq = quiver(x,y,Fx_quiver,Fy_quiver,taille_fleches);
set(hq,'LineWidth',1,'Color',[1,0,0]);
title('Champ de forces externes du modele GVF','FontSize',15);
