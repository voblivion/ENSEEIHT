% Lecture d'une image JPEG
clear;

path = ['Images/' uigetfile('Images/*.jpg')];

depth = double(input('Pas d échantillonage :'));

[image, typeimage, nlig, ncol, ncan] = jpgread(path, depth);

figure('Name', path);
if strcmp(typeimage, 'ITRI')
    imshow(image/255);
else
    imshow(image, [0 255]);
end