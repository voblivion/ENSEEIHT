% Lecture d'une image au format TRIMAGO ou au format JPEG
%
NOMFIC = uigetfile('Images/*.*') ;
suffixe = NOMFIC(find(NOMFIC=='.')+1 :length(NOMFIC)) ;
path = ['Images/' NOMFIC];
if strcmp(suffixe,'tri')
	[im, typeimage, etiquette, nlig, ncol, ncan] = triread(path);
elseif strcmp(suffixe,'jpg')
	[im, typeimage, nlig, ncol, ncan] = jpgread(path, 4);
else
	disp('ERREUR')
	return
end
figure('Name', 'Image originale');
imshow(im/255);

% Transformation en ihs
im_ihs = rgb2ihs(im);
figure('Name', 'Image ihs');
imshow(im_ihs(:,:,3));

% Transformation inverse en rgb
im_rgb = ihs2rgb(im_ihs);
figure('Name', 'Image inverse rgb');
imshow(im_rgb/255);
