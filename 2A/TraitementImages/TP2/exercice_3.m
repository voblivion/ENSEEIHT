clear;
close all;

load donnees_reelles;

% Affichage de l'image en niveaux de gris :
figure('Name','Image reelle','Position',[0,0,0.33*L,0.5*H]);
imagesc(I);
axis equal;
axis off;
colormap gray;
drawnow;

% Parametres :
n = length(x_donnees);
n_1 = floor(n/2);
n_2 = n-n_1;
pi_1 = n_1/n;
pi_2 = n_2/n;
nb_tirages = 500;
delta_x = x_max-x_min;
delta_y = y_max-y_min;
delta = min(delta_x,delta_y);
sigma_1 = delta/2;
sigma_2 = delta/2;

% Maximisation de la vraisemblance par tirages aleatoires :
valeurs_x_mu_1 = x_min+delta_x*rand(nb_tirages,1);
valeurs_x_mu_2 = x_min+delta_x*rand(nb_tirages,1);
valeurs_y_mu_1 = y_min+delta_y*rand(nb_tirages,1);
valeurs_y_mu_2 = y_min+delta_y*rand(nb_tirages,1);
x_donnees_centrees_1 = ones(nb_tirages,1)*x_donnees-valeurs_x_mu_1*ones(1,n);
y_donnees_centrees_1 = ones(nb_tirages,1)*y_donnees-valeurs_y_mu_1*ones(1,n);
x_donnees_centrees_2 = ones(nb_tirages,1)*x_donnees-valeurs_x_mu_2*ones(1,n);
y_donnees_centrees_2 = ones(nb_tirages,1)*y_donnees-valeurs_y_mu_2*ones(1,n);
v_1 = pi_1 * exp(-(x_donnees_centrees_1.^2 + y_donnees_centrees_1.^2)/(2 * sigma_1 * sigma_2)) / (2*pi * sigma_1 * sigma_2);
v_2 = pi_2 * exp(-(x_donnees_centrees_2.^2 + y_donnees_centrees_2.^2)/(2 * sigma_1 * sigma_2)) / (2*pi * sigma_1 * sigma_2);
vraisemblances_melange = v_1 + v_2;
arguments = sum(log(vraisemblances_melange),2);
[maximum,indice_max] = max(arguments);

% Calcul des vraisemblances des donnees relativement aux deux lois normales estimees :
vraisemblances_classe_1 = v_1(indice_max,:) / maximum;
vraisemblances_classe_2 = v_2(indice_max,:) / maximum;

% Partition des donnees :
classe_1 = find(vraisemblances_classe_1>=vraisemblances_classe_2);
x_classe_1 = x_donnees(classe_1);
y_classe_1 = y_donnees(classe_1);
classe_2 = find(vraisemblances_classe_1<vraisemblances_classe_2);
x_classe_2 = x_donnees(classe_2);
y_classe_2 = y_donnees(classe_2);

% Affichage de la partition dans l'espace (moyenne,variance) :
figure('Name','Partition','Position',[0.33*L,0,0.33*L,0.5*H]);
hold on;
xlabel('Moyenne','FontSize',20);
ylabel('Variance','FontSize',20);
plot(x_classe_1,y_classe_1,'g.');
plot(x_classe_2,y_classe_2,'b.');
axis equal;
x_min = min(x_donnees);
x_max = max(x_donnees);
y_min = min(y_donnees);
y_max = max(y_donnees);
echelle = [x_min x_max y_min y_max];
axis(echelle);

% Affichage de la partition dans l'image :
figure('Name','Segmentation par l''algorithme EM','Position',[0.66*L,0,0.33*L,0.5*H]);
hold on;
axis equal;
axis off;
axis ij;
axis([1 nb_colonnes 1 nb_lignes]);
plot(coordonnees(classe_1,2),coordonnees(classe_1,1),'g.','MarkerSize',12);
plot(coordonnees(classe_2,2),coordonnees(classe_2,1),'b.','MarkerSize',12);

