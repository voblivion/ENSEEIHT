clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

couleurs = [0 0.1250 1.0 ; 0.1750 1.0 0.2250 ; 1.0 1.0 0 ; 1.0 0.3750 0 ; 0.85 0 0 ; 0.5 0 0.3 ; 0.5 0.5 0.1];

% Parametres de la methode de segmentation :
T_0 = 1.0;
q_max = 150;
alpha = 0.99;
beta = 1.0;
intervalle_entre_affichages = 10;
temps_affichage = 0.5;

% Lecture et affichage de l'image d'origine :
I = imread('Images/image.bmp');
I = double(I);
[nb_lignes,nb_colonnes] = size(I);
figure('Name','Image a segmenter','Position',[0,0,0.33*L,0.3*L]);
imagesc(I);
axis equal;
axis off;
colormap gray;

% Apprentissage des parametres des classes de pixels :
N = 6;
disp(['Selectionnez ' num2str(N) ' echantillons']);
moyennes_ecarts_types = estimation(I,N,couleurs);

% Permutation des classes pour pouvoir calculer le pourcentage de bonnes classifications :
[valeurs,indices] = sort(moyennes_ecarts_types(:,1),'ascend');
moyennes_ecarts_types = moyennes_ecarts_types(indices,:);
couleurs = couleurs(indices,:);

% Initialisation aleatoire des classes :
k = zeros(nb_lignes,nb_colonnes);
for i = 1:nb_lignes
	for j = 1:nb_colonnes
		k(i,j) = ceil(rand*N);
	end
end

% Affichage des classes :
couleurs_classes = zeros(nb_lignes,nb_colonnes,3);
for i = 1:nb_lignes
	for j = 1:nb_colonnes
		couleurs_classes(i,j,:) = couleurs(k(i,j),:);
	end
end
figure('Name',['Segmentation en ' num2str(N) ' regions'],'Position',[0.33*L,0,0.33*L,0.3*L]);
imagesc(couleurs_classes);
axis equal;
axis off;
pause(temps_affichage);

% Boucle du recuit simule :
% T = T_0;
% for q = 1:q_max
%	...
%	if rem(q,intervalle_entre_affichages)==0
%		for i = 1:nb_lignes
%			for j = 1:nb_colonnes
%				couleurs_classes(i,j,:) = couleurs(k(i,j),:);
%			end
%		end
%		imagesc(couleurs_classes);
%		axis equal;
%		axis off;
%		title(['Pas ' num2str(q) '/' num2str(q_max)]);
%		pause(temps_affichage);
%	end
%	T = alpha*T;
% end

% Calcul du pourcentage de pixels correctement classes :
load classification_OK;
pixels_correctement_classes = find(k==y2);
disp(['Pixels correctement classes : ' num2str(100*length(pixels_correctement_classes(:))/(nb_lignes*nb_colonnes),'%.2f') ' %']);
