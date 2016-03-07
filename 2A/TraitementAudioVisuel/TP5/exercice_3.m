clear;
close all;

load exercice_2;

% Partitionnement des croix rouges en deux (classe 1 affichee en vert, classe 2 affichee en bleu) :
classe = zeros(1,n);	% classe(i) vaut k si la i-eme croix rouge appartient a la classe k, k = 1,2
% tmp contient les classes de l'itération courantes
tmp = ones(1, n);
erreur_min = inf;
for k = 1:2^n
    % Distinction des deux classes
    i1 = find(tmp == 1);
    i2 = find(tmp == 2);
    c1 = M(i1,:);
    c2 = M(i2,:);

    % Calcul de la régression linéaire
    tA1 = [c1(:,1) ones(size(c1, 1), 1)];
    tA2 = [c2(:,1) ones(size(c2, 1), 1)];
    tB1 = c1(:,2);
    tB2 = c2(:,2);
    x1 = tA1\tB1;
    x2 = tA2\tB2;
    ecart = norm([norm(tA1*x1 - tB1)/size(c1, 1) norm(tA2*x2 - tB2)/size(c2, 1)]);

    % Conserver si ça améliorer le choix des deux classes
    if ecart < erreur_min
        erreur_min = ecart;
        classe = tmp;
    end

    % Modifier tmp, la classe courante
    add = 1;
    for i = 1:n
        tmp(1, i) = tmp(1, i) + add;
        add = 0;
        if tmp(1, i) > 2
            tmp(1, i) = 1;
            add = 1;
        end
    end
end
couleur(1) = 'g';
couleur(2) = 'b';

% Affichage de l'image originale et de l'image de contours :
figure('Name','Image originale et image de contours','Position',[0.5*L,0,0.5*L,H]);
subplot(2,1,1);
imagesc(valeurs_x,valeurs_y,I_RVB);
axis equal;
axis off;
set(gca,'FontSize',20);
title('Image originale','Interpreter','Latex');
subplot(2,1,2);
imagesc(valeurs_x,valeurs_y,I_contours);
axis equal;
axis off;
colormap gray;
hold on;
set(gca,'FontSize',20);
title('Image de contours','Interpreter','Latex');

% Affichage des deux classes de croix :
figure('Name','Detection des deux faisceaux de droites','Position',[0,0,0.5*L,0.5*H]);
imagesc(valeurs_theta,valeurs_rho,C);
colormap gray;
hold on;
xlabel('$\theta$ (en radians)','FontSize',20,'Interpreter','Latex');
ylabel('$\rho$ (en pixels)','FontSize',20,'Interpreter','Latex');
set(gca,'FontSize',15);
set(gca,'XTick',valeurs_theta(1):valeurs_theta(end));
set(gca,'YTick',[fliplr([0:-floor(d/5):-d]) [floor(d/5):floor(d/5):d]]);
for i = 1:n
	plot(M(i,2),M(i,1),'x','MarkerSize',10,'LineWidth',2,'Color',couleur(classe(i)));
end

% Affichage des deux faisceaux de droites :
figure(1);
subplot(2,1,2);
for i = 1:n
	rho = M(i,1);
	theta = M(i,2);
	plot(valeurs_x,(rho-valeurs_x*cos(theta))/sin(theta),'-','LineWidth',1,'Color',couleur(classe(i)));
end

% Estimation des points de fuite F1 et F2 :
disp('Tapez un caractere pour estimer les points et la ligne de fuite');
pause;
A1 = [cos(M(classe==1,2)) sin(M(classe==1,2))];
B1 = M(classe==1,1);
F1 = pinv(A1)*B1;
A2 = [cos(M(classe==2,2)) sin(M(classe==2,2))];
B2 = M(classe==2,1);
F2 = pinv(A2)*B2;

% Calcul des dimensions de l'image resultat :
marge = 100;
x_min = floor(min(F1(1),F2(1)));
x_min = min(x_min,min(valeurs_x))-marge;
x_max = ceil(max(F1(1),F2(1)));
x_max = max(x_max,max(valeurs_x))+marge;
valeurs_x_affichage = x_min:x_max;
y_min = floor(min(F1(2),F2(2)));
y_min = min(y_min,min(valeurs_y))-marge;
y_max = ceil(max(F1(2),F2(2)));
y_max = max(y_max,max(valeurs_y))+marge;

% Affichage des points de fuite :
figure('Name','Affichage des points de fuite et de la ligne de fuite','Position',[0,0,L,H]);
imagesc(valeurs_x,valeurs_y,I_RVB);
axis off;
axis equal;
hold on;
axis([x_min x_max y_min y_max]);
for i = 1:n
	rho = M(i,1);
	theta = M(i,2);
	plot(valeurs_x_affichage,(rho-valeurs_x_affichage*cos(theta))/sin(theta),'-','LineWidth',1,'Color',couleur(classe(i)));
end
plot(F1(1),F1(2),'rx','MarkerSize',10,'LineWidth',2);
plot(F2(1),F2(2),'rx','MarkerSize',10,'LineWidth',2);

% Trace de la ligne de fuite :
V_parallele = F2-F1;
V_parallele = V_parallele./(ones(2,1)*sqrt(sum(V_parallele.^2)));
V_orthogonal = [-V_parallele(2) ; V_parallele(1)];
cos_theta = V_orthogonal(1);
sin_theta = V_orthogonal(2);
theta = atan(sin_theta/cos_theta);
if theta<=0
	theta = theta+pi;
end
rho = F1(1)*cos_theta+F1(2)*sin_theta;
plot(valeurs_x_affichage,(rho-valeurs_x_affichage*cos_theta)/sin_theta,'-','LineWidth',2,'Color','r');
