function [m, i] = dsearchn(point, empreinte, f_min, f_max, duree, mesure)

d = abs(empreinte(:, 1) - point(1));
d(:, 2) = abs(log2(empreinte(:, 2)) - log2(point(2)));

d(:, 1) = d(:, 1) / (mesure);
is = d(:, 1) > 1;
d(is, 1) = inf;
d(~is, 1) = 0;

d(:, 2) = d(:, 2) / log2(1+1/12);
is = d(:, 2) > 1;
d(is, 2) = inf;

e = (sum(d, 2)).^(1);

[m, i] = min(e);
d(i, :);

end

