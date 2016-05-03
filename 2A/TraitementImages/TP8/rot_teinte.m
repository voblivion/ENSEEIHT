% Rotation de teinte sur une image trimago ou jpeg
%
% Lecture d'une image trimago ou jpeg
%
lecimage ;
%
% Codage IHS
image_ihs = rgb2ihs(im) ;
sauv = image_ihs ;
%
disp('Désigner une couleur à remplacer') ;
[y1,x1] = ginput (1) ;
x1 = round(x1) ;
y1 = round(y1) ;
disp(['x1 = ', num2str(x1),' y1= ',num2str(y1)]) ;
angle1d = (image_ihs(x1,y1,2)/pi)*180 ;
disp(['Angle de la teinte à remplacer : ',num2str(angle1d),' degrés ** teinte : ',teinte(angle1d)]) ;
%
disp(' ') ;
%
disp('Désigner une couleur de remplacement') ;
[y2,x2] = ginput (1) ;
x2 = round(x2) ;
y2 = round(y2) ;
disp(['x2 = ', num2str(x2),' y2= ',num2str(y2)]) ;
angle2d = (image_ihs(x2,y2,2)/pi)*180 ;
disp(['Angle de la teinte de remplacement : ',num2str(angle2d),' degrés ** teinte : ',teinte(angle2d)]) ;
%
% Calcul de l'angle de rotation
theta0 = image_ihs(x1,y1,2) - image_ihs(x2,y2,2) ;
theta0d = num2str((theta0/pi)*180) ;
%
image_ihs( :, :,2) = image_ihs( :, :,2) - theta0 ;
image_rgb = ihs2rgb(image_ihs) ;
%
him = figure ('BackingStore','off ','Name',['Rotation de teinte de ',num2str(theta0d), ' degres'],'Units','pixels') ;
imshow(image_rgb/255) ;
