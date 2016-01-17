%% Fonction de recherche de tension maximale
% Entrées :
%		LiensSuccesseurs - Cf. fordFulkersonFlots
%		Successeurs - Cf. fordFulkersonFlots
%		TensionMin - vecteur des tensions minimales
%		TensionMax - vecteur des tensions maximales
%       a - noeud de départ
%		b - noeud d'arrivée
function [Tensions, maxTension] = fordFulkersonTensions(LiensSuccesseurs, Successeurs, TensionsMin, TensionsMax, a, b)

% Nombre de noeuds
n = size(LiensSuccesseurs, 2);
% Nombre d'arcs
m = size(Successeurs, 2);
% Ajout du 'pointeur' de fin
LiensSuccesseurs(n+1) = m + 1;

% Création de la matrice du graphe, qui sera plus facile à utiliser que les
% vecteurs LiensSuccesseurs, Successeurs, LiensPredecesseurs, et
% Predecesseurs utilisés dans fordFulkersonFlots
Graph = [];
for i = 1:n
    for j = (LiensSuccesseurs(i):LiensSuccesseurs(i+1)-1)
        Graph = [Graph; [i Successeurs(j) TensionsMax(j) TensionsMin(j)]];
    end
end
% Initialisation du vecteur des tensions et de celui des noeuds marques
Tensions = zeros(1, m);
noeudsMarques = zeros(1, n);
noeudsMarques(b) = 1;
Graph
[Tensions, maxTension] = fordFulkersonTensionsRec(Graph, Tensions', noeudsMarques, a);
end

