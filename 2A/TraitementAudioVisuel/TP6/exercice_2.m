clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres divers :
R = 10;					% Rayon d'un disque
R_au_carre = R*R;
distance_au_carre_max = 2*R*R;
nb_points_disque = 30;
increment_angulaire = 2*pi/nb_points_disque;
theta = 0:increment_angulaire:2*pi;
rose = [253 108 158]/255;
q_max = 120;
temps_affichage = 0.01;

% Parametres du modele :
beta = 1.0;
S = 130;
gamma = 5.0;
T = 0.1;
lambda = 100.0;
alpha = 0.99;

% Lecture de l'image et affichage de la fenetre :
I = imread('colonie.png');
I = rgb2gray(I);
I = double(I);
%% I = I(1:400,1:400);
[nb_lignes,nb_colonnes] = size(I);
figure('Name','Detection de flamants roses','Position',[0,0,L,0.65*H]);

% Recherche de la configuration optimale par naissances/morts multiples :
abscisses_centres_disques = [];
ordonnees_centres_disques = [];
energies_disques = [];
liste_energies = [];
liste_valeurs_q = [];
echelle = [0 q_max -400 0];
for q = 1:q_max
	% Tirage de la valeur de N_nouv selon une loi de Poisson :
	N_nouv = round(poissrnd(lambda));

	% Tirage des coordonnees des N_nouv nouveaux disques selon une loi uniforme, et calcul de leurs energies :
	abscisses_nouv = zeros(1, N_nouv);
    ordonnees_nouv = zeros(1, N_nouv);
    for k = 1:N_nouv
        abscisses_nouv(1,k) = rand(1,1)*nb_colonnes;
        ordonnees_nouv(1,k) = rand(1,1)*nb_lignes;
    end

	% Ajout des N_nouv nouveaux disques a la configuration courante :
	abscisses_cour = [abscisses_centres_disques abscisses_nouv];
	ordonnees_cour = [ordonnees_centres_disques ordonnees_nouv];

	% Tri des disques par ordre decroissant de l'energie :
    % Calcul de l'énergie d'attache des disques
    N_cour = size(abscisses_cour, 2);
	energies_cour = zeros(1, N_cour);
    for k = 1:N_cour
        % Calcul du niveau de gris moyen du disque
        cpt_pixels = 0;
        somme_nvg = 0;
        for j = max(1,floor(abscisses_cour(k)-R)):min(nb_colonnes,ceil(abscisses_cour(k)+R))
            for i = max(1,floor(ordonnees_cour(k)-R)):min(nb_lignes,ceil(ordonnees_cour(k)+R))
                abscisse_relative = j-abscisses_cour(k);
                ordonnee_relative = i-ordonnees_cour(k);
                if abscisse_relative*abscisse_relative+ordonnee_relative*ordonnee_relative>=R_au_carre
                    cpt_pixels = cpt_pixels+1;
                    somme_nvg = somme_nvg+I(i,j);
                end
            end
        end
        nvg_moyen = somme_nvg/cpt_pixels;
        % Calcul de l'énergie d'attache du disque
        energies_cour(1, k) = 1 - 2 / (1 + exp(- gamma * (nvg_moyen / S - 1)));
    end
    % Tri des disques par énergie d'attaque croissante
    [energies_cour, indices] = sort(energies_cour, 'descend');
    abscisses_cour = abscisses_cour(indices);
    ordonnees_cour = ordonnees_cour(indices);
    
	% Parcours des disques dans cet ordre, avec mort eventuelle :
    k = 1;
	while k <= size(energies_cour, 2) %#ok<ALIGN>
        % Calcul du delta d'énergie U(D\d) - U(D)
        Delta_U_a = - energies_cour(k);
        Delta_U_d = 0;
        positions_cour = [abscisses_cour; ordonnees_cour];
        for i = [1:k-1 k+1:size(energies_cour, 2)]
            if norm(positions_cour(:, i) - positions_cour(:, k)) < sqrt(2) * R
                Delta_U_d = Delta_U_d - beta;
            end
        end
        Delta_U = Delta_U_a + Delta_U_d;
        
        % Calcul de la probabilité de disparition
        p = lambda / (lambda + exp(Delta_U / T));
        
        %% Suppression aléatoire
        if rand < p
            indices = find(((1:size(energies_cour, 2)) - k) ~= 0);
            energies_cour = energies_cour(indices);
            abscisses_cour = abscisses_cour(indices);
            ordonnees_cour = ordonnees_cour(indices);
        else
            k = k + 1;
        end
    end
    
    abscisses_centres_disques = abscisses_cour;
    ordonnees_centres_disques = ordonnees_cour;
    energies_disques = energies_cour;

	% Mise a jour de la configuration courante :
	indices_survivants = 1:size(energies_cour, 2);
	abscisses_centres_disques = abscisses_centres_disques(indices_survivants);
	ordonnees_centres_disques = ordonnees_centres_disques(indices_survivants);
	energies_disques = energies_disques(indices_survivants);
	N = length(energies_disques);

	% Mise a jour de l'affichage :
	hold off;
	subplot(1,2,1);
	imagesc(I);
	title([num2str(N) ' flamants detectes'],'FontSize',20);
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

	% Courbe d'evolution de l'energie :
	liste_valeurs_q = [liste_valeurs_q q]; %#ok<AGROW>
	liste_energies = [liste_energies sum(energies_disques)]; %#ok<AGROW>
	subplot(1,2,2);
	plot(liste_valeurs_q,liste_energies,'.','Color',rose);
	axis(echelle);
	hx = xlabel('Nombre d''iterations','FontSize',20);
	hy = ylabel('Energie','FontSize',20);

	% Mise a jour de la temperature et du taux de naissances :
	T = alpha*T;
	lambda = alpha*lambda;
end
