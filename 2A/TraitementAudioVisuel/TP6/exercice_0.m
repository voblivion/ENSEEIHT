clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres divers :
N = 50;							% Nombre de disques d'une configuration
R = 10;							% Rayon d'un disque
R_au_carre = R*R;
nb_points_disque = 30;
increment_angulaire = 2*pi/nb_points_disque;
theta = 0:increment_angulaire:2*pi;
rose = [253 108 158]/255;
q_max = 100000;
nb_valeurs_a_afficher = 10000;
pas_entre_deux_affichages = floor(q_max/nb_valeurs_a_afficher);
temps_affichage = 0.001;

% Lecture de l'image et creation de la fenetre :
I = imread('colonie.png');
I = rgb2gray(I);
I = double(I);
I = I(1:400,1:400);
[nb_lignes,nb_colonnes] = size(I);
figure('Name',['Detection de ' num2str(N) ' flamants roses'],'Position',[0,0,L,0.65*H]);

% Tirage aleatoire d'une configuration initiale et calcul du niveau de gris moyen :
abscisses_centres_disques = zeros(N,1);
ordonnees_centres_disques = zeros(N,1);
nvg_moyen = zeros(N,1);
for k = 1:N
	abscisse_centre_disque = rand*nb_colonnes;
	ordonnee_centre_disque = rand*nb_lignes;
	abscisses_centres_disques(k) = abscisse_centre_disque;
	ordonnees_centres_disques(k) = ordonnee_centre_disque;

	cpt_pixels = 0;
	somme_nvg = 0;
	for j = max(1,floor(abscisse_centre_disque-R)):min(nb_colonnes,ceil(abscisse_centre_disque+R))
		for i = max(1,floor(ordonnee_centre_disque-R)):min(nb_lignes,ceil(ordonnee_centre_disque+R))
			abscisse_relative = j-abscisse_centre_disque;
			ordonnee_relative = i-ordonnee_centre_disque;
			if abscisse_relative*abscisse_relative+ordonnee_relative*ordonnee_relative<=R_au_carre
				cpt_pixels = cpt_pixels+1;
				somme_nvg = somme_nvg+I(i,j);
			end
		end
	end
	nvg_moyen(k) = somme_nvg/cpt_pixels;
end
liste_valeurs_q = 0;
nvg_moyen_N_disques = sum(nvg_moyen)/N;
liste_nvg_moyens = nvg_moyen_N_disques;

% Affichage de la configuration initiale :
subplot(1,2,1);
imagesc(I);
axis image;
axis off;
colormap gray;
hold on;
for k = 1:N
	abscisses_disque = abscisses_centres_disques(k)+R*cos(theta);
	ordonnees_disque = ordonnees_centres_disques(k)+R*sin(theta);
	indices = find(abscisses_disque>0 & abscisses_disque<nb_colonnes & ...
			ordonnees_disque>0 & ordonnees_disque<nb_lignes);
	plot(abscisses_disque(indices),ordonnees_disque(indices),'Color',rose,'LineWidth',2);
end
pause(temps_affichage);

% Courbe d'evolution du niveau de gris moyen :
echelle = [0 q_max 100 240];
subplot(1,2,2);
plot(liste_valeurs_q,liste_nvg_moyens,'.','Color',rose);
axis(echelle);
hx = xlabel('Nombre d''iterations','FontSize',20);
hy = ylabel('Niveau de gris moyen','FontSize',20);

% Recherche de la configuration optimale :
for q = 1:q_max
	k = rem(q,N)+1;					% On parcourt les N disques en boucle
	nvg_moyen_courant = nvg_moyen(k);

	% Tirage aleatoire d'un nouveau disque :
	abscisse_centre_disque = rand(1,1)*nb_colonnes;
	ordonnee_centre_disque = rand(1,1)*nb_lignes;

	% Calcul du niveau de gris moyen du nouveau disque :
	cpt_pixels = 0;
	somme_nvg = 0;
	for j = max(1,floor(abscisse_centre_disque-R)):min(nb_colonnes,ceil(abscisse_centre_disque+R))
		for i = max(1,floor(ordonnee_centre_disque-R)):min(nb_lignes,ceil(ordonnee_centre_disque+R))
			abscisse_relative = j-abscisse_centre_disque;
			ordonnee_relative = i-ordonnee_centre_disque;
			if abscisse_relative*abscisse_relative+ordonnee_relative*ordonnee_relative<=R_au_carre
				cpt_pixels = cpt_pixels+1;
				somme_nvg = somme_nvg+I(i,j);
			end
		end
	end
	nvg_moyen_nouveau = somme_nvg/cpt_pixels;

	% Si le disque propose est "meilleur", mises a jour :
	if nvg_moyen_nouveau>nvg_moyen_courant
		nvg_moyen(k) = nvg_moyen_nouveau;
		abscisses_centres_disques(k) = abscisse_centre_disque;
		ordonnees_centres_disques(k) = ordonnee_centre_disque;

		hold off;
		subplot(1,2,1);
		imagesc(I);
		axis image;
		axis off;
		colormap gray;
		hold on;
		for k = 1:N
			abscisses_disque = abscisses_centres_disques(k)+R*cos(theta);
			ordonnees_disque = ordonnees_centres_disques(k)+R*sin(theta);
			indices = find(abscisses_disque>0 & abscisses_disque<nb_colonnes & ...
					ordonnees_disque>0 & ordonnees_disque<nb_lignes);
			plot(abscisses_disque(indices),ordonnees_disque(indices),'Color',rose,'LineWidth',2);
		end
		pause(temps_affichage);
	end

	% Courbe d'evolution du niveau de gris moyen :
	if rem(q,pas_entre_deux_affichages)==0
		liste_valeurs_q = [liste_valeurs_q q];
		nvg_moyen_N_disques = sum(nvg_moyen)/N;
		liste_nvg_moyens = [liste_nvg_moyens nvg_moyen_N_disques];
		subplot(1,2,2);
		plot(liste_valeurs_q,liste_nvg_moyens,'.','Color',rose);
		axis(echelle);
		hx = xlabel('Nombre d''iterations','FontSize',20);
		hy = ylabel('Niveau de gris moyen','FontSize',20);
	end
end
