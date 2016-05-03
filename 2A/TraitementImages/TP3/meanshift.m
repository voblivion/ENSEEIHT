function [S,k] = meanshift(I,T,h,k_max,epsilon)

% Segmentation d'une image par la methode mean-shift
%
% Parametres d'entree :
%    I : image couleur a segmenter
%    T : definit le voisinage spatial
%    h : definit le voisinage colorimetrique
%    k_max : nombre maximal d'iterations
%    epsilon : definit la condition d'arret
%
% Parametres de sortie :
%    S : image segmentee
%    k : nombre d'iterations

% Dimensions de l'image :
[nb_lignes,nb_colonnes,nb_canaux] = size(I);

% Normalisation de l'image RVB :
I = double(I)/255; 

% Redimensionnement de l'image en 3 x (nb_lignes*nb_colonnes) pour la conversion en LUV :
I = transpose(reshape(I(:),nb_lignes*nb_colonnes,3));

% Conversion en LUV :
I_LUV = rgb2luv(I);

% Redimensionnement de l'image en nb_lignes x nb_colonnes x 3 :
I_LUV = reshape(transpose(I_LUV),nb_lignes,nb_colonnes,nb_canaux);

% Initialisation du nombre d'iterations :
k = 1;

% Carte indiquant les points pour lesquels l'approche a converge :
deja_converge = zeros(nb_lignes,nb_colonnes);

% Tant que tous les points ne sont pas arrives a convergence
% et que le nombre maximal d'iterations n'a pas ete atteint :
while min(deja_converge(:))==0 & k<=k_max
    for i = 1:nb_lignes
        for j = 1:nb_colonnes
            if deja_converge(i,j)==0

                % Recuperation et vectorisation de la couleur du pixel courant :
                couleur = permute(I_LUV(i, j, :), [3 1 2]);
                
                % Coordonnees des pixels pris en compte pour calculer la couleur moyenne :
                % (attention a respecter les limites de l'image !)
                % - numeros_lignes contient la liste des numeros de lignes
                % - numeros_colonnes contient la liste des numeros de colonnes
                numeros_lignes = max(1, i-T):min(i+T, nb_lignes);
                nl = size(numeros_lignes, 2);
                numeros_colonnes = max(1, j-T):min(j+T, nb_colonnes);
                nc = size(numeros_colonnes, 2);

                % Recuperation de la sous-image correspondante,
                % de dimensions length(numeros_lignes) x length(numeros_colonnes) x 3 :
                sous_image = I_LUV(numeros_lignes, numeros_colonnes, :);

                % Pour faciliter les calculs, redimensionnement de la sous-image
                % en 3 x (length(numeros_lignes)*length(numeros_colonnes)) :
                sous_image = transpose(reshape(sous_image(:),nl*nc, 3));
                
                % Distance euclidienne entre la couleur de p et celle de chaque pixel du bloc :
                distance = sqrt(sum((sous_image - repmat(couleur, 1, nl*nc)).^2, 1));
                
                % Detection des pixels du bloc situes dans S_h(x) :
                pixels_S_h = find(distance < h);
                
                % Calcul de la couleur moyenne de ces pixels :
                couleur_moyenne = mean(sous_image(:, pixels_S_h), 2); %#ok<FNDSB>

                % L'iteration a-t-elle converge ?
                deja_converge(i, j) = norm(couleur - couleur_moyenne) < epsilon;
                
                % Remplacement de la couleur par la moyenne (mean-shift) :
                I_LUV(i, j, :) = permute(couleur_moyenne, [2, 3, 1]);
            end
        end
    end
    k = k+1;
end

% Conversion en RVB :
S = transpose(I_LUV(:));
S = transpose(reshape(S,length(S)/3,3));
S = luv2rgb(S);
S = reshape(transpose(S),nb_lignes,nb_colonnes,nb_canaux);
