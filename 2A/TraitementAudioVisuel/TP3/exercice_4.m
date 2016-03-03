clear;
close all;
load exercice_3;
load texture;

I_max = 255;

% Simulation de flammes :
% figure('Name','Simulation d''une flamme de bougie','Position',[0.33*L,0,0.67*L,H]);
% [nb_lignes_texture,nb_colonnes_texture] = size(texture);
% L = 1000;				% Largeur de l'image
% echelle_en_largeur = 0.5*L/(limites(4)-limites(3));
% H = 1000;				% Hauteur de l'image
% h = round(0.85*H);			% Hauteur de la flamme
% y = 0:1/(h-1):1;			% Ordonnees normalisees entre 0 et 1
% x_centre = (beta_0+gamma_0)/2;	% Abscisse du centre de la flamme
% N = 40;				% Longueur de la sequence simulee
% for k = 1:N
%	I = zeros(H,L);
%	delta_aleatoire = ...
%	x_gauche = ...
%	x_droite = ...
%
%	if ...				% Verifier que les bords de la silhouette ne se croisent pas
%		for j = 1:h
%			num_ligne_texture = round((nb_lignes_texture*(h-j)+j-1)/(h-1));
%			num_colonne_image_min = floor(L/2+echelle_en_largeur*(x_gauche(j)-x_centre));
%			num_colonne_image_max = ceil(L/2+echelle_en_largeur*(x_droite(j)-x_centre));
%			largeur_flamme = num_colonne_image_max-num_colonne_image_min;
%			for num_colonne_image = max(num_colonne_image_min,1):min(num_colonne_image_max,L)
%				colonne_texture = round((num_colonne_image-num_colonne_image_min)*(nb_colonnes_texture-1)/largeur_flamme+1);
%				I(j,num_colonne_image) = round(texture(num_ligne_texture,colonne_texture)*I_max);
%			end
%		end
%		imagesc(I);
%		axis xy;
%		axis off;
%		colormap(hot);		% Table de couleurs donnant des couleurs chaudes (doc colormap)
%		pause(0.1);
%	end
% end
