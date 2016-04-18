lecshowtrimago;

imf = fft2(image);

imfc = fftshift(imf);

imfb = abs(imfc);

imagesc(imfb, [0 std(imfb(:))])

imb = ifft2(imfc);

imagesc(imb, [0 std(imb(:))])

for i = 1:nlig
    for j = 1:ncol
        if abs(imb(i, j) - (-1)^(i+j) * image(i, j)) > 0.0001
            disp('ERROR');
        end
    end
end