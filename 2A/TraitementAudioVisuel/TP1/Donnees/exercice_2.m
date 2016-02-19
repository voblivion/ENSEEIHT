clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'une image couleur et decoupage en trois canaux :
I = imread('gantrycrane.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
R = I(:,:,1);
V = I(:,:,2);
B = I(:,:,3);

% Affichage du nuage de pixels dans le repere RVB :
X = [R(:) V(:) B(:)];
n = size(X,1);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0,0,0.33*L,0.45*H]);
plot3(R, V, B, 'b.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Centrage des donnees (changement d'origine du repere) :
X = double(X);
G = mean(X);
Xc = X - repmat(G, n, 1);

% Matrice de variance/covariance :
Sigma = zeros(3);
for i = 1:3
    for j = 1:3
        Sigma(i, j) = mean(Xc(:,i).*Xc(:,j)) - mean(Xc(:,i))*mean(Xc(:,j));
    end
end

% Calcul des valeurs et vecteurs propres de Sigma :
[W, D] = eig(Sigma);

% Inversion de l'ordre des colonnes de W :
W = W(:,3:-1:1);

% Calcul des composantes des pixels dans le nouveau repere :
Z = X*W;
%Z = [];
%for i = 1:n
%    Z = [Z; (W\X(i,:)')'];
%end

% Affichage de l'image couleur et de ses trois composantes principales :
figure('Name','Image couleur et composantes principales','Position',[0.33*L,0,0.67*L,H]);
subplot(2,2,1);
imagesc(I);
axis off;
axis equal;
title('Image couleur','FontSize',20);

% Affichage de la premiere composante principale :
Z1 = reshape(Z(:,1),nb_lignes,nb_colonnes);
subplot(2,2,2);
imagesc(Z1);
colorbar;
colormap(gray);
axis off;
axis equal;
title('Premiere composante principale','FontSize',20);

% Affichage de la deuxieme composante principale :
Z2 = reshape(Z(:,2),nb_lignes,nb_colonnes);
subplot(2,2,3);
imagesc(Z2);
colorbar;
axis off;
axis equal;
colormap(gray);
title('Deuxieme composante principale','FontSize',20);

% Affichage de la troisieme composante principale :
Z3 = reshape(Z(:,3),nb_lignes,nb_colonnes);
subplot(2,2,4);
imagesc(Z3);
colorbar;
axis off;
axis equal;
colormap(gray);
title('Troisieme composante principale','FontSize',20);

% Moyennes, variances et covariances :
Z1bis = Z1(:);		% Permet de "vectoriser" la matrice Z1
Z2bis = Z2(:);
Z3bis = Z3(:);
Zbis = [Z1bis Z2bis Z3bis];
mean_Zbis = mean(Zbis, 1);
VarCov = zeros(3);
for i = 1:3
    for j = 1:3
        VarCov(i, j) = mean(Zbis(:,i).*Zbis(:,j)) - mean(Zbis(:,i))*mean(Zbis(:,j));
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
c_proportions = Var / c
