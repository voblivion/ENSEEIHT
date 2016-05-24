function moy = moyenne(image)
image = double(image);
R = image(:, :, 1);
V = image(:, :, 2);
B = image(:, :, 3);
S = R + V + B;
R = R ./ max(S, 1);
V = V ./ max(S, 1);

moy(1, 1) = mean(R(:));
moy(1, 2) = mean(V(:));

end

