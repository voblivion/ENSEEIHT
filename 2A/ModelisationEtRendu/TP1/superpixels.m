function [idx, C] = superpixels(I, k, m, maxiter)
    
    %% Initialisation des données
    [n1, n2, n3] = size(I);
    X = zeros(n1 * n2, 5);
    p = 1;
    for i = 1:n1
        for j = 1:n2
            X(p, :) = [i j I(i, j, 1) I(i, j, 2) I(i, j, 3)];
            p = p + 1;
        end
    end
    
    %% Initialisation des centres
    surface_moyenne = n1 * n2 / k;
    cote_moyen = floor(sqrt(surface_moyenne)) + 1;
    S = ceil(cote_moyen / 2);
    padding = floor(cote_moyen / 2);
    nb_lignes = ceil(n1 / cote_moyen);
    nb_colonnes = ceil(n2 / cote_moyen);
    start = zeros(k, 5);
    p = 1;
    for i = 1:nb_lignes
        for j = 1:nb_colonnes
            ligne = min(padding + (i-1) * cote_moyen, n1);
            colonne = min(padding + (j-1) * cote_moyen, n2);
            start(p, :) = [ligne colonne I(ligne,colonne,1) I(ligne,colonne,2) I(ligne,colonne,3)];
            p = p + 1;
            if p > k
                break;
            end
        end
        if p > k
            break;
        end
    end
    
    %% Modification des données pour adapter la distance
    X(:, 1:2) = X(:, 1:2) * m / S;
    start(:, 1:2) = start(:, 1:2) * m / S;
    
    [idx, C] = kmeans(X, k, 'start', start, 'maxiter', maxiter);
    
    %% Modification inverse des données
    C(:, 1:2) = C(:, 1:2) * S / m;
end