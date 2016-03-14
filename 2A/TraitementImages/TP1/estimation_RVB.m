function [liste_moyennes,liste_Sigma_inv,liste_log_det_Sigma] = estimation_RVB(I,N,couleurs)

nb_lignes = size(I,1);
nb_colonnes = size(I,2);
liste_moyennes = zeros(N,3);
liste_Sigma_inv = zeros(N,3,3);
liste_log_det_Sigma = zeros(N,1);
for k = 1:N
	[x1,y1] = ginput(1);
	while (x1<1)||(x1>nb_colonnes)||(y1<1)||(y1>nb_lignes)
		[x1,y1] = ginput(1);
	end
	[x2,y2] = ginput(1);
	while (x2<1)||(x2>nb_colonnes)||(y2<1)||(y2>nb_lignes)||(x2==x1)||(y2==y1)
		[x2,y2] = ginput(1);
	end
	line([x1,x1],[y1,y2],'Color',couleurs(k,:),'Linewidth',2);
	line([x1,x2],[y2,y2],'Color',couleurs(k,:),'Linewidth',2);
	line([x2,x2],[y2,y1],'Color',couleurs(k,:),'Linewidth',2);
	line([x2,x1],[y1,y1],'Color',couleurs(k,:),'Linewidth',2);

	echantillons = [];
	for i = floor(min([y1,y2])):ceil(max([y1,y2]))
		for j = floor(min([x1,x2])):ceil(max([x1,x2]))
			echantillons = [echantillons ; I(i,j,1) I(i,j,2) I(i,j,3)];
		end
	end
	moyenne = mean(echantillons);
	nb_donnees = size(echantillons,1);
	echantillons_centres = echantillons-ones(nb_donnees,1)*moyenne;
	Sigma = transpose(echantillons_centres)*echantillons_centres/nb_donnees;
	liste_moyennes(k,:) = moyenne;
	liste_Sigma_inv(k,:,:) = inv(Sigma);
	liste_log_det_Sigma(k) = log(det(Sigma));
end
