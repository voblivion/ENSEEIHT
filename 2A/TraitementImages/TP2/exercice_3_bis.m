clear;
close all;

% Parametres
nb_tirages = 500;
nb_classes = 2;

load donnees_reelles;

% Affichage de l'image en niveaux de gris :
f1 = figure('Name','Image reelle','Position',[0,0,0.33*L,0.5*H]);
imagesc(I);
axis equal;
axis off;
colormap gray;
drawnow;

% Parametres :
n = length(x_donnees);
ns = ones(1, nb_classes) * floor(n/nb_classes);
ns(nb_classes) = n - sum(ns(1:nb_classes-1));
pis = ns / n;
delta_x = x_max-x_min;
delta_y = y_max-y_min;
delta = min(delta_x,delta_y);
sigmas = ones(1, nb_classes) * delta / nb_classes;

% Maximisation de la vraisemblance par tirages aleatoires :
% NB: Classes x Points x Tirages
valeurs_x_mus = x_min+delta_x*rand(nb_classes, 1, nb_tirages);
valeurs_y_mus = x_min+delta_x*rand(nb_classes, 1, nb_tirages);
x_donnees_centrees = repmat(x_donnees, nb_classes, 1, nb_tirages) - repmat(valeurs_x_mus, 1, n);
y_donnees_centrees = repmat(y_donnees, nb_classes, 1, nb_tirages) - repmat(valeurs_y_mus, 1, n);
% Calcul de vs
% NB: Classes x Tirages
deux_det_Sigma = prod(sigmas);
coeffs = pis / deux_det_Sigma;
vs = zeros(nb_classes, n, nb_tirages);
for k = 1:nb_classes
    x_centrees = permute(x_donnees_centrees(k, :, :), [3 2 1]);
    y_centrees = permute(y_donnees_centrees(k, :, :), [3 2 1]);
    v = coeffs(k) * exp(- (x_centrees.^2+y_centrees.^2) / deux_det_Sigma);
    vs(k, :, :) = permute(v, [2 3 1]);
end
vs = vs(:, :, transpose(find(all(sum(vs, 2) > 10^-5, 1))));
% Calcul du mélange des vraisemblances
vraisemblances_melange = sum(vs, 1);
arguments = sum(log(vraisemblances_melange), 2);
[maximum, indice_max] = max(arguments);

% Calcul des vraisemblances des donnees relativement aux deux lois normales estimees :
vraisemblances = vs(:, :, indice_max) / maximum;

% Partition des donnees :
[maximums, classes] = max(vraisemblances);

% Affichage de la partition dans l'espace (moyenne,variance) :
f2 = figure('Name','Partition','Position',[0.33*L,0,0.33*L,0.5*H]);
hold off;
xlabel('Moyenne','FontSize',20);
ylabel('Variance','FontSize',20);
for k = 1:nb_classes
    plot(x_donnees(find(classes == k)), y_donnees(find(classes == k)), '.');
    hold on;
end
axis equal;
x_min = min(x_donnees);
x_max = max(x_donnees);
y_min = min(y_donnees);
y_max = max(y_donnees);
echelle = [x_min x_max y_min y_max];
axis(echelle);

% Affichage de la partition dans l'image :
f3 = figure('Name','Segmentation par l''algorithme EM','Position',[0.66*L,0,0.33*L,0.5*H]);
hold off;
for k = 1:nb_classes
    plot(coordonnees(find(classes == k), 2), coordonnees(find(classes == k), 1),'.', 'MarkerSize',12);
    hold on;
end
axis equal;
axis off;
axis ij;
axis([1 nb_colonnes 1 nb_lignes]);

% Estimation des parametres des lois normales associees aux classes :
x_mus = zeros(1, nb_classes);
y_mus = zeros(1, nb_classes);
Sigmas = zeros(2, 2, nb_classes);
for k = 1:nb_classes
    pis(k) = length(find(classes == k))/n;
    [x_mus(k), y_mus(k), Sigmas(:, :, k)] = estimation_gaussienne(x_donnees(find(classes == k)), y_donnees(find(classes == k)));
end

% Estimation en boucle :
n_precedents = 0;
seuil = 0.0005;
while any(abs(ns-n_precedents) ./ ns > seuil)

	pause(1);
	n_precedents = ns;

	% Calcul des vraisemblances des donnees relativement aux deux lois normales estimees :
    vraisemblances = zeros(nb_classes, n);
    for k = 1:nb_classes
        inv_Sigma = inv(Sigmas(:, :, k));
        a = inv_Sigma(1, 1);
        b = inv_Sigma(1, 2);
        c = inv_Sigma(2, 2);
        x_d_c = x_donnees - x_mus(k);
        y_d_c = y_donnees - y_mus(k);
        vraisemblances(k, :) = pis(k) / (2*pi*(a*c-b^2)) * exp(- (a * x_d_c.^2 + 2*b * x_d_c .* y_d_c + c * y_d_c.^2) / 2);
    end
    
	% Partition des donnees :
    [maximums, classes] = max(vraisemblances);

	% Affichage de la partition :
	figure(f2);
	hold off;
	xlabel('Moyenne','FontSize',20);
	ylabel('Variance','FontSize',20);
	axis equal;
	axis(echelle);
    for k = 1:nb_classes
        plot(x_donnees(find(classes == k)), y_donnees(find(classes == k)), '.');
        hold on;
    end
    
	% Affichage des deux classes :
	figure(f3);
	hold off;
    for k = 1:nb_classes
        plot(coordonnees(find(classes == k), 2), coordonnees(find(classes == k), 1),'.', 'MarkerSize',12);
        hold on;
    end
	axis equal;
	axis off;
	axis ij;
	axis([1 nb_colonnes 1 nb_lignes]);

	% Estimation des parametres de la loi normale associee a chaque classe :
    for k = 1:nb_classes
        ns(k) = length(find(classes == k));
        pis(k) = ns(k) / n;
        [x_mus(k), y_mus(k), Sigmas(:, :, k)] = estimation_gaussienne(x_donnees(find(classes == k)), y_donnees(find(classes == k)));
    end
end
