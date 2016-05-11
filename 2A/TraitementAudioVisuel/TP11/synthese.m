clear;

load exercice_3;

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
	indice_max = indices_max(i);
	sonagramme_reconstitue(indice_max,i) = valeurs_sonagramme_a_conserver(i);
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
