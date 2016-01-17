clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'une image interne a Matlab :
I_max = 255;
I_min = 0;
I = imread('cameraman.tif');
[nb_lignes,nb_colonnes] = size(I);
I = double(I);

% Affichage de l'image :
figure('Name','Exemple d''image interne a Matlab','Position',[0,0,0.33*L,0.3*L]);
imagesc(I);
axis off;
axis equal;
colormap(gray);

% Affichage de l'histogramme de l'image :
histogramme = hist(I(:),[I_min:I_max]);
figure('Name','Histogramme des niveaux de gris','Position',[0.33*L,0,0.33*L,0.3*L]);
plot([I_min:I_max],histogramme);
axis([I_min I_max 0 1.1*max(histogramme)]);
xlabel('Niveau de gris');
ylabel('Frequence');

% Vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels :
% A DECOMMENTER/COMPLETER
I_gauche = I(1:1:size(I,1),1:1:size(I,2)-1);
I_gauche = I_gauche(:);			% Vectorisation de la matrice I_gauche
I_droite = I(1:1:size(I,1),2:1:size(I,2));
I_droite = I_droite(:);

% Affichage des paires de niveaux de gris sous la forme d'un nuage de points :
% A DECOMMENTER
figure('Name','Mise en evidence de la correlation entre pixels voisins','Position',[0.66*L,0,0.33*L,0.3*L]);
plot(I_gauche,I_droite,'b+');
xlabel('Niveau de gris du pixel de gauche');
ylabel('Niveau de gris du pixel de droite');
axis equal;
axis([I_min I_max I_min I_max]);
hold on;

% Calcul du coefficient de correlation lineaire : A DECOMMENTER/COMPLETER
moyenne_abscisses = mean(I_gauche)
moyenne_ordonnees = mean(I_droite)
variance_abscisses = sqrt(mean(I_gauche.*I_gauche)-moyenne_abscisses*moyenne_abscisses)
variance_ordonnees = sqrt(mean(I_droite.*I_droite)-moyenne_ordonnees*moyenne_ordonnees)
S = I_gauche+I_droite;
covariance = mean(I_gauche.*I_droite)-moyenne_abscisses*moyenne_ordonnees
coefficient_correlation = covariance/(variance_abscisses*variance_ordonnees)
a = covariance/(variance_abscisses*variance_abscisses)
b = -a*moyenne_abscisses+moyenne_ordonnees

% Affichage de la droite de regression (d'equation y = a*x+b) :
% A DECOMMENTER
x = I_min:I_max;
y = a*x+b;
plot(x,y,'r','LineWidth',2);
