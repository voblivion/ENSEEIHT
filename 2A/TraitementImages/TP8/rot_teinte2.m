% Rotation de teinte sur une image trimago ou jpeg
% On utilise le codage IH1H2S
%
% Lecture d'une image trimago ou jpeg
%
lecimage ;
%
% Codage IH1H2S
image_ihs = rgbw2ih1h2s(im) ;
%
disp('Désigner une couleur à remplacer') ;
[y1,x1] = ginput (1) ;
x1 = round(x1) ;
y1 = round(y1) ;
disp(['x1 = ', num2str(x1),' y1= ',num2str(y1)]) ;
%
psi1d = (image_ihs(x1,y1,2)/pi)*180 ; % psi1 en degres
theta1d = (image_ihs(x1,y1,3)/pi)*180 ; % theta1 en degres
disp(['Angle azimutal de la teinte à remplacer : ',num2str(psi1d),' degrés']) ;
disp(['Angle de site de la teinte à remplacer : ',num2str(theta1d),' degrés']) ;
%
disp(' ') ;
%
disp('Désigner une couleur de remplacement') ;
[y2,x2] = ginput (1) ;
x2 = round(x2) ;
y2 = round(y2) ;
disp(['x2 = ', num2str(x2),' y2= ',num2str(y2)]) ;
%
psi2d = (image_ihs(x2,y2,2)/pi)*180 ; % psi2 en degres
theta2d = (image_ihs(x2,y2,3)/pi)*180 ; % theta2 en degres
disp(['Angle azimutal de la teinte de remplacement : ',num2str(psi2d),' degres']) ;
disp(['Angle de site de la teinte de remplacement : ',num2str(theta2d),' degres']) ;
%
% Calcul des angles de rotation
psi = ? ?
psid = ? ? %psi en degres
theta = ? ?
thetad = ? ? %theta en degres
%
image_ihs( :, :,2) = ? ?
image_ihs( :, :,3) = ? ?
% Codage RGB
image_rgb = ih1h2s2rgb(image_ihs) ;
image_rgb = image_rgb( :, :,1 :3) ;
%
him = figure ('BackingStore','off ','Name',['Rotation de teinte de ( ',num2str(psid),' , ',num2str(thetad), ' ) de-
gres'],'Units','pixels') ;
imshow(image_rgb/255) ;
%image_rgb = image_rgb.*(image_rgb > =0) + (255-image_rgb).*(image_rgb > 255) ;
%image(image_rgb/255) ;
