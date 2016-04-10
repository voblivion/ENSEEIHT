function is = findFaces(faces, with, without)
% FINDFACES - find faces containing with and not without.
% 
% is = findFaces(faces, with, withou)
%
% INPUT:
%     faces: matrix whom lines represents faces and each line contains
%            indices of its vertices.
%     with: indices of vertices to be in collected faces.
%     without: indices of vertices not to be in collected faces.
%
% OUTPUT:
%     is: indices of collected faces.
is = [];
for i = 1:size(faces, 1)
    face = faces(i, :);
    ok = 1;
    for j = 1:length(with);
        if all(face - with(j) ~= 0)
            ok = 0;
            break;
        end
    end
    if ok
        for j = 1:length(without)
            if any(face - without(j) == 0)
                ok = 0;
                break;
            end
        end
    end
    if ok
        is = [is i]; %#ok<*AGROW>
    end
end
end