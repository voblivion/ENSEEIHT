clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage d'une image du Toulouse Vanishing Points Dataset :
I_RVB = imread('Images/interieur.jpg');
figure('Name','Image du Toulouse Vanishing Points Dataset','Position',[0,0,L,H]);
imagesc(I_RVB);
axis equal;
axis off;

% Horizon indique par le gyroscope :
load Images/interieur;
K = [ 1757 0 974.8 ; 0 1753 546.3 ; 0 0 1];
R = mean_rot;
horizon = inv(K)'*R*[0 ; 0 ; 1];
hline(horizon,'Color','m','LineWidth',2);

%% Calculs de l'horizon basée sur les exercices précédents