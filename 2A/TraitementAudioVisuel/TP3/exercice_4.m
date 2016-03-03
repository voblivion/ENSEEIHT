clear;
close all;
load exercice_3;
load texture;

I_max = 255;

% Simulation de flammes :
figure('Name','Simulation d''une flamme de bougie','Position',[0.33*L,0,0.67*L,H]);
[nb_lignes_texture,nb_colonnes_texture] = size(texture);
L = 1000;				% Largeur de l'image
echelle_en_largeur = 0.5*L/(limites(4)-limites(3));
H = 1000;				% Hauteur de l'image
h = round(0.85*H);			% Hauteur de la flamme
y = 0:1/(h-1):1;			% Ordonnees normalisees entre 0 et 1
x_centre = (beta_0+gamma_0)/2;	% Abscisse du centre de la flamme
N = 400;				% Longueur de la sequence simulee
x_gauche = bezier(y, beta_0, [delta_aleatoire(1:d-1); delta_aleatoire(d+d-1)]);
x_droite = bezier(y, gamma_0, delta_aleatoire(d:d+d-1));
for k = 1:N
	I = zeros(H,L);
    % Moyenne entre flamme précédente et flamme nouvellement calculée de
    % façon a avoir un mouvement fluide de la flamme.
    x_gauche_old = x_gauche;
    x_droite_old = x_droite;
    x_gauche = 1;
    x_droite = -1;
    while any(x_gauche > x_droite)
        delta_aleatoire = delta_moyen + delta_ecart .* randn(2*d-1, 1);
        x_gauche = (x_gauche_old + bezier(y, beta_0, [delta_aleatoire(1:d-1); delta_aleatoire(d+d-1)])) / 2;
        x_droite = (x_droite_old + bezier(y, gamma_0, delta_aleatoire(d:d+d-1))) / 2;
    end

    for j = 1:h
        num_ligne_texture = round((nb_lignes_texture*(h-j)+j-1)/(h-1));
        num_colonne_image_min = floor(L/2+echelle_en_largeur*(x_gauche(j)-x_centre));
        num_colonne_image_max = ceil(L/2+echelle_en_largeur*(x_droite(j)-x_centre));
        largeur_flamme = num_colonne_image_max-num_colonne_image_min;
        for num_colonne_image = max(num_colonne_image_min,1):min(num_colonne_image_max,L)
            colonne_texture = round((num_colonne_image-num_colonne_image_min)*(nb_colonnes_texture-1)/largeur_flamme+1);
            I(j,num_colonne_image) = round(texture(num_ligne_texture,colonne_texture)*I_max);
        end
    end
    imagesc(I);
    axis xy;
    axis off;
    colormap(hot);		% Table de couleurs donnant des couleurs chaudes (doc colormap)
    % pause(0.001);
    drawnow;
end
