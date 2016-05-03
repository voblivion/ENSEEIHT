function image_ihs = rgbw2ih1h2s(image_rgb)
%
% Fonction effectuant la conversion d'une image RGBW en IH1H2S
% W = White (Blanc)
%
% Au départ, on a une image rgb : image_rgb
%
% Prétraitement : Passage de RGB à RGBW
% Pour cela, on retire tout le blanc possible de RGB et on le met dans W
R = image_rgb( :, :,1) ;
G = image_rgb( :, :,2) ;
B = image_rgb( :, :,3) ;
W = min(R,G) ;
image_rgb( :, :,4) = min(W,B) ;
%
for k = 1 :3
	image_rgb( :, :,k) = image_rgb( :, :,k) -image_rgb( :, :,4) ;
end
%
M = [1/3 1/3 1/3 1/3 ; -1/3 -1/3 -1/3 1 ; -1/2 -1/2 1 0 ; sqrt(3)/2 -sqrt(3)/2 0 0] ;
% (M (4,4) n'est pas orthogonale)
%
nlig = size(image_rgb,1) ;
ncol = size(image_rgb,2) ;
image_ihs = zeros(nlig,ncol,4) ;
%
for nolig=1 :nlig,
	for nocol=1 :ncol,
		image_ihs(nolig,nocol, :) = M * double(squeeze(image_rgb(nolig,nocol, :))) ;
	end
end
%
v1 = image_ihs( :, :,2) ;
v2 = image_ihs( :, :,3) ;
v3 = image_ihs( :, :,4) ;
%
H1 = atan2(v3,v2) ;
S = sqrt(v1.^2 + v2.^2 + v3.^2) ;
H2 = asin(v1./S) ;
%
image_ihs( :, :,2) = H1 ;
image_ihs( :, :,3) = H2 ;
image_ihs( :, :,4) = S ;
end
