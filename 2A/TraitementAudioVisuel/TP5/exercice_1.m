clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture de l'image originale :
I_RVB = imread('Images/bateau.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(I_RVB);
i0 = (nb_lignes-1)/2+1;
j0 = (nb_colonnes-1)/2+1;
valeurs_x = [1:nb_colonnes]-j0;
valeurs_y = [1:nb_lignes]-i0;

% Affichage de l'image originale :
figure('Name','Image originale et image de contours','Position',[0.5*L,0,0.5*L,H]);
subplot(2,1,1);
imagesc(valeurs_x,valeurs_y,I_RVB);
axis equal;
axis off;
set(gca,'FontSize',20);
title('Image originale','Interpreter','Latex');

% Calcul et affichage de l'image (binaire) de contours :
I = rgb2gray(I_RVB);
I_contours = edge(I,'canny');
subplot(2,1,2);
imagesc(valeurs_x,valeurs_y,I_contours);
axis equal;
axis off;
colormap gray;
set(gca,'FontSize',20);
title('Image de contours','Interpreter','Latex');

% Detection et comptage des pixels de contour :
indices_pixels_contour = find(I_contours>0);
nb_pixels_contours = length(indices_pixels_contour);

% Transformation de Hough :
d = ceil(sqrt((nb_lignes-1)^2+(nb_colonnes-1)^2)/2);
valeurs_rho = -d:d;
N_rho = length(valeurs_rho);
valeurs_theta = 0:179;
valeurs_theta = valeurs_theta*pi/180;
N_theta = length(valeurs_theta);
C = zeros(N_rho,N_theta);
[n, m] = size(I_contours);
for k = 1:nb_pixels_contours
    [y, x] = ind2sub(size(I_contours), indices_pixels_contour(k));
    x = round(x - nb_colonnes / 2);
    y = round(y - nb_lignes / 2);
	for j = 1:180
        theta = valeurs_theta(j);
        rho = round(x*cos(theta)+y*sin(theta));
        if -d < rho && rho < d
            i = rho + d + 1;
            C(i, j) = C(i, j) + 1;
        end
    end
end

% Affichage de la matrice C sous la forme d'une pseudo-image :
figure('Name','Pseudo-image des compteurs de votes','Position',[0,0,0.5*L,0.5*H]);
imagesc(valeurs_theta,valeurs_rho,C);
colormap gray;
xlabel('$\theta$ (en radians)','FontSize',20,'Interpreter','Latex');
ylabel('$\rho$ (en pixels)','FontSize',20,'Interpreter','Latex');
set(gca,'FontSize',15);
set(gca,'XTick',valeurs_theta(1):valeurs_theta(end));
set(gca,'YTick',[fliplr([0:-floor(d/5):-d]) [floor(d/5):floor(d/5):d]]);

save exercice_1;
