% Calcul du module de la transformée de Fourier de l'image normalisée
vconjg;

imfa = abs(imfn);

xs = ((1:size(imfa, 1)) - 1) / size(imfa, 1);
ys = ((1:size(imfa, 2)) - 1) / size(imfa, 2);

figure('Name', 'coeffs de fourier');
surf(xs(1:8:end), ys(1:8:end), imfa(1:8:end, 1:8:end));

imagesc(imfa, [0 std(imfa(:))])