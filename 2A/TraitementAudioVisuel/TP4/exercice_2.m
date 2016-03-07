clear;
close all;

donnees;

% Affichage des donnees bruitees :
figure('Name','Estimation par les moindres carres ordinaires','Position',[0.33*L,0,0.33*L,0.3*L]);
axis equal;
hold on;
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
plot(xy_donnees_bruitees(1,:),xy_donnees_bruitees(2,:),'r*');

x = transpose(xy_donnees_bruitees(1,:));
y = transpose(xy_donnees_bruitees(2,:));

% Moindres carres ordinaires sous la contrainte alpha+gamma = 1 :
% ax2 + bxy + (1-a)y2 + dx + ey + f = 0
% a(x2-y2) + bxy + dx + ey + f = -y2
n = size(xy_donnees_bruitees, 2);
Pd = xy_donnees_bruitees';
A = ones(n, 5);
A(:,1) = Pd(:,1).^2-Pd(:,2).^2;
A(:,2) = Pd(:,1).*Pd(:,2);
A(:,3) = Pd(:,1);
A(:,4) = Pd(:,2);
B = -Pd(:,2).^2;
tp = A\B;
p = [tp(1:2); 1-tp(1); tp(3:5)];
[C_1,theta_0_1,a_1,b_1] = conversion(p);
affichage_ellipse(C_1,theta_0_1,a_1,b_1,theta_points_ellipse,'b-');
axis(echelle);
lg = legend('Donnees bruitees','MC ordinaires 1','Location','Best');
set(lg,'FontSize',15);

% Calcul du score sous la contrainte alpha+gamma = 1 :
R_1 = [cos(theta_0_1) -sin(theta_0_1) ; sin(theta_0_1) cos(theta_0_1)];
c_1 = sqrt(a_1*a_1-b_1*b_1);
F_1_1 = R_1*[c_1 ; 0]+C_1;
F_2_1 = R_1*[-c_1 ; 0]+C_1;
disp(['Score 1 = ' num2str(score(F_1,F_2,a,F_1_1,F_2_1,a_1),'%.3f')]);
disp('Sélectionnez la figure 2 et tapez [entrer]');
pause;

% Moindres carres ordinaires sous la contrainte phi = 1 :
A = ones(n, 5);
A(:,1) = Pd(:,1).^2;
A(:,2) = Pd(:,1).*Pd(:,2);
A(:,3) = Pd(:,2).^2;
A(:,4) = Pd(:,1);
A(:,5) = Pd(:,2);
B = -ones(n, 1);
tp = A\B;
p = [tp; 1];
[C_2,theta_0_2,a_2,b_2] = conversion(p);
affichage_ellipse(C_2,theta_0_2,a_2,b_2,theta_points_ellipse,'c-');
axis(echelle);
lg = legend('Donnees bruitees','MC ordinaires 1','MC ordinaires 2','Location','Best');
set(lg,'FontSize',15);

% Calcul du score sous la contrainte phi = 1 :
R_2 = [cos(theta_0_2) -sin(theta_0_2) ; sin(theta_0_2) cos(theta_0_2)];
c_2 = sqrt(a_2*a_2-b_2*b_2);
F_1_2 = R_2*[c_2 ; 0]+C_2;
F_2_2 = R_2*[-c_2 ; 0]+C_2;
disp(['Score 2 = ' num2str(score(F_1,F_2,a,F_1_2,F_2_2,a_2),'%.3f')]);
