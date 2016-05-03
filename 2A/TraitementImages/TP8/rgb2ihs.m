function image_ihs = rgb2ihs(image_rgb)
% Fonction effectuant la conversion d'une image RGB en IHS
%
M = [1/3 1/3 1/3 ; -1/2 -1/2 1 ; sqrt(3)/2 -sqrt(3)/2 0] ;
%
nlig = size(image_rgb,1) ;
ncol = size(image_rgb,2) ;
image_ihs = zeros(nlig,ncol,3) ;
%
for nolig=1 :nlig,
	for nocol=1 :ncol,
		image_ihs(nolig,nocol, :) = M * double(squeeze(image_rgb(nolig,nocol, :))) ;
	end
end
%
v1 = image_ihs( :, :,2) ;
v2 = image_ihs( :, :,3) ;
%
H = atan2(v2,v1) ;
S = sqrt(v1.^2 + v2.^2) ;
%
image_ihs( :, :,2) = H ;
image_ihs( :, :,3) = S ;
end
