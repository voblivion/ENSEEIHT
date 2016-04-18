function [image, typeimage, etiquette, nlig, ncol, ncan] = triread(path)

%% Ouverture du fichier
file = fopen(path, 'r', 'b');

%% Lecture des meta données
typeimage = fread(file, 4, 'int8=>char')';
etiquette = fread(file, 64, 'int8=>char')';
nlig = fread(file, 1, 'int32', 'ieee-be');
ncol = fread(file, 1, 'int32', 'ieee-be');
ncan = fread(file, 1, 'int32', 'ieee-be');
fread (file, ncol-80);

%% Lecture de l'image
image = fread(file);
if strcmp(typeimage,'ITRI')
    image = reshape(image, ncol, nlig, ncan);
    image = permute(image, [2 1 3]);
elseif strcmp(typeimage, 'IMON')
    image = reshape(image, ncol, nlig);
    image = permute(image, [2 1]);
end

%% Fermeture du fichier
fclose(file);

end

