%% Fonction de recherche de flot maximal
% Entrées :
%		LiensSuccesseurs    - Par noeud, indice de la position dans
%                             Successeurs du premier arc qui en part 
%		Successeurs         - Noeuds d'arrivée par arc
%		FlotsMax            - Flot maximal par arc
%		a                   - Noeud de départ
%       b                   - Noeud d'arrivée
% Sorties :
%       Flots               - Flots par arc maximisant le flot entre a et b
%       maxFlots            - Flots total partant de a et arrivant en b
function [Flots, maxFlots] = fordFulkersonFlots(LiensSuccesseurs, Successeurs, FlotsMax, a, b)

% Nombre de noeuds
n = size(LiensSuccesseurs, 2);
% Nombre d'arcs
m = size(Successeurs, 2);
% Ajout du 'pointeur' de fin
LiensSuccesseurs(n+1) = m + 1;

% Calcul des arc inverses (~= LiensPredecesseur -> Predecesseur)
[Predecesseurs, LiensPredecesseurs, ASP, APS] = calculerPredecesseurs(Successeurs, LiensSuccesseurs);
LiensPredecesseurs(n+1) = size(Predecesseurs, 2) + 1;

Flots = zeros(1, m);

%% Création du Flot tant qu'on peut améliorer celui couramment trouvé
%
% Tant qu'on a trouvé un cycle à ajouter au flot total (Flots), on essaye
% de rechercher un nouveau cycle
%
TRUE = 1; FALSE = 0;
ameliorable = TRUE;
while ameliorable
    %% Recherche d'un cylce
    %
    % Vecteur cycle initial : il part de 'a'
    noeudsMarques = [a];
    % Numéros des arcs suivis
    indicesArcsSuivis = [];
    % Sens dans lesquels ont été parcourus les arcs suivis (+1 / -1)
    sensArcsSuivis = [];
    % Minimum de poids assignable sur les arcs suivis
    minArcsSuivis = [max(FlotsMax)];
    % Sommet courant
    x = a;
    
    % Indice de l'arc courant, vaut 0 au début de chaque recherche d'un
    % nouveau cycle à ajouter au Flot
    indice0 = 0;
    % Sens de l'arc courant, vaut True au début de chaque recherche d'un
    % nouveau cycle à ajouter au Flot
    sens0 = true;
    
    %% Calcul du noeud suivant tant qu'on n'est pas arrivé en 'b'
    while (x ~= b) & ameliorable
        %% Recherche du noeud suivant
        %
        % Numéros des arcs partant du noeud courant dans le sens positif
        liensSuccesseursX = (LiensSuccesseurs(x):LiensSuccesseurs(x+1)-1);
        % Numéros des arcs partant du noeud courant dans le sens négatif
        liensPredecesseursX = (LiensPredecesseurs(x):LiensPredecesseurs(x+1)-1);
        % Détermine si on a pu trouver un noeud accessible ou non
        prochainNoeudTrouve = FALSE;
        
        % Indices de l'arc à suivre (on le cherche plus bas)
        arc = 0;
        % Numéro du prochain noeud (on le cherche plus bas)
        y = 0;
        
        % On commence par rechercher un arc à prendre parmi les arcs à sens
        % positif, sauf si on revient d'une impasse et que le sens pris
        % était négatif
        if sens0
            % On reprend après le dernier numéro d'arc pris pour être
            % certain de ne pas le reprendre puisque c'est une impasse
            % (dans le cas où on ne revient pas d'une impasse il vaut le
            % dernier indice d'arc accessible depuis le noeud précédent)
            for i = liensSuccesseursX(liensSuccesseursX > indice0)
                % Réupération du noeud au bout de l'arc qu'on regarde
                y = Successeurs(i);
                % C'est un arc valide si le noeud au bout n'est pas déjà
                % marqué ET si son flot maximal n'est pas encore atteint
                yDejaMarque = any(abs(noeudsMarques-y) < 1e-10);
                if ~yDejaMarque & Flots(i) < FlotsMax(i)
                    % Calcul du minimum de flots disponible une fois au
                    % nouveau noeud
                    minArcsSuivis = [minArcsSuivis min(minArcsSuivis(size(minArcsSuivis, 2)), FlotsMax(i) - Flots(i))];
                    prochainNoeudTrouve = TRUE;
                    sens0 = TRUE;
                    arc = i;
                    break;
                end
            end
            % Initialiser indice0 correctement pour partir du début des
            % arcs 'retour' depuis le noeud courant
            if ~prochainNoeudTrouve
                if size(liensPredecesseursX, 2) > 0
                    indice0 = liensPredecesseursX(1) - 1;
                else
                    indice0 = 0;
                end
            end
        end
        % Sinon (si on reprend dans le sens négatif de retour d'une impasse
        % ou si on nsens'a pas trouvé d'arc valable dans le sens positif) alors
        % on recherche un arc dans les arcs à sens négatifs
        if (~prochainNoeudTrouve)
            % Recherche d'un éventuel arc à suivre parmi ceux dans le sens
            % négatif depuis le noeud courant
            for j = liensPredecesseursX(liensPredecesseursX > indice0)
                % Réupération du noeud au bout de l'arc qu'on regarde
                y = Predecesseurs(j);
                
                % C'est un arc valide si le noeud au bout n'est pas déjà
                % marqué ET si son flot minimal n'est pas encore atteint
                yDejaMarque = any(abs(noeudsMarques-y) < 1e-10);
                if (~yDejaMarque) & (Flots(APS(j)) > 0)
                    % Calcul du minimum de flots disponible une fois au
                    % nouveau noeud
                    minArcsSuivis = [minArcsSuivis min(minArcsSuivis(size(minArcsSuivis, 2)), Flots(APS(j)))];
                    prochainNoeudTrouve = TRUE;
                    sens0 = FALSE;
                    arc = j;
                    break;
                end
            end
        end
        %% Si on a trouvé un arc valable
        if prochainNoeudTrouve
            % Ajout du nouveau sommet à la liste des sommets suivis
            % (sommets marqués)
            noeudsMarques = [noeudsMarques y];
            % Ajout du nouvel arc à la liste des arcs empruntés
            indicesArcsSuivis = [indicesArcsSuivis arc];
            % Ajout du sens de l'arc emprunté à la liste associée
            sensArcsSuivis = [sensArcsSuivis sens0];
            
            % On change le sommet courant pour celui nouvellement trouvé
            x = y;
            % On repartira du débuts des arcs du nouveau sommet donc pour
            % en être certain on met indice0 à 0 (car 0 est forcément
            % inférieur à tout premier arc issu d'un sommet quelconque)
            indice0 = 0;
            % On repartira du nouveau sommet en commençant par rechecher
            % l'arc suivant parmi les arcs qui en partent dans le sens
            % positif
            sens0 = TRUE;
        else
            %% Sinon on est dans une impasse
            % On retire le sommet courant de la liste des sommets marqués
            noeudsMarques = noeudsMarques(1:size(noeudsMarques, 2) - 1);
            %% Si on n'a pas retiré 'a' il peut rester une solution
            if size(noeudsMarques) > 0
                % Actualiser le sommet courant pour le précédent
                x = noeudsMarques(size(noeudsMarques, 2));
                % On met indice0 à l'indice de l'arc qu'on avait emprunté
                % depuis le sommet précédent (le x du dessus) pour vérifier
                % les arcs qu'on n'avait pas encore testé
                indice0 = indicesArcsSuivis(size(indicesArcsSuivis, 2));
                indicesArcsSuivis = indicesArcsSuivis(1:size(indicesArcsSuivis, 2) - 1);
                % Idem pour le sens des des arcs suivi, pour être certain
                % de repartir dans le même sens que celui de l'arc qu'on
                % avait trouvé
                sens0 = sensArcsSuivis(size(sensArcsSuivis, 2));
                sensArcsSuivis = sensArcsSuivis(1:size(sensArcsSuivis, 2) - 1);
                minArcsSuivis = minArcsSuivis(1:size(minArcsSuivis, 2) - 1);
            else
                %% Sinon on ne peut plus améliorer le Flots
                ameliorable = FALSE;
            end
        end
    end
    
    %% Si on a trouvé un cycle à ajouter au Flots
    if ameliorable
        %% Recherche du poids à associer au cycle qu'on vient de trouver
        minFlots = min(minArcsSuivis);
        flot = zeros(1, m);
        %% Création du cycle à ajouter au Flots à partir des arcs marqués
        for k = (1:size(indicesArcsSuivis, 2))
            if(sensArcsSuivis(k))
                flot(indicesArcsSuivis(k)) = 1;
            else
                flot(APS(indicesArcsSuivis(k))) = -1;
            end
        end
        Flots = Flots + minFlots * flot;
        % FlotsMax
    end
    %% Calcul de la somme du flot partant de a (et donc arrivant en b)
    maxFlots = sum(Flots(LiensSuccesseurs(x):LiensSuccesseurs(x+1)-1));
end