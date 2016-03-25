clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage d'une image en niveaux de gris :
% I = imread('Images/lauren.png');
I = imread('Images/zebre.jpg');
% I = imread('Images/image.bmp');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
I = reshape(I(:,:,1),nb_lignes,nb_colonnes);
figure('Name','Image reelle','Position',[0,0,0.33*L,0.5*H]);
imagesc(I);
axis equal;
axis off;
colormap gray;
drawnow;

% Creation du nuage de points :
x_donnees = [];
y_donnees = [];
coordonnees = [];
T = 2;
for i = 1+T:nb_lignes-T
	for j = 1+T:nb_colonnes-T
		fenetre = I(i-T:i+T,j-T:j+T);
		fenetre = fenetre(:);
		moyenne = mean(fenetre);
		x_donnees = [x_donnees moyenne];
		fenetre_centree = fenetre-moyenne;
		variance = mean(fenetre_centree.^2);
		y_donnees = [y_donnees variance];
		coordonnees = [coordonnees ; i j];
	end
end

% Affichage du nuage de points :
figure('Name','Donnees reelles','Position',[0.33*L,0,0.33*L,0.5*H]);
hold on;
xlabel('Moyenne','FontSize',20);
ylabel('Variance','FontSize',20);
plot(x_donnees,y_donnees,'r.');
axis equal;
x_min = min(x_donnees);
x_max = max(x_donnees);
y_min = min(y_donnees);
y_max = max(y_donnees);
axis([x_min x_max y_min y_max]);

save donnees_reelles;