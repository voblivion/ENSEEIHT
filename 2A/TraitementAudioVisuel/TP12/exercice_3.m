clear;
close all;

% Tirage aleatoire d'un extrait musical :
repertoire = dir('Donnees_WAV/Extraits');
taille_repertoire = size(repertoire);
nb_extraits = taille_repertoire(1)-2;	% Les fichiers . et .. ont ete comptabilises
numero_extrait = randi(nb_extraits);

% Lecture de cet extrait musical :
[signal,frequence_echantillonnage] = wavread(['Donnees_WAV/Extraits/extrait' int2str(numero_extrait) '.wav']);
sound(signal,frequence_echantillonnage);

% Calcul de l'empreinte sonore de cet extrait (cf. exercice 1) :
...

% Parcours de la base d'empreintes sonores :
load('base_donnees.mat');
scores_max = [];
distance_max = 0.45;
duree_mesure = 0.2;
for numero = 1:length(titres_auteurs_empreintes)

	% Comparaison des empreintes sonores (cf. exercice 2) :
	...
	scores_max = [scores_max ...];
end

% Recherche du morceau qui donne le score_max le plus eleve :
[maximum,indice_maximum] = max(scores_max);
disp(['Vous ecoutez ' titres_auteurs_empreintes{indice_maximum}.titre ' de ' titres_auteurs_empreintes{indice_maximum}.auteur]);
