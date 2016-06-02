function ys = myf(A, y0, ts)
    ys = zeros(length(y0), length(ts));
    for i = 1:length(ts);
        t = ts(i);
        ys(:, i) = expm(A*t)*y0;
    end
end

