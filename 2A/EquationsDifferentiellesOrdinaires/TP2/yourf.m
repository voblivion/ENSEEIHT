function ys = yourf(A, y0s, t)
    ys = expm(A*t)*y0s;
end

