function [P, LP, ASP, APS] = calculerPredecesseurs(S, LS)
    % S : Successeurs (ie: noeuds atteints par les arcs)
    % LS : LiensSuccesseurs (ie: premier arc des noeuds)
    
    % Nombre de noeuds
    n = size(LS, 2) - 1;
    % Nombre d'arcs
    m = size(S, 2);
    % Predecesseurs (ie: noeuds à l'origine des arcs)
    P = [];
    % LiensPredecesseurs (ie: premier arc 'retour' des noeuds)
    LP = [];
    % Permutation Arcs Successeurs / Arcs Predecesseurs
    ASP= zeros(1, m);
    % Permutation Arcs Predecesseurs / Arcs Successeurs
    APS= [];
    
    % Premier arc 'retour' du noeud courant
    premierArcP = 1;
    for origine = (1:n)
        LP = [LP premierArcP];
        for arc = (1:m)
            if S(arc) == origine
                APS = [APS arc];
                ASP(arc) = premierArcP;
                P = [P predecesseur(arc, LS)];
                premierArcP = premierArcP + 1;
            end
        end
    end
    LP = [LP (m+1)];
end