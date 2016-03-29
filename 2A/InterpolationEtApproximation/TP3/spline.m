function pts = spline(P, k, n)

pts = P;

for i = 1:k
    %% Dupliquer les points
    tmp = zeros(size(pts, 1), 2 * size(pts, 2));
    for j = 1:size(pts, 2)
        tmp(:, 2 * j - 1) = pts(:, j);
        tmp(:, 2 * j) = pts(:, j);
    end
    pts = tmp;

    %% Itérer selon le degré demandé
    for j = 1:n
        tmp = (pts(:, 1:size(pts, 2)-1) + pts(:, 2:size(pts, 2))) / 2;
        pts = [pts(:, 1) tmp pts(:, size(pts, 2))];
    end

end

