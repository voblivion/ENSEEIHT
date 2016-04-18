% Verification de la conservation de l'energie par fft2n
fft2n;

e1 = sqrt(sum(sum(abs(imn).^2, 1), 2));
e2 = sqrt(sum(sum(abs(imn).^2, 1), 2));

if e1 == e2
    disp('Conservation ok !');
else
    disp('No conservation !');
end

