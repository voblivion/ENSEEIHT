% Decodage d'une image d'intensité JPEG SANS utiliser la table de
% quantification
%
% En entrée jobj est une structure comportant 14 champs décrivant l'image
% jpeg (non décodée)
%
%jobj.image_width,
%jobj.image_height,
%jobj.image_components,
%jobj.image_color_space,
%jobj.jpeg_components,
%jobj.jpeg_color_space,
%jobj.comments,
%jobj.coef_arrays,
%jobj.quant_tables,
%jobj.ac_huff_tables,
%jobj.dc_huff_tables,
%jobj.optimize_coding,
%jobj.comp_info,
%jobj.progressive_mode
%
clear;
path = 'Images/Lena.jpg';

I = imread(path);
subplot(1, 2, 1);
imshow(I);
pause(0.1);

jobj = jpeg_read(path);
coeffs = cell2mat(jobj.coef_arrays);
nlin = size(coeffs, 1);
ncol = size(coeffs, 2);
J = zeros(nlin, ncol);
for i = 1:8:nlin
    for j = 1:8:ncol
        J(i:i+7, j:j+7) = idct2(coeffs(i:i+7, j:j+7));
%         for ki = 0:7
%             for kj = 0:7
%                 for li = 0:7
%                     for lj = 0:7
%                         J(i+li,j+lj) = J(i+li,j+lj) + coeffs(i+ki,j+kj)*cos(pi/8*(ki+1/2)*li)*cos(pi/8*(kj+1/2)*lj);
%                     end
%                 end
%             end
%         end
    end
end
subplot(1, 2, 2);
imagesc(J);