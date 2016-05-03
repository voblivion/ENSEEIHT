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
