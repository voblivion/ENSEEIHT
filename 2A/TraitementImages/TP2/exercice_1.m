clear;
close all;

donnees;
drawnow;

nb_points_ellipse = 100;
deux_pi = 2*pi;
theta_points_ellipse = deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:deux_pi;

x = transpose(donnees_bruitees(1,:));
y = transpose(donnees_bruitees(2,:));

x_min = min(x);
x_max = max(x);
delta_x = x_max-x_min;
y_min = min(y);
y_max = max(y);
delta_y = y_max-y_min;

distances_au_carre = [];
for i = 1:n
	distances_au_carre = [distances_au_carre ; sum((donnees_bruitees(:,i)*ones(1,n)-donnees_bruitees).^2)];
end
distance_max = sqrt(max(distances_au_carre(:)));

% Recherche du maximum de vraisemblance par tirages aleatoires :
pi_1 = n_1/(n_1+n_2);
pi_2 = n_2/(n_1+n_2);
pi_1_sur_sigma_1 = pi_1/sigma_1;
pi_2_sur_sigma_2 = pi_2/sigma_2;
un_sur_2_sigma_1_carre = 1/(2*sigma_1*sigma_1);
un_sur_2_sigma_2_carre = 1/(2*sigma_2*sigma_2);
deux_a_1_liste = [];
e_1_liste = [];
C_1_liste = [];
theta_1_liste = [];
deux_a_2_liste = [];
e_2_liste = [];
C_2_liste = [];
theta_2_liste = [];
log_vraisemblance_liste = [];
nb_tirages = 10000;
for k = 1:nb_tirages
	deux_a_1_test = distance_max*rand;
	e_1_test = 0.25+rand/2;
	c_1_test = e_1_test*deux_a_1_test/2;
	C_1_test = [x_min+delta_x*rand ; y_min+delta_y*rand];
	theta_1_test = 2*pi*rand;
	v_1_test = [cos(theta_1_test) ; sin(theta_1_test)];
	F_1_1_test = C_1_test-c_1_test*v_1_test;
	F_2_1_test = C_1_test+c_1_test*v_1_test;

	deux_a_1_liste = [deux_a_1_liste deux_a_1_test];
	e_1_liste = [e_1_liste e_1_test];
	C_1_liste = [C_1_liste C_1_test];
	theta_1_liste = [theta_1_liste theta_1_test];

	P_i_F_1_1 = donnees_bruitees-F_1_1_test*ones(1,n);
	distances_P_i_F_1_1 = sqrt(sum(P_i_F_1_1.*P_i_F_1_1));
	P_i_F_2_1 = donnees_bruitees-F_2_1_test*ones(1,n);
	distances_P_i_F_2_1 = sqrt(sum(P_i_F_2_1.*P_i_F_2_1));
	ecarts_1 = distances_P_i_F_1_1+distances_P_i_F_2_1-deux_a_1_test;

	deux_a_2_test = distance_max*rand;
	e_2_test = 0.25+rand/2;
	c_2_test = e_2_test*deux_a_2_test/2;
	C_2_test = [x_min+delta_x*rand ; y_min+delta_y*rand];
	theta_2_test = 2*pi*rand;
	v_2_test = [cos(theta_2_test) ; sin(theta_2_test)];
	F_1_2_test = C_2_test-c_2_test*v_2_test;
	F_2_2_test = C_2_test+c_2_test*v_2_test;

	deux_a_2_liste = [deux_a_2_liste deux_a_2_test];
	e_2_liste = [e_2_liste e_2_test];
	C_2_liste = [C_2_liste C_2_test];
	theta_2_liste = [theta_2_liste theta_2_test];

	P_i_F_1_2 = donnees_bruitees-F_1_2_test*ones(1,n);
	distances_P_i_F_1_2 = sqrt(sum(P_i_F_1_2.*P_i_F_1_2));
	P_i_F_2_2 = donnees_bruitees-F_2_2_test*ones(1,n);
	distances_P_i_F_2_2 = sqrt(sum(P_i_F_2_2.*P_i_F_2_2));
	ecarts_2 = distances_P_i_F_1_2+distances_P_i_F_2_2-deux_a_2_test;

	log_f_P_i = log(pi_1_sur_sigma_1*exp(-un_sur_2_sigma_1_carre*ecarts_1.*ecarts_1)...
			+pi_2_sur_sigma_2*exp(-un_sur_2_sigma_2_carre*ecarts_2.*ecarts_2));

	log_vraisemblance_liste = [log_vraisemblance_liste sum(log_f_P_i)];
