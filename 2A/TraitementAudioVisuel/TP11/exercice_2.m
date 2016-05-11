clear;

load exercice_1;

% Calcul du sonagramme (une certaine proportion des frequences positives est conservee) :
proportion = 1;			% Testez plusieurs valeurs de ce parametre dans l'intervalle [0,1]
nb_echantillons_en_frequence_sonagramme = floor(proportion*nb_echantillons_en_frequence_demi_TG);
sonagramme = TG(1:nb_echantillons_en_frequence_sonagramme,:);

% Affichage du module du sonagramme :
frequence_max_sonagramme = floor(proportion*frequence_echantillonnage/2);
valeurs_f_sonagramme = 0:frequence_max_sonagramme/(nb_echantillons_en_frequence_sonagramme-1):frequence_max_sonagramme;
figure('Name','Sonagramme','Position',[0.33*L,0,0.33*L,0.45*H]);
imagesc(valeurs_t,valeurs_f_sonagramme,abs(sonagramme));
axis xy;
hx = xlabel('Temps ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Frequence ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');

% Calcul et affichage de la transformee de Gabor reconstituee :
TG_reconstitue = zeros(size(TG));
TG_reconstitue(1:nb_echantillons_en_frequence_sonagramme,:) = sonagramme;
figure('Name','Transformee de Gabor reconstituee','Position',[0.66*L,0,0.33*L,0.45*H]);
imagesc(valeurs_t,valeurs_f_TG,abs(centrage(TG_reconstitue)));
axis xy;
hx = xlabel('Temps ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Frequence ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');
drawnow;

% Restitution du signal a partir de la transformee de Gabor reconstituee :
signal_altere_reconstruit = [];
indice_debut_fenetre = 1;
indice_fin_fenetre = nb_echantillons_par_mesure;
while indice_fin_fenetre<=nb_total_echantillons
	TG_dans_la_fenetre = TG_reconstitue(indice_debut_fenetre:indice_fin_fenetre);	% signal = vecteur colonne
	signal_altere_reconstruit = [signal_altere_reconstruit ifft(TG_dans_la_fenetre)];
	indice_debut_fenetre = indice_debut_fenetre+nb_echantillons_par_mesure;
	indice_fin_fenetre = indice_fin_fenetre+nb_echantillons_par_mesure;
end
sound(real(signal_altere_reconstruit),frequence_echantillonnage,nombre_bits);

save exercice_2;
