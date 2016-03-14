function moyennes_ecarts_types = estimation(I,N,couleurs)

[nb_lignes,nb_colonnes] = size(I);
moyennes_ecarts_types = [];
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
			echantillons = [echantillons ; I(i,j)];
		end
	end
	moyenne = mean(echantillons);
	ecart_type = sqrt(mean(echantillons.*echantillons)-moyenne^2);
	moyennes_ecarts_types = [moyennes_ecarts_types ; moyenne ecart_type];
end
