clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage d'une image couleur :
I = imread('autumn.tif');
% I = I(75:110,133:190,:); % Pour ne sélectionner que l'arbre qui "disparait"
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
figure('Name','Image couleur et canaux RVB','Position',[0.33*L,0,0.67*L,H]);
subplot(2,2,1);
imagesc(I);
axis off;
axis equal;
title('Image couleur','FontSize',20);

% Affichage du canal rouge :
R = I(:,:,1);
subplot(2,2,2);
imagesc(R);
colormap(gray);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal vert :
V = I(:,:,2);
subplot(2,2,3);
imagesc(V);
colormap(gray);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal bleu :
B = I(:,:,3);
subplot(2,2,4);
imagesc(B);
colormap(gray);
axis off;
axis equal;
title('Canal B','FontSize',20);

% Moyennes, variances et covariances :
R_doubles = double(R(:));	% Permet de "vectoriser" la matrice R et de la convertir au format double
V_doubles = double(V(:));
B_doubles = double(B(:));
X = [R_doubles V_doubles B_doubles];
X_mean = mean(X, 1);
VarCov = zeros(3);
for i = 1:3
    for j = 1:3
        VarCov(i, j) = mean(X(:,i).*X(:,j)) - mean(X(:,i))*mean(X(:,j));
    end
end

% Coefficients de correlation lineaire :
Cor = zeros(3);
for i = 1:3
    for j = 1:3
        Cor(i, j) = VarCov(i, j) / sqrt(VarCov(i, i) * VarCov(j, j));
    end
end

% Proportions de contraste :
Var = diag(VarCov);
c = sum(Var);
c_proportions = Var / c;