end
[log_vraisemblance_max,indice_max] = max(log_vraisemblance_liste);

% Parametres de la premiere densite estimee :
a_1_estime = deux_a_1_liste(1,indice_max)/2;
e_1_estime = e_1_liste(1,indice_max);
b_1_estime = a_1_estime*sqrt(1-e_1_estime^2);
c_1_estime = e_1_estime*a_1_estime;
C_1_estime = C_1_liste(:,indice_max);
theta_1_estime = theta_1_liste(1,indice_max);
v_1_estime = [cos(theta_1_estime) ; sin(theta_1_estime)];
F_1_1_estime = C_1_estime-c_1_estime*v_1_estime;
F_2_1_estime = C_1_estime+c_1_estime*v_1_estime;

% Parametres de la deuxieme densite estimee :
a_2_estime = deux_a_2_liste(1,indice_max)/2;
e_2_estime = e_2_liste(1,indice_max);
b_2_estime = a_2_estime*sqrt(1-e_2_estime^2);
c_2_estime = e_2_estime*a_2_estime;
C_2_estime = C_2_liste(:,indice_max);
theta_2_estime = theta_2_liste(1,indice_max);
v_2_estime = [cos(theta_2_estime) ; sin(theta_2_estime)];
F_1_2_estime = C_2_estime-c_2_estime*v_2_estime;
F_2_2_estime = C_2_estime+c_2_estime*v_2_estime;


% Calcul de la premiere densite estimee pour l'ensemble des donnees :
ecarts_1 = sqrt(sum((donnees_bruitees - repmat(F_1_1_estime, 1, n)).*(donnees_bruitees - repmat(F_1_1_estime, 1, n))))...
    + sqrt(sum((donnees_bruitees - repmat(F_2_1_estime, 1, n)).*(donnees_bruitees - repmat(F_2_1_estime, 1, n)))) - 2 * a_1_estime;
f_1_P_i = pi_1_sur_sigma_1 / sqrt(2 * pi) * exp(- ecarts_1.*ecarts_1 * un_sur_2_sigma_1_carre);

% Calcul de la deuxieme densite estimee pour l'ensemble des donnees :
ecarts_2 = sqrt(sum((donnees_bruitees - repmat(F_1_2_estime, 1, n)).*(donnees_bruitees - repmat(F_1_2_estime, 1, n))))...
    + sqrt(sum((donnees_bruitees - repmat(F_2_2_estime, 1, n)).*(donnees_bruitees - repmat(F_2_2_estime, 1, n)))) - 2 * a_2_estime;
f_2_P_i = pi_2_sur_sigma_2 / sqrt(2 * pi) * exp(- ecarts_2.*ecarts_2 * un_sur_2_sigma_2_carre);

% Partition des donnees :
indices_1_estime = find(f_1_P_i>=f_2_P_i);
donnees_bruitees_1_estime = donnees_bruitees(:,indices_1_estime);
indices_2_estime = find(f_1_P_i<f_2_P_i);
donnees_bruitees_2_estime = donnees_bruitees(:,indices_2_estime);

