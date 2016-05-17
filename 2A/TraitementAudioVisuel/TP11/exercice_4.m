clear;
close all;

load exercice_2;

seuil_audible = 0;		% En dessous d'un certain seuil (modulable), on considere qu'il s'agit d'un silence
n = floor(nb_echantillons_en_frequence_sonagramme/8);

% Determination de la note la plus forte a chaque mesure :
indices_max = [];
valeurs_sonagramme_a_conserver = [];
frequences_notes = [];	% Contient les frequences des notes (utiliser valeurs_f_sonagramme)
silences = [];		% Contient des valeurs binaires (1 = silence)
for i = 1:nb_mesures
	spectre = abs(sonagramme(:,i));
    [spectre, indices] = sort(spectre, 'descend');
    max_spectre = sonagramme(indices(1:n), i);
    for k = 1:n
        if abs(max_spectre(k)) < seuil_audible
            max_spectre(k) = 0;
        end
    end
    
    % Lignes utiles pour le script synthese.m :
    indices_max = [indices_max indices(1:n)];
    valeurs_sonagramme_a_conserver = [valeurs_sonagramme_a_conserver max_spectre];
end

save exercice_4;

% Affichage du sonagramme original, en guise de comparaison :
figure('Name','Sonagramme original','Position',[550,0,550,450]);
imagesc(valeurs_t,valeurs_f_sonagramme,abs(sonagramme));
axis xy;
hx = xlabel('Temps ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Frequence ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');

% Affichage du sonagramme reconstitue a partir de la partition :
sonagramme_reconstitue = zeros(size(sonagramme));
for i = 1:nb_mesures
	indice_max = indices_max(:, i);
	sonagramme_reconstitue(indice_max,i) = valeurs_sonagramme_a_conserver(:, i);
end
figure('Name','Sonagramme reconstitue a partir de la partition','Position',[1100,0,550,450]);
imagesc(valeurs_t,valeurs_f_sonagramme,abs(sonagramme_reconstitue));
axis xy;
hx = xlabel('Temps ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Frequence ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');

% Calcul de la transformee de Gabor reconstituee :
TG_reconstituee = zeros(size(TG));
TG_reconstituee(1:nb_echantillons_en_frequence_sonagramme,:) = sonagramme_reconstitue;

% Restitution du signal a partir de la transformee de Gabor reconstituee :
TG_reconstituee_inverse = [];
for i = 1:size(TG,2)
	TG_reconstituee_inverse = [TG_reconstituee_inverse ; real(ifft(TG_reconstituee(:,i)))];
end
sound(TG_reconstituee_inverse,frequence_echantillonnage,nombre_bits);

