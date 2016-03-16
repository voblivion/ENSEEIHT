function pts = Bezier(Points, tps)
    q = repmat(Points, 1, 1, size(tps, 2));
    m = size(Points, 1);
    n = size(Points, 2);
    tps = permute(repmat(tps, m, 1, n), [1 3 2]);
    itps = 1 - tps;
    for k = 1:n-1
        q(:,1:n-k,:) = itps(:,1:n-k,:) .* q(:,1:n-k,:) + tps(:,2:n-k+1,:) .* q(:,2:n-k+1,:);
    end
    pts = permute(q(:,1,:), [1 3 2]);
end