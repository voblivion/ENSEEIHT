clear;
close all;

load exercice_2;

seuil_audible = 40;		% En dessous d'un certain seuil (modulable), on considere qu'il s'agit d'un silence

% Determination de la note la plus forte a chaque mesure :
indices_max = [];
valeurs_sonagramme_a_conserver = [];
frequences_notes = [];	% Contient les frequences des notes (utiliser valeurs_f_sonagramme)
silences = [];		% Contient des valeurs binaires (1 = silence)
for i = 1:nb_mesures
	spectre = abs(sonagramme(:,i));
	[max_abs_spectre, indice_max_spectre] = max(spectre);
    max_spectre = sonagramme(indice_max_spectre, i);
    
    if max_abs_spectre < seuil_audible
        silences = [silences 1];
    else
        silences = [silences 0];
    end
    frequences_notes = [frequences_notes valeurs_f_sonagramme(indice_max_spectre)];

	% Lignes utiles pour le script synthese.m :
	indices_max = [indices_max indice_max_spectre];
	valeurs_sonagramme_a_conserver = [valeurs_sonagramme_a_conserver max_spectre];
end

% Transformation des frequences des notes en ordonnees :
ordonnees_notes = frequences_ordonnees(frequences_notes);

% Affichage des notes sur la portee :
affichage_partition(ordonnees_notes,silences,taille_ecran);

save exercice_3;
