clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Selection d'un polygone P dans l'image source S :
S = imread('ours.jpg');
[nb_lignes_S,nb_colonnes_S,nb_canaux] = size(S);
figure('Name','Image source','Position',[0,0,0.33*L,0.5*H]);
imagesc(S);
axis equal;
axis off;
hold on;
disp('Selectionnez un polygone (double-clic pour valider)');
[P,x_P,y_P] = roipoly(S);			% Matrice binaire
for k = 1:length(x_P)-1
	line([x_P(k) x_P(k+1)],[y_P(k) y_P(k+1)],'Color','r','LineWidth',2);
end

% Sous-matrices de S et de P correspondant au rectangle englobant de P :
x_P = min(max(round(x_P),1),nb_colonnes_S);
y_P = min(max(round(y_P),1),nb_lignes_S);
x_P_min = min(x_P(:));
x_P_max = max(x_P(:));
y_P_min = min(y_P(:));
y_P_max = max(y_P(:));
s = S(y_P_min:y_P_max,x_P_min:x_P_max,:);
p = P(y_P_min:y_P_max,x_P_min:x_P_max);

% Selection d'une imagette i dans l'image cible C :
C = imread('baigneurs.jpg');
[nb_lignes_C,nb_colonnes_C,nb_canaux] = size(C);
figure('Name','Image cible','Position',[0.33*L,0,0.67*L,H]);
imagesc(C);
axis equal;
axis off;
disp('Cliquez les deux extremites de l''imagette cible');
[x_i,y_i] = ginput(2);
x_i = min(max(round(x_i),1),nb_colonnes_C);
y_i = min(max(round(y_i),1),nb_lignes_C);
x_i_min = min(x_i(:));
x_i_max = max(x_i(:));
y_i_min = min(y_i(:));
y_i_max = max(y_i(:));
line([x_i_min x_i_max],[y_i_min y_i_min],'Color','r','LineWidth',2);
line([x_i_min x_i_max],[y_i_max y_i_max],'Color','r','LineWidth',2);
line([x_i_min x_i_min],[y_i_min y_i_max],'Color','r','LineWidth',2);
line([x_i_max x_i_max],[y_i_min y_i_max],'Color','r','LineWidth',2);
i = C(y_i_min:y_i_max,x_i_min:x_i_max,:);
[nb_lignes_i,nb_colonnes_i,nb_canaux] = size(i);

% Redimensionnement de s et p :
s = imresize(s,[nb_lignes_i nb_colonnes_i]);
p = imresize(p,[nb_lignes_i nb_colonnes_i]);

% Calcul de l'imagette resultat r :
r = i;
indices = find(p>0);
for canal = 1:nb_canaux
	canal_s = s(:,:,canal);
	canal_r = r(:,:,canal);
	canal_r(indices) = canal_s(indices);
	r(:,:,canal) = canal_r;
end

% Calcul et affichage de l'image resultat R :
R = C;
R(y_i_min:y_i_max,x_i_min:x_i_max,:) = r;
figure('Name','Image resultat','Position',[0,0,L,H]);
imagesc(R);
axis equal;
axis off;

save exercice_0;
