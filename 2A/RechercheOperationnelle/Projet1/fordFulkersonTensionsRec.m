%% Fonction de recherche de tension maximale
% Entrées :
%		G - matrice représentant le graphe
%		Tension - tension initiale de chaque arc
%		noeudsMarques - vecteur des noeuds actuellement marqués
%		b - noeud d'arrivée
function [Tensions, maxTension] = fordFulkersonTensionsRec(Graph, Tensions, noeudsMarques, a)

%% Cas terminal : a est marqué
if noeudsMarques(a)
    maxTension = 0;
    return;
end

%% Rechercher les nouveaux noeuds à marquer
depart = 1;
arrivee = 2;
tensionMin = 4;
tensionMax = 3;
noeudsSensPositif = [];
noeudsSensNegatif = [];
for arc = 1:size(Graph, 1)
    if noeudsMarques(Graph(arc, arrivee)) && (~noeudsMarques(Graph(arc, depart)))
        noeudsSensPositif = [noeudsSensPositif arc];
    end
    if noeudsMarques(Graph(arc, depart)) && (~noeudsMarques(Graph(arc, arrivee)))
        noeudsSensNegatif = [noeudsSensNegatif arc];
    end
end

%% Si il y a des noeuds à marquer dans le sens positif
if ~isempty(noeudsSensPositif)
    minSensPositif = min(Graph(noeudsSensPositif,3) - Tensions(noeudsSensPositif));
    if minSensPositif == 0
    	minSensPositif = Inf;
    end
else
    minSensPositif = Inf;
end

%% Si il y a des noeuds à marquer dans le sens négatif
if ~isempty(noeudsSensNegatif)
     minSensNegatif = min(Tensions(noeudsSensNegatif) - Graph(noeudsSensNegatif,4));
     if minSensNegatif == 0
     	minSensNegatif = Inf;
     end
else
     minSensNegatif = Inf;
end

%% Modifier les tensions des arcs à emprunter
% Calculer le minimum à associer à chaque arc
minTotal = min(minSensPositif, minSensNegatif);

% Modifier les tensions actuelles des arcs
for i = noeudsSensPositif
    Tensions(i) = Tensions(i) + minTotal;
    if Graph(i,3) == Tensions(i)
        noeudsMarques(Graph(i,1)) = 1;
    end
end

for i = noeudsSensNegatif
    Tensions(i) = max(Graph(i, 4), Tensions(i) - minTotal);
end

%% Appel récursif
[Tensions, maxTension] = fordFulkersonTensionsRec(Graph, Tensions, noeudsMarques, a);
maxTension = maxTension + minTotal;

end

