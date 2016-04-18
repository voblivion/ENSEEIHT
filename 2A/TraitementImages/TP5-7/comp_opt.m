% Compression par annulation des coefficients de Fourier de plus faibles poids
%
centrefourier;
eps = 0.002;
n = norm(imfc, 'fro');
imfc1 = zeros(size(imfc));
imfca = imfb(:);
m = 0;
err = (n - m) / n;

while err > eps
    [ma, i] = max(imfca);
    imfc1(i) = imfc(i);
    imfca(i) = 0;
    m = sqrt(m^2 + ma^2);
    err = (n - m) / n;
end

im1 = real(ifft2(fftshift(imfc1)));

disp(err);
imagesc(im1)