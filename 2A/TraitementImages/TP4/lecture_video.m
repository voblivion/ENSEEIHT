clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

chemin = '/mnt/n7fs/ens/tp_queau/Pietons/';
suffixe = '.jpg';

% chemin = '/mnt/n7fs/ens/tp_queau/Football/';
% suffixe = '.png';

liste_fichiers = dir([chemin 'img*' suffixe]);

% Lecture et affichage de la premiere image :
figure('Name','Exemple de sequence video','Position',[0.5*L,0,0.5*L,H]);
fichier = liste_fichiers(1);
I = imread([chemin fichier.name]);
I = double(I);
I = I/255;
imagesc(I);
axis equal;
axis off;
drawnow;
pause(0.01);

% Lecture et affichage des images suivantes :
for l = 2:length(liste_fichiers)
	fichier = liste_fichiers(l);
	I = imread([chemin 'img' int2str(l) suffixe]);
	I = double(I);
	I = I/255;
	imagesc(I);
	axis equal;
	axis off;
	drawnow;
	pause(0.01);
end
