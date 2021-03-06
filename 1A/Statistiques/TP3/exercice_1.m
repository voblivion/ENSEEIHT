clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres :
taille = 20;
nb_donnees = 40;
sigma = 2;

% Parametres de l'algorithme RANSAC :
k_max = nchoosek(nb_donnees,2);
seuil_distance = 4;
seuil_proportion = 0.5;

% Boucle pour calculer les ecarts angulaires moyens :
nb_essais = 10;
ecarts_angulaires_D_perp_L2 = zeros(nb_essais,nb_donnees);
ecarts_angulaires_D_perp_RANSAC = zeros(nb_essais,nb_donnees);
for i = 1:nb_essais

	% Tirage aleatoire de la direction d'une droite passant par l'origine :
	theta_0 = pi*rand;
	cos_theta_0 = cos(theta_0);
	sin_theta_0 = sin(theta_0);

	% Donnees non bruitees :
	if abs(cos_theta_0)<abs(sin_theta_0)
		abscisse_min = -taille;
		abscisse_max = taille;
		x_donnees = abscisse_min+(abscisse_max-abscisse_min)*rand(1,nb_donnees);
		y_donnees = -cos_theta_0*x_donnees/sin_theta_0;
	else
		ordonnee_min = -taille;
		ordonnee_max = taille;
		y_donnees = ordonnee_min+(ordonnee_max-ordonnee_min)*rand(1,nb_donnees);
		x_donnees = -sin_theta_0*y_donnees/cos_theta_0;
	end

	% Donnees bruitees :
    x_donnees = x_donnees+sigma*randn(1,nb_donnees);
	y_donnees = y_donnees+sigma*randn(1,nb_donnees);

	for j = 1:nb_donnees

		% Ajout d'une donnee aberrante :
		x_donnees = [x_donnees taille*(2*rand-1)];
		y_donnees = [y_donnees taille*(2*rand-1)];
		nb_total_donnees = length(x_donnees);

		% Estimation L2 de D_perp et calcul de l'ecart angulaire :
		[cos_theta_L2,sin_theta_L2,rho_L2] = estimation_nuage(x_donnees,y_donnees);
		theta_L2 = atan(sin_theta_L2/cos_theta_L2);
		ecart_angulaire_L2 = min(abs(theta_L2-theta_0),abs(theta_L2-theta_0+pi));
		ecart_angulaire_L2 = min(ecart_angulaire_L2,abs(theta_L2-theta_0-pi));
		ecarts_angulaires_L2(i,j) = ecart_angulaire_L2;

		% Algorithme RANSAC :
		critere_min = Inf;
		cos_theta_RANSAC = 0;
		sin_theta_RANSAC = 0;
		rho_RANSAC = 0;
		for k = 1:k_max
			% Tirage aleatoire de deux points du nuage :
			i_aleatoires = randi(nb_total_donnees,1,2);
			while i_aleatoires(1)==i_aleatoires(2)
				i_aleatoires = randi(nb_total_donnees,1,2);
			end
	
			% Parametres de la droite definie par ces deux points :
			[cos_theta,sin_theta,rho] = estimation_2_points(x_donnees(i_aleatoires), y_donnees(i_aleatoires));

			% Detection des donnees conformes au modele :
			indices_conformes = find(abs(sin_theta * y_donnees + cos_theta * x_donnees - rho)<=seuil_distance);

			% Test pour savoir si la droite est selectionnee :
			if (length(indices_conformes)/nb_total_donnees) >= seuil_proportion
				x_donnees_conformes = x_donnees(indices_conformes);
				y_donnees_conformes = y_donnees(indices_conformes);
				[cos_theta,sin_theta,rho] = estimation_nuage(x_donnees_conformes, y_donnees_conformes);
				residus_donnees_conformes = norm(sin_theta * y_donnees + cos_theta * x_donnees - rho,2)^2;
				critere = mean(residus_donnees_conformes.*residus_donnees_conformes);
				if critere<critere_min
					critere_min = critere;
					cos_theta_RANSAC = cos_theta;
					sin_theta_RANSAC = sin_theta;
					rho_RANSAC = rho;
				end
			end
		end

		% Ecart angulaire sur la direction de la droite D_perp estimee par RANSAC :
		theta_RANSAC = atan(sin_theta_RANSAC/cos_theta_RANSAC);
		ecart_angulaire_RANSAC = min(abs(theta_RANSAC-theta_0),abs(theta_RANSAC-theta_0+pi));
		ecart_angulaire_RANSAC = min(ecart_angulaire_RANSAC,abs(theta_RANSAC-theta_0-pi));
		ecarts_angulaires_RANSAC(i,j) = ecart_angulaire_RANSAC;
	end
end

% Calcul des ecarts angulaires moyens :
moyennes_ecarts_angulaires_L2 = mean(ecarts_angulaires_L2)/pi*180;
moyennes_ecarts_angulaires_RANSAC = mean(ecarts_angulaires_RANSAC)/pi*180;

% Affichage des courbes :
figure('Name','Estimation robuste par l''algorithme RANSAC','Position',[0,0,L,0.67*H]);
hold on;
hx = xlabel('Proportion de donnees aberrantes','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('Ecart angulaire moyen (en degres)','FontSize',20);
set(hy,'Interpreter','Latex');
proportions = [1:nb_donnees]./[nb_donnees+1:2*nb_donnees];
plot(proportions,moyennes_ecarts_angulaires_L2,'r-','LineWidth',2);
plot(proportions,moyennes_ecarts_angulaires_RANSAC,'g-','LineWidth',2);
lg = legend('Moindres carres','RANSAC');
set(lg,'Interpreter','Latex','Location','Best','Box','Off');
