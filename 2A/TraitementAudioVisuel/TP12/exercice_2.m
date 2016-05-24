clear;
close all;
load('nuages.mat');
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'un extrait musical :
[signal,frequence_echantillonnage] = wavread('Donnees_WAV/solo.wav');
sound(signal,frequence_echantillonnage);
signal = mean(signal,2);

% Calcul de la transformee de Gabor (TG) :
nb_echantillons = length(signal);
duree_totale = floor(nb_echantillons/frequence_echantillonnage);
duree_mesure = 0.2;					% Duree d'une mesure
nb_mesures = floor(duree_totale/duree_mesure);
nb_echantillons_par_mesure = floor(nb_echantillons/nb_mesures);
TG = [];
indice_debut_fenetre = 1;
indice_fin_fenetre = nb_echantillons_par_mesure;
while indice_fin_fenetre<=nb_echantillons
	signal_dans_la_fenetre = signal(indice_debut_fenetre:indice_fin_fenetre);
	TG = [TG fft(signal_dans_la_fenetre)];
	indice_debut_fenetre = indice_debut_fenetre+nb_echantillons_par_mesure;
	indice_fin_fenetre = indice_fin_fenetre+nb_echantillons_par_mesure;
end
valeurs_t = 0:duree_totale/(nb_mesures-1):duree_totale;

% Calcul du sonagramme :
f_min = 20;
f_max = 2000;
pas_en_frequence = frequence_echantillonnage/nb_echantillons_par_mesure;
valeurs_f_sonagramme = 0:pas_en_frequence:f_max;
nb_echantillons_en_frequence_sonagramme = length(valeurs_f_sonagramme);
sonagramme = abs(TG(1:nb_echantillons_en_frequence_sonagramme,:));

% Affichage du sonagramme :
figure('Name','Sonagramme','Position',[0,0,0.5*L,0.67*H]);
imagesc(valeurs_t,valeurs_f_sonagramme,abs(sonagramme));
axis xy;
hx = xlabel('$t$ ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$f$ ($Hz$)','FontSize',20);
set(hy,'Interpreter','Latex');
axis([valeurs_t(1) valeurs_t(end) f_min f_max]);

% Calcul des bornes de la partition frequentielle :
nb_bandes = 6;
bornes = exp(log(f_min):(log(f_max)-log(f_min))/nb_bandes:log(f_max));
for i = 1:nb_bandes
	indices_bornes(i) = min(find(valeurs_f_sonagramme>bornes(i)));
end
indices_bornes(end+1) = length(valeurs_f_sonagramme);

% Calcul de l'empreinte sonore :
empreinte_sonore = [];		% Chaque ligne de cette matrice contient un point de l'empreinte sonore
for i = 1:nb_bandes
    [maxs,ids] = max(sonagramme(indices_bornes(i):indices_bornes(i+1)-1, :));
    S = mean(maxs) + std(maxs);
    for j = 1:length(maxs)
        if maxs(j) >= S
            empreinte_sonore = [empreinte_sonore; valeurs_t(j) valeurs_f_sonagramme(ids(j)+indices_bornes(i)-1)];
        end
    end
end

% Affichage de l'empreinte sonore :
figure('Name','Empreinte sonore','Position',[0.5*L,0,0.5*L,0.67*H]);
plot(empreinte_sonore(:,1),log(empreinte_sonore(:,2)/f_min),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5);
hx = xlabel('$t$ ($s$)','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\log\left(f/f_{\min}\right)$','FontSize',20);
set(hy,'Interpreter','Latex');
axis([valeurs_t(1) valeurs_t(end) 0 log(f_max/f_min)]);
hold on;
for b = 2:length(indices_bornes)-1
	plot([valeurs_t(1) valeurs_t(end)],[log(bornes(b)/bornes(1)) log(bornes(b)/bornes(1))],'-r');
end

%% Calcul de la distance de l'extrait à l'empreinte dans nuages.mat
[distance, padding, indices] = score(empreinte_sonore, empreinte_sonore_nuages);
empreinte_sonore(:, 1) = empreinte_sonore(:, 1) + padding;

% Affichage de l'extrait replacé
f = figure('Name', 'Extrait replacé et morceau');
plot(empreinte_sonore_nuages(:,1),log(empreinte_sonore_nuages(:,2)/f_min),...
    'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',5);
hold on;
pause(2);
figure(f);
plot(empreinte_sonore(:,1),log(empreinte_sonore(:,2)/f_min),...
    'o','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5);
for j = 1:size(empreinte_sonore, 1)
    i = indices(j);
    dx = [empreinte_sonore_nuages(i, 1); empreinte_sonore(j, 1)];
    dy = log([empreinte_sonore_nuages(i, 2); empreinte_sonore(j, 2)]/f_min);
    figure(f);
    plot(dx, dy);
end
