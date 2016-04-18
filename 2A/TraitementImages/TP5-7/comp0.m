% Compression par annulation des coefficients de hautes fréquences
% spatiales
% Construction du masque
centrefourier;

frequences = 111;
l = zeros(1, nlig);
c = zeros(ncol, 1);
l((nlig-frequences)/2:(nlig+frequences)/2) = 1;
c((ncol-frequences)/2:(ncol+frequences)/2) = 1;
mask = c * l;

imfc0 = mask.*imfc;

im0 = real(ifft2(fftshift(imfc0)));

imagesc(im0)