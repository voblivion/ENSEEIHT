function [vertices, faces] = s3a(vertices, faces, iter)
% S3A - find faces containing with and not without.
% 
% [vertices, faces] = s3a(vertices, faces, iter)
%
% INPUT:
%     vertices: matrix whom lines represents vertices coordinates.
%     faces: matrix whom lines represents faces and each line contains
%            indices of its vertices.
%     iter: number of iterations.
%
% OUTPUT:
%     vertices: new vertices.
%     faces: new faces.
for i = 1:iter
    [vertices, faces] = aux(vertices, faces);
end

end

function [vertices, faces] = aux(vertices, faces)
% Auxiliary function that process on iteration (2 ?)

%% Calcul des nouveaux somments
barycenters = zeros(size(faces, 1), size(vertices, 2));
for f = 1:size(faces, 1)
    barycenters(f, :) = mean(vertices(faces(f, :), :));
end

%% Replacement des anciens sommets
new_vertices = vertices;
for v = 1:size(vertices, 1)
    neighbors = findNeighbors(faces, v);
    n = length(neighbors);
    alpha_n = (4 - 2 * cos(2 * pi / n)) / 9;
    new_vertices(v, :) = (1 - alpha_n) * vertices(v, :) + alpha_n * sum(vertices(neighbors, :)) / n;
end

%% Ajout des nouveaux sommets aux anciens
new_vertices = [new_vertices; barycenters];

%% Calcul des nouvelles faces
processed_faces = zeros(size(faces, 1), 1); % faces déjà traitées
new_faces = zeros(size(faces, 1) * size(faces, 2), 3); % nouvelles faces
n_f = 1; % numéro courant de la nouvelle faces
% Pour chaque face...
for f = 1:size(faces, 1)
    face = faces(f, :);
    
    % Pour chaque côté de la face...
    for k = 1:size(faces, 2)
        % Recherche d'une face ayant le côté courant en commun
        without = face(k);
        with = face([mod(k, size(faces, 2))+1; mod(k+1, size(faces, 2))+1]);
        f_v = findFaces(faces, with, without); % face voisine
        
        if f_v ~= 0
            % Si une telle face existe...
            if ~processed_faces(f_v)
                % Et si cette face n'a pas déjà été traité, créer deux nouvelles faces
                b1 = size(vertices, 1) + f; % barycentre de la face courante
                b2 = size(vertices, 1) + f_v; % barycentre de la face voisine
                new_faces(n_f, :) = [b1 b2 with(1)];
                n_f = n_f + 1;
                new_faces(n_f, :) = [b1 b2 with(2)];
                n_f = n_f + 1;
            end
        else
            % Sinon si il n'existe pas de telle face, créer une seule nouvelle face
            b = size(vertices, 1) + f;
            new_faces(n_f, :) = [b with(1) with(2)];
            n_f = n_f + 1;
        end
    end
    
    % Marquer la face courante comme traitée
    processed_faces(f) = 1;
end
vertices = new_vertices;
faces = new_faces(1:n_f-1, :);

end

