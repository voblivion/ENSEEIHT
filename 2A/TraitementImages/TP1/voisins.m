%% voisins
%   Calcule la liste des indices des voisins des points dans une matrice.
%
%   Les matrices d'indices, à trois dimmension, sont comblées par les
%   indices des points courants.

function [v_i, v_j] = voisins(nb, nb_lignes, nb_colonnes)
    v_i = zeros(nb_lignes, nb_colonnes, nb);
    v_j = zeros(nb_lignes, nb_colonnes, nb);
    
    for i = 1:nb_lignes
        for j = 1:nb_colonnes
            % ajout des voisins tangents
            if i ~= 1
                v_i(i, j, 1) = i-1;
                v_j(i, j, 1) = j;
            else
                v_i(i, j, 1) = i;
                v_j(i, j, 1) = j;
            end
            if i ~= nb_lignes
                v_i(i, j, 2) = i+1;
                v_j(i, j, 2) = j;
            else
                v_i(i, j, 2) = i;
                v_j(i, j, 2) = j;
            end
            if j ~= 1
                v_i(i, j, 3) = i;
                v_j(i, j, 3) = j-1;
            else
                v_i(i, j, 3) = i;
                v_j(i, j, 3) = j;
            end
            if j ~= nb_colonnes
                v_i(i, j, 4) = i;
                v_j(i, j, 4) = j+1;
            else
                v_i(i, j, 4) = i;
                v_j(i, j, 4) = j;
            end
            % ajout des voisins diagonaux (Potts 8)
            if nb == 8
                if i ~= 1 && j ~= 1
                    v_i(i, j, 5) = i-1;
                    v_j(i, j, 5) = j-1;
                else
                    v_i(i, j, 5) = i;
                    v_j(i, j, 5) = j;
                end
                if i ~= 1 && j ~= nb_colonnes
                    v_i(i, j, 6) = i-1;
                    v_j(i, j, 6) = j+1;
                else
                    v_i(i, j, 6) = i;
                    v_j(i, j, 6) = j;
                end
                if i ~= nb_lignes && j ~= 1
                    v_i(i, j, 7) = i+1;
                    v_j(i, j, 7) = j-1;
                else
                    v_i(i, j, 7) = i;
                    v_j(i, j, 7) = j;
                end
                if i ~= nb_lignes && j ~= nb_colonnes
                    v_i(i, j, 8) = i+1;
                    v_j(i, j, 8) = j+1;
                else
                    v_i(i, j, 8) = i;
                    v_j(i, j, 8) = j;
                end
            end
        end
    end
end