%%
% P : i x j x coords

function [vertices, faces] = s3i(vertices, faces, iter)

for i = 1:iter
    [vertices, faces] = aux(vertices, faces);
end

end

function [vertices, faces] = aux(vertices, faces)

%% Calcul des nouveaux somments
barycenters = zeros(size(faces, 1), size(vertices, 2));
% Itérer selon les faces
for f = 1:size(faces, 1)
    face = faces(f, :);
    
    % Récupérer les voisins sur les faces avec un côté en commun
    vertices_2 = [];
    % Itérer selon les côtés
    for v = 1:size(face, 2)
        % Recherche d'une face ayant seulement le côté courant en commun
        is = [1+mod(v+1, size(face, 2)) 1+mod(v+2, size(face, 2))];
        with = face(is);
        without = face(setdiff(1:size(face, 2), is));
        neighbors = faces(findFaces(faces, with, without), :);
        neighbors = neighbors(:)';
        
        % Rajouter ses sommets à ceux voisins
        vertices_2 = [vertices_2 neighbors]; %#ok<AGROW>
    end
    % Retirer les sommets "traités"
    vertices_2 = setdiff(vertices_2, face);
    
    % Récupérer les voisins sur les faces avec un sommet en commun
    vertices_1 = [];
    % Itérer selon les sommets
    for v = 1:size(face, 2)
        % Recherche d'une face ayant seulement le sommet courant en commun
        with = face(v);
        without = face([1:v-1 v+1:3]);
        neighbors = faces(findFaces(faces, with, without), :);
        neighbors = neighbors(:)';
        
        % Rajouter ses sommets à ceux voisins
        vertices_2 = [vertices_2 neighbors]; %#ok<AGROW>
    end
    % Retirer les sommets "traités"
    vertices_1 = setdiff(vertices_1, [face vertices_2]);
    
    % Création du nouveau barycentre
    b_0 = sum(vertices(face, :), 1) / length(face);
    a_0 = 32;
    if ~isempty(vertices_2)
        b_1 = sum(vertices(vertices_2, :), 1) / length(vertices_2);
        a_1 = -4;
    else
        b_1 = 0;
        a_1 = 0;
    end
    if ~isempty(vertices_1)
        b_2 = sum(vertices(vertices_1, :), 1) / length(vertices_1);
        a_2 = -1;
    else
        b_2 = 0;
        a_2 = 0;
    end
    total = a_0 + a_1 + a_2;
    barycenters(f, :) = a_0/total*b_0+a_1/total*b_1+a_2/total*b_2;
end
new_vertices = [vertices; barycenters];

%% Calcul des nouvelles faces
processed_faces = zeros(size(faces, 1), 1);
new_faces = zeros(size(faces, 1) * 3, 3);
n_f = 1;
for f = 1:size(faces, 1)
    face = faces(f, :);
    
    for k = 1:3
        ve = face(k);
        is = [mod(k, 3)+1; mod(k+1, 3)+1];
        vs = face(is);
        f_v = findFaces(faces, vs, ve);
        
        if f_v ~= 0
            if ~processed_faces(f_v)
                %% Ajouter les deux faces aux nouvelles faces
                b1 = size(vertices, 1) + f;
                b2 = size(vertices, 1) + f_v;
                new_faces(n_f, :) = [b1 b2 vs(1)];
                n_f = n_f + 1;
                new_faces(n_f, :) = [b1 b2 vs(2)];
                n_f = n_f + 1;
            end
        else
            %% Ajouter la pseudo face aux nouvelles faces
            b = size(vertices, 1) + f;
            new_faces(n_f, :) = [b vs(1) vs(2)];
            n_f = n_f + 1;
        end
    end
    
    processed_faces(f) = 1;
end
vertices = new_vertices;
faces = new_faces(1:n_f-1, :);

end

