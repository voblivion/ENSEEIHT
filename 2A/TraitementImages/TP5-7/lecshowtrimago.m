% Lecture d'une image TRIMAGO
clear;

path = ['Images/' uigetfile('Images/*.tri')];

[image, typeimage, etiquette, nlig, ncol, ncan] = triread(path);

figure('Name', etiquette);
if strcmp(typeimage, 'ITRI')
    imshow(image/255);
else
    imshow(image, [0 255]);
end