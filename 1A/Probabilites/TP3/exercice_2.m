clear;
close all;

load exercice_1;

% Pour eviter les messages d'avertissement :
warning('off','MATLAB:nchoosek:LargeCoefficient');

% Parametres :
p = alpha/pi;
epsilon = 1e-5;

% Affichage de l'image :
figure('Name','Detection des alignements','Position',[0,0,L,H]);
subplot(1,2,1);
imagesc(Im);
axis equal;
axis off;

% Affichage des alignements :
Im_resultat = ones(size(Im));
subplot(1,2,2);
imagesc(Im_resultat,[0,1]);
axis equal;
axis off;
colormap gray;
drawnow;
hold on;

% Boucle sur les ensembles E :
cpt = 0;
for k = 1:nb_ensembles_E

	% Nuage de points :
	E = liste_ensembles_E(:,:,k);
	indices_non_nuls = find(sum(E,2));
	E = E(indices_non_nuls,:);				% Suppression des lignes [0 0]
	card_E = size(E,1);

	% Centrage du nuage de points :
	centre_nuage = mean(E);
	E_centre = E-ones(card_E,1)*centre_nuage;

	% Matrice d'inertie du nuage de points :
	M = transpose(E_centre)*E_centre;

	% Calcul des valeurs/vecteurs propres de M :
	[V,D] = eig(M);

	% Tri des valeurs propres de M par ordre decroissant :
	[lambda,indices] = sort(diag(D),'descend');

	% Matrice de passage du repere xy vers les axes propres du nuage de points :
	P = V(:,indices);
	petit_axe = P(:,2);

	% Comptage des pixels de E ou le gradient est parallele au petit axe :
	n = 0;
	for l = 1:card_E
		i = E(indices_non_nuls(l),1);
		j = E(indices_non_nuls(l),2);
		produit_scalaire = Gx(i,j)*petit_axe(1)+Gy(i,j)*petit_axe(2);
		if abs(produit_scalaire)>G_norme(i,j)*sqrt(petit_axe(1).^2+petit_axe(2).^2)
			n = n+1;
		end
	end

	% Coordonnees des points du nuage dans le nouveau repere :
	E_centre_nouv = E_centre*P;

	% Dimensions du rectangle englobant :
	x_min_nouv = min(E_centre_nouv(:,1));
	x_max_nouv = max(E_centre_nouv(:,1));
	y_min_nouv = min(E_centre_nouv(:,2));
	y_max_nouv = max(E_centre_nouv(:,2));
	largeur = x_max_nouv-x_min_nouv;
	hauteur = y_max_nouv-y_min_nouv;

	% Nombre de pixels du rectangle englobant :
	N = floor(largeur*hauteur);

	% Calcul de probabilite (loi binomiale) :
	probabilite = 0;
	for l = n:N
		probabilite = probabilite+nchoosek(N,n)*p^l*(1-p)^(N-l);
	end

	% Test de saillance visuelle :
	if probabilite<epsilon

		% Extremites du segment :
		extremites = P*[x_min_nouv x_max_nouv ; 0 0]+transpose(centre_nuage)*ones(1,2);

		% Affichage du segment :
		line(extremites(2,:),extremites(1,:),'Color','k','LineWidth',2);
		drawnow;
	else
		cpt = cpt+1;
	end
end
disp(['Sur ' num2str(nb_ensembles_E) ' ensembles, ' num2str(cpt) ' ont ete elimines']);

