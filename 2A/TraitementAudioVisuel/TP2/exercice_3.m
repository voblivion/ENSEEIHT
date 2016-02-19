clear;
close all;
load exercice_1;

% Images originales :
numeros_images = 1:nb_postures:n;
nb_images = length(numeros_images);
images_originales = reshape(X(numeros_images,:)',nb_lignes,nb_colonnes,nb_images);

% Definition d'une bande situee au niveau des yeux :
ligne_centrale = 210;
epaisseur_bande = 30;
bande_noire = ligne_centrale-epaisseur_bande:ligne_centrale+epaisseur_bande;

% Mise a 0 des pixels situes a l'interieur de cette bande :
images_degradees = images_originales;
images_degradees(bande_noire,:,:) = 0;

% Calcul des composantes principales des images degradees, puis restauration :
X_degrade = [];
for i = 1:nb_images
    img = images_degradees(:,:,i);
    X_degrade = [X_degrade; double(img(:))'];
end
q = size(W, 2);
Wq = W(:,1:q);
Xdc = X_degrade - repmat(individu_moyen, nb_images, 1);
CP = Xdc*Wq;
X_reconstruit = CP*Wq' + repmat(individu_moyen, nb_images, 1);
images_restaurees = zeros(size(images_degradees));
for i = 1:nb_images
    images_restaurees(:,:,i) = reshape(X_reconstruit(i,:),nb_lignes,nb_colonnes);
end

% Affichage des images originales, degradees et restaurees :
figure('Name','Restauration d''images degradees','Position',[0.33*L,0,0.67*L,H]);
colormap gray;
for i = 1:nb_images
    subplot(3,nb_images,i);
    imagesc(images_originales(:,:,i));
    axis image;
    axis off;
    title(['Image originale ' num2str(i,'%2d')],'FontSize',18);
    subplot(3,nb_images,nb_images+i);
    imagesc(images_degradees(:,:,i));
    axis image;
    axis off;
    title(['Image degradee ' num2str(i,'%2d')],'FontSize',18);
    subplot(3,nb_images,2*nb_images+i);
    imagesc(images_restaurees(:,:,i));
    axis image;
    axis off;
    title(['Image restauree ' num2str(i,'%2d')],'FontSize',18);
end
