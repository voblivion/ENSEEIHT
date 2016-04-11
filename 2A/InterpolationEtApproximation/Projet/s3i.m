function [vertices, faces] = s3i(vertices, faces, iter)
% S3I - interpolate tri-surface using sqrt-3 algorithm
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
% Auxiliary function that process one iteration

%% Calcul des nouveaux somments
barycenters = zeros(size(faces, 1), size(vertices, 2));
% Itérer selon les faces
for f = 1:size(faces, 1)
    face = faces(f, :);

    % Calcul du nombre d'apparition de chaque voisin
    weights = zeros(size(vertices, 1), 1);
    for v = 1:size(face, 2)
        ns = findNeighbors(faces, face(v));
        for n = 1:length(ns)
            weights(ns(n)) = weights(ns(n)) + 1;
        end
    end
    for v = 1:size(face, 2)
        weights(face(v)) = 0;
    end
    % Calcul des sous-barycentres
    sub_barycenters = zeros(size(face, 1), size(vertices, 2));
    for v = 1:size(face, 2)
        ns = findNeighbors(faces, face(v));
        w = 32;
        ws = zeros(size(ns));
        for n = 1:length(ns)
            ws(n) = - weights(ns(n))^2;
        end
        w_total = w + sum(ws);
        sub_barycenters(v, :) = w/w_total * vertices(face(v), :);
        for n = 1:length(ns)
            sub_barycenters(v, :) = sub_barycenters(v, :) + ws(n)/w_total * vertices(ns(n), :);
        end
    end

    barycenters(f, :) = sum(sub_barycenters) / size(sub_barycenters, 1);
end
new_vertices = [vertices; barycenters];

%% Calcul des nouvelleaaaais faces
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

