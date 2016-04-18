% Normalisation de l'image:
%  Moyenne des niveaux de gris = 0
%  Energie = 1
lecshowtrimago;

moyenne = 0; %0.5; % 0
energie = 1; %nlig * ncol * 0.2; % 1

m = mean(mean(image, 1), 2);

imn = image - repmat(m, nlig, ncol);

e = sqrt(sum(sum(abs(imn).^2, 1), 2));

imn = moyenne + imn * energie ./ repmat(e, nlig, ncol);

imshow(imn/255)