% Estimation des parametres de la loi normale associee a la premiere classe :
pi_1 = length(classe_1)/n;
[x_mu_1, y_mu_1, Sigma_1] = estimation_gaussienne(x_classe_1, y_classe_1);

% % Estimation des parametres de la loi normale associee a la deuxieme classe :
pi_2 = length(classe_2)/n;
[x_mu_2, y_mu_2, Sigma_2] = estimation_gaussienne(x_classe_2, y_classe_2);

% Estimation en boucle :
n_1_precedent = 0;
seuil = 0.0005;
while abs(n_1-n_1_precedent)/n_1>seuil

	pause(1);
	n_1_precedent = n_1;

	% Calcul des vraisemblances des donnees relativement aux deux lois normales estimees :
	inv_Sigma_1 = inv(Sigma_1);
	a_1 = inv_Sigma_1(1,1);
	b_1 = inv_Sigma_1(2,2);
	c_1 = inv_Sigma_1(1,2);
	x_donnees_centrees_1 = x_donnees-x_mu_1;
	y_donnees_centrees_1 = y_donnees-y_mu_1;
	vraisemblances_classe_1 = pi_1 / (2*pi*(a_1*c_1-b_1^2)) * exp(- (a_1 * x_donnees_centrees_1.^2 + 2 * b_1 * x_donnees_centrees_1 .* y_donnees_centrees_1 + c_1 * y_donnees_centrees_1.^2) / 2);
    inv_Sigma_2 = inv(Sigma_2);
	a_2 = inv_Sigma_2(1,1);
	b_2 = inv_Sigma_2(2,2);
	c_2 = inv_Sigma_2(1,2);
	x_donnees_centrees_2 = x_donnees-x_mu_2;
	y_donnees_centrees_2 = y_donnees-y_mu_2;
	vraisemblances_classe_2 = pi_2 / (2*pi*(a_2*c_2-b_2^2)) * exp(- (a_2 * x_donnees_centrees_2.^2 + 2 * b_2 * x_donnees_centrees_2 .* y_donnees_centrees_2 + c_2 * y_donnees_centrees_2.^2) / 2);

	% Partition des donnees :
	classe_1 = find(vraisemblances_classe_1>=vraisemblances_classe_2);
	x_classe_1 = x_donnees(classe_1);
	y_classe_1 = y_donnees(classe_1);
	classe_2 = find(vraisemblances_classe_1<vraisemblances_classe_2);
	x_classe_2 = x_donnees(classe_2);
	y_classe_2 = y_donnees(classe_2);

	% Affichage de la partition :
	figure(2);
	hold off;
	plot(x_classe_1,y_classe_1,'g.');
	hold on;
	plot(x_classe_2,y_classe_2,'b.');
	xlabel('Moyenne','FontSize',20);
	ylabel('Variance','FontSize',20);
	axis equal;
	axis(echelle);

	% Affichage des deux classes :
	figure(3);
	hold off;
	plot(coordonnees(classe_1,2),coordonnees(classe_1,1),'g.','MarkerSize',12);
	hold on;
	axis equal;
	axis off;
	axis ij;
	axis([1 nb_colonnes 1 nb_lignes]);
	plot(coordonnees(classe_2,2),coordonnees(classe_2,1),'b.','MarkerSize',12);

	% Estimation des parametres de la loi normale associee a la premiere classe :
	n_1 = length(classe_1);
	pi_1 = n_1/n;
	[x_mu_1, y_mu_1, Sigma_1] = estimation_gaussienne(x_classe_1, y_classe_1);

	% Estimation des parametres de la loi normale associee a la deuxieme classe :
	n_2 = length(classe_2);
	pi_2 = n_2/n;
	[x_mu_2, y_mu_2, Sigma_2] = estimation_gaussienne(x_classe_2, y_classe_2);
end
