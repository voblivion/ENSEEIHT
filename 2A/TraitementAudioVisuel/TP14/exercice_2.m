%% Comparaison des fichiers test à la base de données

clear;
load exercice_1;

% Lecture du son à tester
base = 'donnees/tests/';
file_name = [base uigetfile([base '*.wav'])];
[y, f] = audioread(file_name);
%sound(y, f);

% Comparaison à la base de sons
[spectre, cepstre] = spectre_cepstre(y, 882);
proj_cepstre = mean(cepstre) * V_c(:, I_c(1:3));
diff_C_cepstres = C_cepstres - repmat(proj_cepstre, size(C_cepstres, 1), 1);
dist_C_cepstres = sqrt(sum(diff_C_cepstres.^2, 2));

% Affichage du résultat
[m, idx_cepstre] = min(dist_C_cepstres);
disp(strcat('L''enregistrement "', file_name, '" est classé avec :'));
idxs = find(idx_cepstres == idx_cepstre);
for k = 1:length(idxs)
    idx = idxs(k);
    i = 1 + floor((idx - 1) / nb_enregistrements);
    j = idx - (i-1) * nb_enregistrements;
    disp(strcat(voyelles{i}, '_', int2str(j)));
end

figure(g);
hold on;
e = colors(idx_cepstre, :);
plot3(proj_cepstre(1),proj_cepstre(2),proj_cepstre(3), '*', 'Color', e);