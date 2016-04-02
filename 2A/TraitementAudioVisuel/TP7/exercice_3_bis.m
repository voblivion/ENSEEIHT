clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres GVF :
mu_GVF = 2; 				% Parametre du modele GVF
gamma_GVF = 0.05; 			% Parametre du modele GVF
nb_iterations_GVF = 500;		% Nombre d'iterations pour le calcul du GVF

% Parametres du modele :
alpha = 0.001;				% Poids de la penalisation de la longueur
beta = 0.0001;				% Poids de la penalisation de la courbure

% Parametre de la descente de gradient :
gamma = 1;				% Pas de descente
nb_iterations = 500000;			% Nombre d'iterations max
seuil_convergence = 1e-4;		% Critere d'arret sur la difference relative

% Parametre du filtrage gaussien :
sigma = 5;				% Variance
T = ceil(3*sigma);			% Taille du noyau gaussien

% Autres parametres :
N = 200;				% Nombre de points du snake
pas_affichage = 1000;			% Nombre d'iterations entre deux affichages

% Image a segmenter :
I = imread('coins.png');
[nb_lignes,nb_colonnes,nchannels] = size(I);
if nchannels==3				% Si l'image est RGB, on la convertit en niveaux de gris
	I = rgb2gray(I); 
end
I_max = max(double(I(:)));
I = double(I)/I_max;

% Affichage de l'image a segmenter :
figure('Name','Image a segmenter','Position',[0,0,0.5*L,0.67*H]);
hold on;
imagesc(I);
axis equal;
axis off;
axis xy;
colormap gray;

% Coordonnees initiales (x0,y0) du snake par clic de points (interpolation lineaire entre les points de controle) :
disp('Cliquez des points de controle initiaux puis tapez retour-chariot');
[x,y] = ginput;
nb_clics = length(x);
x_ = [x ; x(1)];
y_ = [y ; y(1)];
vq = interp1(1:nb_clics+1,[x_,y_],1:nb_clics/N:nb_clics+1); 	% Interpolation lineaire entre les clics
x = vq(1:end-1,1);
y = vq(1:end-1,2);
x0 = x;
y0 = y;

% Champ de forces externes du modele de base (calcul de Ext, Fx et Fy comme dans l'exo 1) :
% Calcul de l'energie externe Eext sans filtrage:
[Gx, Gy] = gradient(I);
Eext = -(Gx.^2 + Gy.^2);
% Calcul du gradient (Fx,Fy) de Eext avec filtrage:
[Fx, Fy] = gradient(Eext);
% Calcul du gradient (dxE, dyE) de Eext sans filtrage:
[dxE, dyE] = gradient(Eext);
% Norme gradient Eext
norme_gradient_Eext = (dxE.^2 + dyE.^2);
% Champ de forces externes du modele GVF (calcul du nouveau potentiel (Fx,Fy)) :
for k = 1:nb_iterations_GVF
    Fx = Fx - gamma_GVF * (norme_gradient_Eext.*(Fx - dxE) - mu_GVF * del2(Fx));
    Fy = Fy - gamma_GVF * (norme_gradient_Eext.*(Fy - dyE) - mu_GVF * del2(Fy));
end

% Construction de la matrice A, de taille N x N :
D2 = spdiags(repmat([1 -2 1], N, 1), [-1; 0; 1], N, N);
D2(1,N) = 1;
D2(N,1) = 1;
A = alpha * D2 - beta * (D2')*D2;
I_plus_gamma_fois_A = eye(N) + gamma * A;

% Descente de gradient :
x_precedent = x;
y_precedent = y;
convergence = 0;
ii = 1;
while ~convergence
	ii = ii+1;

	% Mise a jour de x et de y
    r_x = min(max(1, round(x)), nb_colonnes);
    r_y = min(max(1, round(y)), nb_lignes);
    Bx = - gamma * Fx(sub2ind([nb_lignes nb_colonnes], r_y, r_x));
    By = - gamma * Fy(sub2ind([nb_lignes nb_colonnes], r_y, r_x));
    x = I_plus_gamma_fois_A * x + Bx;
    y = I_plus_gamma_fois_A * y + By;
	
	% Affichage toutes les pas_affichage iterations du snake courant :
	if mod(ii,pas_affichage)==1
		plot([x;x(1)],[y;y(1)],'b-','LineWidth',1);
		drawnow
		pause(0.01);
				
		% Test de convergence (maximum de la difference relative inferieure a un seuil) :
		if max(sqrt(((x-x_precedent).^2+(y-y_precedent).^2)./(x.^2+y.^2)))<seuil_convergence
			convergence = 1;
		end		
		x_precedent = x;
		y_precedent = y;	
	end
	
	if ii>=nb_iterations
		convergence = 1;
	end
end
plot([x;x(1)],[y;y(1)],'r-','LineWidth',2);

% Affichage du snake initial et du snake final :
figure('Name','Resultat de la segmentation','Position',[0.5*L,0,0.5*L,0.67*H]);
hold on;
imagesc(I);
axis equal;
axis off;
axis xy;
colormap gray;
plot([x0;x0(1)],[y0;y0(1)],'b-','LineWidth',2);
plot([x;x(1)],[y;y(1)],'r-','LineWidth',2);
legend('Snake initial','Snake final','Location','best');
