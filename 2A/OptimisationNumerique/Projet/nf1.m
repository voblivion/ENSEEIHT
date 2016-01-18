function [y] = nf1(x)

    sx = [2 / (x + 2); 6 / (x + 14)];
    nsx = norm(sx);
    d = 0.5;
    y = nsx^2 - d^2;
end

