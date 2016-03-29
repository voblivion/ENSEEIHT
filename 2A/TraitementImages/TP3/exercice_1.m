clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Parametres communs a tous les tests :
reduction = 0.25;			% Facteur de reduction de la resolution
k_max = 100; 
epsilon = 0.1;
chemin = 'Images/';
image = {'oignon.png','piments.png','pommes.png','chat.png'};
valeurs_T = [15 20 15 15];		% Parametres a ajuster
valeurs_h = [20 15 15 15];		% Parametres a ajuster
position = {[0,0.5*H,0.5*L,0.37*H],[0.5*L,0.5*H,0.5*L,0.37*H],[0,0,0.5*L,0.37*H],[0.5*L,0,0.5*L,0.37*H]};

for i = 1:length(image)
	nom_fichier = fullfile('Images/', image{i});
	I = imread(nom_fichier);
	I = imresize(I,reduction);
	f = figure('Name',nom_fichier,'Position',position{i});
	subplot(1,2,1);
	imagesc(I);
	axis off;
	axis equal;
	T = valeurs_T(i);
	h = valeurs_h(i);
	t = title(['$(T,h) = ($' num2str(T) '$,$' num2str(h) ')'],'Interpreter','Latex','FontSize',20); 
	pos = get(t,'position');
 	set(t,'position', pos+[0 2 0]);
	drawnow;

	[S,k] = meanshift(I,T,h,k_max,epsilon);
	disp([nom_fichier ' : ' num2str(k) ' iterations']);
    figure(f)
	subplot(1,2,2);
	imagesc(S);
	axis off;
	axis equal;
	nb_regions = comptage(S, 4);
	title([num2str(nb_regions) ' regions detectees'],'Interpreter','Latex','FontSize',20);
end
