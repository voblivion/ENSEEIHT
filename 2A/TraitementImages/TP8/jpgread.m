function [image, typeimage, nlig, ncol, ncan] = jpgread(path, depth)

image = imread(path);
image = double(image(1:depth:end, 1:depth:end, :));
nlig = size(image, 1);
ncol = size(image, 2);

if ismatrix(image)
    typeimage = 'IMON';
    ncan = 1;
elseif ndims(image) == 3
    typeimage = 'ITRI' ;
    ncan = 3 ;
end

end

