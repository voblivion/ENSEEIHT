% Initialisation de l'environnement
clear;
close all;

% Paramètres
S = 0.9; % Seuil d'appartenance à la zone suivie

%% Récupération des images
base_path = '/mnt/n7fs/ens/tp_queau/Pietons/';
extension = '.jpg';
% base_path = '/mnt/n7fs/ens/tp_queau/Football/';
% extension = '.png';
files = dir([base_path '*' extension]);

%% Initialisation
% Affichage de la première image
f = figure('Name','Séquence vidéo');
file = files(1);
I = imread([base_path file.name]);
I = double(I)/255;
lines_count = size(I, 1);
columns_count = size(I, 2);
J = reshape(I(:), lines_count * columns_count, 3);
imagesc(I);
axis equal;
axis off;
drawnow;
% Selection de l'échantillon
disp('Sélectionner un échantillon de l objet à suivre');
[x0, y0] = ginput(f);
while 1 > x0 || x0 > columns_count || 1 > y0 || y0 > lines_count
    [x0, y0] = ginput(f);
end
[x1, y1] = ginput(f);
while 1 > x1 || x1 > columns_count || 1 > y1 || y1 > lines_count
    [x1, y1] = ginput(f);
end
sample = I(y0:y1, x0:x1, :);
sample_lines_count = size(sample, 1);
sample_columns_count = size(sample, 2);
% Modélisation des données selon une loi normale
sample_data = reshape(sample(:), sample_lines_count * sample_columns_count, 3);
[mu, sigma] = normfit(sample);
% Calcul de la vraisemblance de chaque pixel par rapport à cette loi normale
Sigma = repmat(sigma, size(J, 1), 1);
Mu = repmat(mu, size(J, 1), 1);
probability = 1/((2*pi)^3/2*prod(sigma)^1/2)*exp(-1/2*sum(Sigma.*((J-Mu).^2)));
% Sélection des pixels de vraisemblances acceptable
object = find(probability > S);


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
