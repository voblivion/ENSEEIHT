function Li = L(i, T, t)
    n = size(T, 2);
    m = size(t, 2);
    Li = ones(1, m);
    for j = 1:n
        if j ~= i
            Li = Li .* (t - T(j)) / (T(i) - T(j));
        end
    end
end