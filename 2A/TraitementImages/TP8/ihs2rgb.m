function image_rgb = ihs2rgb(image_ihs)
% Fonction effectuant la conversion d'une image IHS en RGB
%
image_rgb = zeros(size(image_ihs));
M = [1/3 1/3 1/3 ; -1/2 -1/2 1 ; sqrt(3)/2 -sqrt(3)/2 0];

for i = 1:size(image_rgb, 1)
    for j = 1:size(image_rgb, 2)
        I = image_ihs(i, j, 1);
        H = image_ihs(i, j, 2);
        S = image_ihs(i, j, 3);
        if S == 0
            k = ones(3, 1) * I;
        else
            v2 = S * sin(H);
            v1 = S * cos(H);
            k = M\[I; v1; v2];
        end
        image_rgb(i, j, :) = permute(k, [2 3 1]);
    end
end
end