% Affichage de la partition :
figure('Name','Resultat du maximum de vraisemblance','Position',[0.33*L,0,0.33*L,0.5*H]);
axis equal;
hold on;
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
affichage_ellipse(C_1_estime,theta_1_estime,a_1_estime,b_1_estime,theta_points_ellipse,'c-');
plot(donnees_bruitees_1_estime(1,:),donnees_bruitees_1_estime(2,:),'c*');
affichage_ellipse(C_2_estime,theta_2_estime,a_2_estime,b_2_estime,theta_points_ellipse,'m-');
plot(donnees_bruitees_2_estime(1,:),donnees_bruitees_2_estime(2,:),'m*');
axis(echelle);
legend('Densite estimee 1','Classe 1','Densite estimee 2','Classe 2','Location','Best');

% Estimation des parametres des ellipses correspondant aux deux classes (cf. TP4 de TAV) :
params_1 = estimation_ellipse(donnees_bruitees_1_estime(1,:)', donnees_bruitees_1_estime(2,:)');
C_1_reestime = [params_1(1); params_1(2)];
a_1_reestime = params_1(3);
b_1_reestime = params_1(4);
theta_1_reestime = params_1(5);
c_1 = sqrt(a_1_reestime^2 - b_1_reestime^2);
R_1 = [cos(theta_1_reestime) -sin(theta_1_reestime) ; sin(theta_1_reestime) cos(theta_1_reestime)];
F_1_1_reestime = R_1*[c_1; 0]+C_1;
F_2_1_reestime = R_1*[-c_1; 0]+C_1;

params_2 = estimation_ellipse(donnees_bruitees_2_estime(1,:)', donnees_bruitees_2_estime(2,:)');
C_2_reestime = [params_2(1); params_2(2)];
a_2_reestime = params_2(3);
b_2_reestime = params_2(4);
theta_2_reestime = params_2(5);
c_2 = sqrt(a_2_reestime^2 - b_2_reestime^2);
R_2 = [cos(theta_2_reestime) -sin(theta_2_reestime) ; sin(theta_2_reestime) cos(theta_2_reestime)];
F_1_2_reestime = R_2*[c_2; 0]+C_2;
F_2_2_reestime = R_2*[-c_2; 0]+C_2;

% Fenetre d'affichage du resultat :
figure('Name','Resultat de l''estimation','Position',[0.66*L,0,0.33*L,0.5*H]);
plot(x,y,'r*');
hold on;
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
axis equal;

% Affichage des ellipses estimees et calcul des scores :
score_1_1 = scores(F_1_1,F_2_1,a_1,F_1_1_reestime,F_2_1_reestime,a_1_reestime);
score_2_2 = scores(F_1_2,F_2_2,a_2,F_1_2_reestime,F_2_2_reestime,a_2_reestime);
score_sans_echange = (score_1_1+score_2_2)/2;
score_2_1 = scores(F_1_2,F_2_2,a_2,F_1_1_reestime,F_2_1_reestime,a_1_reestime);
score_1_2 = scores(F_1_1,F_2_1,a_1,F_1_2_reestime,F_2_2_reestime,a_2_reestime);
score_avec_echange = (score_2_1+score_1_2)/2;
if score_sans_echange>score_avec_echange
	affichage_ellipse(C_1_reestime,theta_1_reestime,a_1_reestime,b_1_reestime,theta_points_ellipse,'b-');
	affichage_ellipse(C_2_reestime,theta_2_reestime,a_2_reestime,b_2_reestime,theta_points_ellipse,'g-');
	disp(['Score ellipse 1 = ' num2str(score_1_1,'%.3f')]);
	disp(['Score ellipse 2 = ' num2str(score_2_2,'%.3f')]);
else
	affichage_ellipse(C_2_reestime,theta_2_reestime,a_2_reestime,b_2_reestime,theta_points_ellipse,'b-');
	affichage_ellipse(C_1_reestime,theta_1_reestime,a_1_reestime,b_1_reestime,theta_points_ellipse,'g-');
	disp(['Score ellipse 1 = ' num2str(score_2_1,'%.3f')]);
	disp(['Score ellipse 2 = ' num2str(score_1_2,'%.3f')]);
end
axis(echelle);
legend('Donnees bruitees','Ellipse estimee 1','Ellipse estimee 2','Location','Best');
