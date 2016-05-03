% Construction de l'anneau des teintes
%
nlig = 256 ;
ncol = 256 ;
image_ihs = zeros(nlig,ncol,3) ;
cx = 128 ;
cy = 128 ;
Rmin = 30 ;
Rmax = 80 ;
%
for i = 1 :nlig
	for j=1 :ncol
		dist = sqrt((i-cx)^2 + (j-cy)^2) ;
		if Rmin <= dist && dist <= Rmax
			image_ihs(i,j,1) = 160 ;
			image_ihs(i,j,3) = 255 ;
			sintheta = (cx-i)/dist ;
			costheta = (j-cy)/dist ;
			angle = atan2(sintheta,costheta) ;
			image_ihs(i,j,2) = angle ;
		else
			image_ihs(i,j,1) = 0 ;
			image_ihs(i,j,3)= 0 ;
		end
	end
end
%
image_rgb = ihs2rgb(image_ihs) ;
him = figure ('Name','Anneau des teintes','Units','pixels') ;
imshow(image_rgb/255) ;
