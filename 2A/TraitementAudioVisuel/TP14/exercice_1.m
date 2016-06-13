%% Distingue un ensemble d'enregistrements et les regroupe par voyelle reconnue

clear;
close all;

voyelles = {'a', 'e', 'e_aigu', 'e_grave', 'i', 'o', 'o_ouvert', 'ou', 'u'};
nb_enregistrements = 5;
nb_voyelles = length(voyelles);

spectres = zeros(nb_enregistrements * nb_voyelles, 882);
cepstres = zeros(nb_enregistrements * nb_voyelles, 882);
spectres_moyens = zeros(nb_voyelles, 882);
cepstres_moyens = zeros(nb_voyelles, 882);

% Calcul des spectres et cepstres moyens
for i = 1:nb_voyelles
    voyelle = voyelles{i};
    for j = 1:nb_enregistrements
        file_name = strcat('donnees/', voyelle, '_', int2str(j), '.wav');
        y = audioread(file_name);
        [spectre, cepstre] = spectre_cepstre(y, 882);
        spectres((i-1)*nb_enregistrements+j, :) = mean(spectre);
        cepstres((i-1)*nb_enregistrements+j, :) = mean(cepstre);
    end
    spectres_moyens(i, :) = mean(spectre(i:(i+nb_enregistrements-1), :));
    cepstres_moyens(i, :) = mean(cepstres(i:(i+nb_enregistrements-1), :));
end

% Classification non supervisée
idx_spectres = kmeans(spectres, nb_voyelles, 'start', spectres_moyens);
idx_cepstres = kmeans(cepstres, nb_voyelles, 'start', cepstres_moyens);
disp('Classification avant ACP :');
for i = 1:nb_voyelles
    for j = 1:nb_enregistrements
        fprintf('%d ', idx_cepstres((i-1)*nb_enregistrements+j));
    end
    fprintf('| ');
end
fprintf('\n');

% Calcul du nombre de bonnes classifications
bons_spectres = 0;
bons_s = zeros(size(idx_spectres));
bons_c = zeros(size(idx_cepstres));
bons_cepstres = 0;
for i = 1:nb_enregistrements:(nb_voyelles*nb_enregistrements)
    ids = idx_spectres(i:(i+nb_enregistrements-1));
    [m_s, n_s] = mode(ids);
    bons_s(i:(i+nb_enregistrements-1)) = ids == m_s;
    bons_spectres = bons_spectres + n_s;

    idc = idx_cepstres(i:(i+nb_enregistrements-1));
    [m_c, n_c] = mode(idc);
    bons_c(i:(i+nb_enregistrements-1)) = idc == m_c;
    bons_cepstres = bons_cepstres + n_c;
end

% Visualisation grace à ACP
moy_spectres = mean(spectres);
moy_cepstres = mean(cepstres);
spectres_centres = spectres - repmat(moy_spectres, size(spectres, 1), 1);
cepstres_centres = cepstres - repmat(moy_cepstres, size(cepstres, 1), 1);
var_cov_spectres = spectres_centres'*spectres_centres/size(spectres, 1);
var_cov_cepstres = cepstres_centres'*cepstres_centres/size(cepstres, 1);
[V_s, D_s] = eig(var_cov_spectres);
[V_c, D_c] = eig(var_cov_cepstres);
d_s = diag(D_s);
d_c = diag(D_c);
[~, I_s] = sort(d_s, 'descend');
[~, I_c] = sort(d_c, 'descend');
proj_spectres = spectres * V_s(:, I_s(1:3));
proj_cepstres = cepstres * V_c(:, I_c(1:3));

% Classification non supervisée
idx_spectres = kmeans(proj_spectres, nb_voyelles, 'start', spectres_moyens * V_s(:, I_s(1:3)));
[idx_cepstres, C_cepstres] = kmeans(proj_cepstres, nb_voyelles, 'start', cepstres_moyens * V_c(:, I_c(1:3)));
disp('Classification après ACP :');
for i = 1:nb_voyelles
    for j = 1:nb_enregistrements
        fprintf('%d ', idx_cepstres((i-1)*nb_enregistrements+j));
    end
    fprintf('| ');
end
fprintf('\n');

% Calcul du nombre de bonnes classifications
bons_spectres = 0;
bons_s = zeros(size(idx_spectres));
bons_c = zeros(size(idx_cepstres));
bons_cepstres = 0;
colors = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 0.5 0.5 0; 0 0.5 0.5];

fo = figure('Name', 'Original spectres');
f = figure('Name', 'Spectres');
go = figure('Name', 'Original cepstres');
g = figure('Name', 'Cepstres');
for i = 1:nb_voyelles
    k = (i-1)*nb_enregistrements+1;
    
    ids = idx_spectres(k:(k+nb_enregistrements-1));
    [m_s, n_s] = mode(ids);
    bons_s(k:(k+nb_enregistrements-1)) = ids == m_s;
    bons_spectres = bons_spectres + n_s;

    idc = idx_cepstres(k:(k+nb_enregistrements-1));
    [m_c, n_c] = mode(idc);
    bons_c(k:(k+nb_enregistrements-1)) = idc == m_c;
    bons_cepstres = bons_cepstres + n_c;
    
    % Affichage
    for j = 1:nb_enregistrements
        c = colors(i, :);
        d = colors(idx_spectres(k+j-1), :);
        e = colors(idx_cepstres(k+j-1), :);
        if bons_c(k+j-1)
            mc = 'o';
        else
            mc = 'x';
        end
        if bons_s(k+j-1)
            marker = 'o';
        else
            marker = 'x';
        end
        figure(fo);
        hold on;
        plot3(proj_spectres(k+j-1,1),proj_spectres(k+j-1,2),proj_spectres(k+j-1,3), 'o', 'Color', c);
        figure(f);
        hold on;
        plot3(proj_spectres(k+j-1,1),proj_spectres(k+j-1,2),proj_spectres(k+j-1,3), mc, 'Color', d);
        figure(go);
        hold on;
        plot3(proj_cepstres(k+j-1,1),proj_cepstres(k+j-1,2),proj_cepstres(k+j-1,3), 'o', 'Color', c);
        figure(g);
        hold on;
        plot3(proj_cepstres(k+j-1,1),proj_cepstres(k+j-1,2),proj_cepstres(k+j-1,3), mc, 'Color', e);
    end
end

save exercice_1;

