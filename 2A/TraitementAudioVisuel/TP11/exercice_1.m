clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

load musique;

% Calcul de la transformee de Gabor :
nb_total_echantillons = length(signal);
duree_totale = floor(nb_total_echantillons/frequence_echantillonnage);
duree_mesure = 0.25;					% On fixe la duree d'une mesure � 0,25 seconde
nb_mesures = floor(duree_totale/duree_mesure);
nb_echantillons_par_mesure = floor(nb_total_echantillons/nb_mesures);
TG = [];
indice_debut_fenetre = 1;
indice_fin_fenetre = nb_echantillons_par_mesure;
while indice_fin_fenetre<=nb_total_echantillons
	signal_dans_la_fenetre = signal(indice_debut_fenetre:indice_fin_fenetre);	% signal = vecteur colonne
	TG = [TG fft(signal_dans_la_fenetre)];
    % TG = abs(TG);
    % TG = real(TG);
	indice_debut_fenetre = indice_debut_fenetre+nb_echantillons_par_mesure;
	indice_fin_fenetre = indice_fin_fenetre+nb_echantillons_par_mesure;
end

% Affichage du module de la transformee de Gabor :
valeurs_t = 0:duree_totale/(nb_mesures-1):duree_totale;
frequence_max_TG = floor(frequence_echantillonnage/2);
nb_echantillons_en_frequence_TG = nb_echantillons_par_mesure;
nb_echantillons_en_frequence_demi_TG = floor(nb_echantillons_par_mesure/2);
valeurs_f_TG = -frequence_max_TG:frequence_max_TG/(nb_echantillons_en_frequence_demi_TG-1):frequence_max_TG;
figure('Name','Transformee de Gabor','Position',[0,0,0.33*L,0.45*H]);
imagesc(valeurs_t,valeurs_f_TG,abs(centrage(TG)));
axis xy;
hx = xlabel('Temps ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Frequence ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');
drawnow;

% Restitution du signal a partir de la transformee de Gabor :
signal_reconstruit = [];
indice_debut_fenetre = 1;
indice_fin_fenetre = nb_echantillons_par_mesure;
while indice_fin_fenetre<=nb_total_echantillons
	TG_dans_la_fenetre = TG(indice_debut_fenetre:indice_fin_fenetre);	% signal = vecteur colonne
	signal_reconstruit = [signal_reconstruit ifft(TG_dans_la_fenetre)];
	indice_debut_fenetre = indice_debut_fenetre+nb_echantillons_par_mesure;
	indice_fin_fenetre = indice_fin_fenetre+nb_echantillons_par_mesure;
end
sound(real(signal_reconstruit),frequence_echantillonnage,nombre_bits);

save exercice_1;
