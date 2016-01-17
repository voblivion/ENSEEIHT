%% Retourne pour un indice d'arc donné le noeud à l'origine
function [noeud] = predecesseur(position, LiensSuccesseurs)
    noeud = 1;
    while noeud + 1 <= size(LiensSuccesseurs, 2) && LiensSuccesseurs(noeud + 1) <= position
        noeud = noeud + 1;
    end
end
%