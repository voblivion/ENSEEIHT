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

% Valeurs reelles des parametres pour le calcul des scores :
F_1_1_reel = F_1_1;
F_2_1_reel = F_2_1;
a_1_reel = a_1;
F_1_2_reel = F_1_2;
F_2_2_reel = F_2_2;
a_2_reel = a_2;

% Valeurs initiales des proportions :
pi_1 = n_1/(n_1+n_2);
pi_2 = n_2/(n_1+n_2);
pi_1_sur_sigma_1 = pi_1/sigma_1;
pi_2_sur_sigma_2 = pi_2/sigma_2;
un_sur_2_sigma_1_carre = 1/(2*sigma_1*sigma_1);
un_sur_2_sigma_2_carre = 1/(2*sigma_2*sigma_2);

% Initialisation des parametres par tirages aleatoires :
a_1 = distance_max*rand/2;
e_1 = 0.25+rand/2;
c_1 = e_1*a_1;
b_1 = a_1*sqrt(1-e_1^2);
C_1 = [x_min+delta_x*rand ; y_min+delta_y*rand];
theta_1 = 2*pi*rand;
v_1 = [cos(theta_1) ; sin(theta_1)];
F_1_1 = C_1-c_1*v_1;
F_2_1 = C_1+c_1*v_1;
a_2 = distance_max*rand/2;
e_2 = 0.25+rand/2;
c_2 = e_2*a_2;
b_2 = a_2*sqrt(1-e_2^2);
C_2 = [x_min+delta_x*rand ; y_min+delta_y*rand];
theta_2 = 2*pi*rand;
v_2 = [cos(theta_2) ; sin(theta_2)];
F_1_2 = C_2-c_2*v_2;
F_2_2 = C_2+c_2*v_2;

% Algorithme EM :
score_1_courant = 0;
score_1_nouveau = 1;
score_2_courant = 0;
score_2_nouveau = 1;
seuil = 0.001;
k = 1;
% while abs(score_1_nouveau-score_1_courant)>seuil | abs(score_2_nouveau-score_2_courant)>seuil
% 
% 	% Calcul des probabilites d'appartenance a la premiere classe :
% 	...
% 	probabilite_P_i_1 = ...
% 
% 	% Calcul des probabilites d'appartenance a la deuxieme classe :
% 	...
% 	probabilite_P_i_2 = ...
% 
% 	% Normalisation des probabilites :
% 	somme_probabilites = probabilite_P_i_1+probabilite_P_i_2;
% 	non_nul = find(somme_probabilites~=0);
% 	probabilite_P_i_1(non_nul) = probabilite_P_i_1(non_nul)./somme_probabilites(non_nul);
% 	probabilite_P_i_2(non_nul) = probabilite_P_i_2(non_nul)./somme_probabilites(non_nul);
% 	nul = find(somme_probabilites==0);
% 	probabilite_P_i_1(nul) = 0.5;
% 	probabilite_P_i_2(nul) = 0.5;
% 
% 	% Partition des donnees :
% 	indices_1 = find(probabilite_P_i_1>=probabilite_P_i_2);
% 	donnees_bruitees_1 = donnees_bruitees(:,indices_1);
% 	indices_2 = find(probabilite_P_i_1<probabilite_P_i_2);
% 	donnees_bruitees_2 = donnees_bruitees(:,indices_2);
% 
% 	% Affichage de la partition :
% 	if k==1
% 		figure('Name','Partition des donnees','Position',[0.33*L,0,0.33*L,0.5*H]);
% 	else
% 		figure(2);
% 	end
% 	hx = xlabel('$x$','FontSize',20);
% 	set(hx,'Interpreter','Latex');
% 	hy = ylabel('$y$','FontSize',20);
% 	set(hy,'Interpreter','Latex');
% 	affichage_ellipse(C_1,theta_1,a_1,b_1,theta_points_ellipse,'c-');
% 	hold on;
% 	plot(donnees_bruitees_1(1,:),donnees_bruitees_1(2,:),'c*');
% 	affichage_ellipse(C_2,theta_2,a_2,b_2,theta_points_ellipse,'m-');
% 	plot(donnees_bruitees_2(1,:),donnees_bruitees_2(2,:),'m*');
% 	axis equal;
% 	axis(echelle);
% 	legend('Densite estimee 1','Classe 1','Densite estimee 2','Classe 2','Location','Best');
% 	hold off;
% 
% 	% Mise a jour des proportions :
% 	pi_1 = sum(probabilite_P_i_1)/n;
% 	pi_2 = sum(probabilite_P_i_2)/n;
% 	pi_1_sur_sigma_1 = pi_1/sigma_1;
% 	pi_2_sur_sigma_2 = pi_2/sigma_2;
% 
% 	% Estimation des parametres des ellipses correspondant aux deux classes (moindres carres ponderes) :
% 	...
% 
% 	% Affichage du resultat :
% 	if k==1
% 		figure('Name','Resultat de l''estimation','Position',[0.66*L,0,0.33*L,0.5*H]);
% 	else
% 		figure(3);
% 	end
% 	hx = xlabel('$x$','FontSize',20);
% 	set(hx,'Interpreter','Latex');
% 	hy = ylabel('$y$','FontSize',20);
% 	set(hy,'Interpreter','Latex');
% 	plot(x,y,'r*');
% 	hold on;
% 
% 	% Correspondance entre ellipses et calcul des scores :
% 	score_1_1 = scores(F_1_1_reel,F_2_1_reel,a_1_reel,F_1_1,F_2_1,a_1);
% 	score_2_2 = scores(F_1_2_reel,F_2_2_reel,a_2_reel,F_1_2,F_2_2,a_2);
% 	score_sans_echange = (score_1_1+score_2_2)/2;
% 	score_2_1 = scores(F_1_2_reel,F_2_2_reel,a_2_reel,F_1_1,F_2_1,a_1);
% 	score_1_2 = scores(F_1_1_reel,F_2_1_reel,a_1_reel,F_1_2,F_2_2,a_2);
% 	score_avec_echange = (score_2_1+score_1_2)/2;
% 	disp(['Tour de boucle numero ' num2str(k) ' :']);
% 	if score_sans_echange>score_avec_echange
% 		affichage_ellipse(C_1,theta_1,a_1,b_1,theta_points_ellipse,'b-');
% 		affichage_ellipse(C_2,theta_2,a_2,b_2,theta_points_ellipse,'g-');
% 		disp(['Score ellipse 1 = ' num2str(score_1_1,'%.3f')]);
% 		disp(['Score ellipse 2 = ' num2str(score_2_2,'%.3f')]);
% 		score_1_courant = score_1_nouveau;
% 		score_1_nouveau = score_1_1;
% 		score_2_courant = score_2_nouveau;
% 		score_2_nouveau = score_2_2;
% 	else
% 		affichage_ellipse(C_2,theta_2,a_2,b_2,theta_points_ellipse,'b-');
% 		affichage_ellipse(C_1,theta_1,a_1,b_1,theta_points_ellipse,'g-');
% 		disp(['Score ellipse 1 = ' num2str(score_2_1,'%.3f')]);
% 		disp(['Score ellipse 2 = ' num2str(score_1_2,'%.3f')]);
% 		score_1_courant = score_1_nouveau;
% 		score_1_nouveau = score_2_1;
% 		score_2_courant = score_2_nouveau;
% 		score_2_nouveau = score_1_2;
% 	end
% 	axis equal;
% 	axis(echelle);
% 	legend('Donnees bruitees','Ellipse estimee 1','Ellipse estimee 2','Location','Best');
% 	hold off;
% 
% 	pause(0.5);
% 	k = k+1;
% end