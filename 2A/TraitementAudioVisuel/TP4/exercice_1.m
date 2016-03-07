clear;
close all;

donnees;

% Affichage des donnees bruitees :
figure('Name','Estimation par maximum de vraisemblance','Position',[0.33*L,0,0.33*L,0.3*L]);
axis equal;
hold on;
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
plot(xy_donnees_bruitees(1,:),xy_donnees_bruitees(2,:),'r*');

% Maximisation de la vraisemblance par tirages aleatoires :
nb_tirages = 10000;
x_min = min(xy_donnees_bruitees(1,:));
x_max = max(xy_donnees_bruitees(1,:));
delta_x = x_max-x_min;
y_min = min(xy_donnees_bruitees(2,:));
y_max = max(xy_donnees_bruitees(2,:));
delta_y = y_max-y_min;
distance_max = sqrt(delta_x^2+delta_y^2);
x_F_test = x_min+(x_max-x_min)*rand(2,nb_tirages);
y_F_test = y_min+(y_max-y_min)*rand(2,nb_tirages);
deux_a_test = distance_max*rand(1,nb_tirages);
sommes_ecarts_carres = zeros(1, nb_tirages);
P = xy_donnees_bruitees';
for k = 1:nb_tirages
    % Sélection des foyers et de a
	F1 = repmat([x_F_test(1,k) y_F_test(1,k)], [size(P, 1) 1]);
	F2 = repmat([x_F_test(2,k) y_F_test(2,k)], [size(P, 1) 1]);
    deux_a = deux_a_test(k);
    
    % Calcul de la distance des points aux foyers
    delta1 = F1 - P;
    delta2 = F2 - P;
    d1 = sqrt(delta1(:,1).^2+delta1(:,2).^2);
    d2 = sqrt(delta2(:,1).^2+delta2(:,2).^2);
    
    % Calcul de l'erreur faite en chaque points et sauvegarde
    EP = d1 + d2 - deux_a;
    somme = EP'*EP;
    sommes_ecarts_carres(1, k) = somme;
end
[sommes_ecarts_carres_min,indice_min] = min(sommes_ecarts_carres);
F_1_estime = [x_F_test(1,indice_min) ; y_F_test(1,indice_min)];
F_2_estime = [x_F_test(2,indice_min) ; y_F_test(2,indice_min)];
a_estime = deux_a_test(1,indice_min)/2;
vecteur_F_2_F_1_estime = F_1_estime-F_2_estime;
theta_0_estime = atan(vecteur_F_2_F_1_estime(2)/vecteur_F_2_F_1_estime(1));
C_estime = (F_1_estime+F_2_estime)/2;
c_estime = sqrt(vecteur_F_2_F_1_estime(1)*vecteur_F_2_F_1_estime(1)+vecteur_F_2_F_1_estime(2)*vecteur_F_2_F_1_estime(2))/2;
b_estime = sqrt(a_estime*a_estime-c_estime*c_estime);

% Affichage de la solution :
affichage_ellipse(C_estime,theta_0_estime,a_estime,b_estime,theta_points_ellipse,'b-');
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
axis equal;
axis(echelle);
lg = legend('Donnees bruitees','Ellipse estimee','Location','Best');
set(lg,'FontSize',15);

% Calcul du score :
disp(['Score = ' num2str(score(F_1,F_2,a,F_1_estime,F_2_estime,a_estime),'%.3f')]);
