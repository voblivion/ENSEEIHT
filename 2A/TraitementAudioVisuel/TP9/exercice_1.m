clear;
close all;

load exercice_0;

% Operateurs de derivation Dx, Dy et laplacien (cf. TP8) :
nb_pixels_i = nb_lignes_i*nb_colonnes_i;
N = nb_pixels_i;
Dx = - speye(N) + spdiags(ones(N, 1), nb_lignes_i, N, N);
Dx((nb_colonnes_i-1)*nb_lignes_i+1:N, :) = zeros(length((nb_colonnes_i-1)*nb_lignes_i+1:N), N);
Dy = - speye(N) + spdiags(ones(N, 1), 1, N, N);
Dy(nb_lignes_i:nb_lignes_i:N, :) = zeros(length(nb_lignes_i:nb_lignes_i:N), N);
Lx = -Dx'*Dx;
Ly = -Dy'*Dy;
Lap = Lx + Ly;

% Indices des pixels du bord de l'imagette i :
bord_i = [2:nb_lignes_i-1];					% Bord gauche
bord_i = [bord_i nb_pixels_i-nb_lignes_i+2:nb_pixels_i-1];	% Bord droit
bord_i = [bord_i 1:nb_lignes_i:nb_pixels_i-nb_lignes_i+1];	% Bord superieur
bord_i = [bord_i nb_lignes_i:nb_lignes_i:nb_pixels_i];		% Bord inferieur
bord_i = transpose(bord_i);

% Calcul de l'imagette resultat r :
r = i;
for canal = 1:nb_canaux
	canal_s = double(s(:,:,canal));
	canal_r = double(r(:,:,canal));
    
    Grx = Dx*canal_r(:);
    Gry = Dy*canal_r(:);
    Gsx = Dx*canal_s(:);
    Gsy = Dy*canal_s(:);
    Grx(indices) = Gsx(indices);
    Gry(indices) = Gsy(indices);

	% Second membre de l'equation de Poisson :
	bc = -Dx'*Grx -Dy'*Gry;
    
	% Imagette resultat dans le canal courant :
	uc = Lap\bc;

	% Choix d'une constante d'integration :
    lambda = mean(canal_r(bord_i)) - mean(uc(bord_i));
	r(:,:,canal) = reshape(uc, size(r, 1), size(r, 2)) + lambda;
end

% Calcul et affichage de l'image resultat R :
R = C;
R(y_i_min:y_i_max,x_i_min:x_i_max,:) = r;
figure('Name','Image resultat (Poisson + Neumann)','Position',[0,0,L,H]);
imagesc(R);
axis equal;
axis off;
