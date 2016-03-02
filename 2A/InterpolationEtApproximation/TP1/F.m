function p = F(P, T, t)
    l = size(P, 1);
    n = size(P, 2);
    m = size(t, 2);
    L1 = L(1, T, t);
    p = zeros(l, m);
    for k = 1:m
        p(:, k) = L1(k) * P(:, 1);
    end
    for i = 2:n
        Li = L(i, T, t);
        for k = 1:m
            p(:, k) = p(:, k) + Li(k) * P(:, i);
    end
end