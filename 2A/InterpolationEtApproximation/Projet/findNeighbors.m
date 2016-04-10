function vertices = findNeighbors(faces, vertice)
% FINDNEIGHBORS - find neighboring vertices of the given one.
% 
% vertices = findNeighbors(faces, vertice)
%
% INPUT:
%     faces: matrix whom lines represents faces and each line contains
%            indices of its vertices.
%     vertice: indice of vertice to find neighbors.
%
% OUTPUT:
%     vertices: indices of neihboring vertices.
vertices = [];
for f = 1:size(faces, 1)
    face = faces(f, :);
    if any(face == vertice)
        for v = 1:size(face, 2)
            vert = face(v);
            if vert ~= vertice && all(vertices ~= vert)
                vertices = [vertices vert]; %#ok<*AGROW>
            end
        end
    end
end
end