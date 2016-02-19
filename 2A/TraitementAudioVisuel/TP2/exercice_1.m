clear;
close all;
load donnees;

% Calcul de l'individu moyen :
individu_moyen = mean(X, 1);

% Centrage des donnees :
Xc = X - repmat(individu_moyen, n, 1);

% Calcul de la matrice Sigma_2 (de taille inferieure a celle de Sigma) :
Sigma_2 = 1/n * Xc*Xc';

% Calcul des vecteurs/valeurs propres de la matrice Sigma_2 :
[V_2,D] = eig(Sigma_2);				% V_2 est de taille n x n

% Calcul des vecteurs propres de Sigma (qui sont les eigenfaces) deduits de ceux de Sigma_2 :
V = Xc'*V_2;				% V est de taille p x n

% Tri par ordre decroissant des valeurs propres de Sigma_2 :
[lambda,indices] = sort(diag(D), 'descend');

% Tri des eigenfaces dans le meme ordre :
W = V(:,indices);

% Comme Sigma_2 est semi-definie positive, ses valeurs propres sont positives ou nulles et la plus petite est egale a 0 :
%W = ...				% W est de taille p x (n-1)

% Normalisation des eigenfaces (les colonnes de V_2 sont unitaires, mais pas celles de V) : :
normes_eigenfaces = sqrt(sum(W.*W));
W = W./repmat(normes_eigenfaces, p, 1);

% Affichage de l'individu moyen et des eigenfaces sous forme de pseudo-images :
figure('Name','Individu moyen et eigenfaces','Position',[0.33*L,0,0.67*L,H]);
colormap gray;
img = reshape(individu_moyen,nb_lignes,nb_colonnes);
subplot(nb_individus,nb_postures,1);
imagesc(img);
axis image;
axis off;
title('Individu moyen','FontSize',15);
for k = 1:n-1
	img = reshape(W(:,k),nb_lignes,nb_colonnes);
	subplot(nb_individus,nb_postures,k+1);
	imagesc(img);
	axis image;
	axis off;
	title(['Eigenface ',num2str(k)],'FontSize',15);
end

save exercice_1;
