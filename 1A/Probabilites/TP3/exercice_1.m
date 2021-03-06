clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Pour eviter les messages d'avertissement :
set(0,'RecursionLimit',1000);

% Parametres :
S = 0.1;			% Seuil sur la norme du gradient
alpha = deg2rad(10);		% Seuil sur l'orientation du gradient (en radians)
cos_alpha = cos(alpha);

% Lecture de l'image :
fichier_image = 'Images/Morlaix.png';
%fichier_image = 'Images/Piree.png';
Im = imread(fichier_image);

% Image aleatoire tiree selon une loi uniforme :
%Im = uint8(255*rand(128));

% Valeurs limites du cardinal de E :
nb_lignes = size(Im,1);
nb_colonnes = size(Im,2);
diagonale = floor(sqrt(nb_lignes^2+nb_colonnes^2));
card_min = floor(diagonale/20);
card_max = floor(diagonale/4);

% Conversion en niveaux de gris si necessaire :
if size(Im,3)==3
	Im = rgb2gray(Im);
end

% Normalisation des niveaux de gris entre 0 et 1 :
Im = double(Im);
Im = Im/max(Im(:));

% Gradient du niveau de gris  (x vers le bas, y vers la droite) :
Gx = zeros(size(Im));
Gx(2:end-1,:) = 0.5*(Im(3:end,:)-Im(1:end-2,:));	% Differences finies centrees
Gx(1,:) = Im(2,:)-Im(1,:);				% Premiere ligne
Gx(end,:) = Im(end,:)-Im(end-1,:);						% Derniere ligne

Gy = zeros(size(Im));
Gy(:,2:end-1) = 0.5*(Im(:,3:end)-Im(:,1:end-2));	% Differences finies centrees
Gy(:,1) = Im(:,2)-Im(:,1);						% Premiere colonne
Gy(:,end) = Im(:,end)-Im(:,end-1);    					% Derniere colonne

% Norme du gradient :
G_norme = sqrt(Gx.^2+Gy.^2);

% Pixels a traiter (ou la norme du gradient est elevee) :
contour = G_norme>S;
indices_contour = find(contour>0);

% Boucle de traitement des pixels de contour :
liste_ensembles_E = [];
nb_ensembles_E = 0;
while length(indices_contour)>0

	% Creation d'un nouvel ensemble de pixels de contour connexes :
	E = zeros(card_max,2);		% Contient au plus card_max pixels
	card_E = 0;

	% Tri des pixels non encore traites selon la norme du gradient :
	G_norme_contour = G_norme(indices_contour);
	[valeurs_triees_G_norme_contour,indices] = sort(G_norme_contour,'descend');

	% Initialisation de E par le pixel ayant la norme du gradient la plus elevee :
	indice_germe = indices_contour(indices(1));
	[i_germe,j_germe] = ind2sub(size(Im),indice_germe);
	contour(i_germe,j_germe) = 0;
	card_E = card_E+1;
	E(card_E,:) = [i_germe j_germe];
        

	% Concatenation des pixels connexes au germe, de gradient parallele (a alpha pres) :
	[E,card_E,contour] = recursion(E,card_E,contour,i_germe,j_germe,Gx,Gy,G_norme,card_max,cos_alpha);

	% Ajout de l'ensemble E a la liste d'ensembles E, si son cardinal est superieur a card_min :
	if card_E>=card_min
		nb_ensembles_E = nb_ensembles_E+1;
		liste_ensembles_E = reshape([liste_ensembles_E(:) ; E(:)],card_max,2,nb_ensembles_E);
	end

	% Mise a jour des pixels a traiter :
	indices_contour = find(contour>0);
end

% Affichage de l'image :
figure('Name','Ensembles de pixels voisins ayant des gradients paralleles','Position',[0,0,L,H]);
subplot(1,2,1);
imagesc(Im);
axis equal;
axis off;
colormap gray;

% Affichage des ensembles E (fonction label2rgb) :
etiquettes = zeros(size(Im));				% On attribue une etiquette a chaque ensemble E
for k = 1:nb_ensembles_E
	E = liste_ensembles_E(:,:,k);
	indices_non_nuls = find(sum(E,2));
	E = E(indices_non_nuls,:);					% Suppression des lignes [0 0]
	for l = 1:length(indices_non_nuls)
		i = E(indices_non_nuls(l),1);
		j = E(indices_non_nuls(l),2);
		etiquettes(i,j) = k;
	end
end
Im_resultat = label2rgb(etiquettes,'jet',[.5 .5 .5]);	% Chaque ensemble E recoit une couleur
subplot(1,2,2);
imagesc(Im_resultat);
axis equal;
axis off;

save exercice_1;
