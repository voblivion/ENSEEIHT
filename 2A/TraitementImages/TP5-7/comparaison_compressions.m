% Comparaisons compressions 0 et opt
%
centrefourier;
subplot(1, 3, 1);
imagesc(image);

%% VERSION 1
frequences = 111;
l = zeros(1, nlig);
c = zeros(ncol, 1);
l(ceil((nlig-frequences)/2):1:floor((nlig+frequences)/2)) = 1;
c(ceil((ncol-frequences)/2):1:floor((ncol+frequences)/2)) = 1;
mask = c * l;

imfc0 = mask.*imfc;

im0 = real(ifft2(fftshift(imfc0)));

fprintf('Erreur masque hautes fréquences :\n');
fprintf('\t%f\n', (norm(imfc, 'fro') - norm(imfc0, 'fro')) / norm(imfc, 'fro'));
subplot(1, 3, 2);
imagesc(im0)

%% VERSION 2
eps = 0.002;
n = norm(imfc, 'fro');
imfc1 = zeros(size(imfc));
imfca = imfb(:);
m = 0;
err = (n - m) / n;
for k = 1:length(find(mask))
    [ma, i] = max(imfca);
    imfc1(i) = imfc(i);
    imfca(i) = 0;
    m = sqrt(m^2 + ma^2);
    err = (n - m) / n;
end

im1 = real(ifft2(fftshift(imfc1)));

fprintf('Erreur masque faibles poids :\n');
fprintf('\t%f\n', err);
subplot(1, 3, 3);
imagesc(im1)