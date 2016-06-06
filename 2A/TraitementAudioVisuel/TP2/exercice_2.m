clear;
close all;
load exercice_1;

% Matrice des q premieres eigenfaces (testez differentes valeurs de q) :
q = 6;
Wq = W(:,1:q);			% Wq est de taille p x q

% Calcul des q premieres composantes principales :
CP = Xc*Wq;

% Reconstruction des images a partir de ces composantes principales (n'oubliez pas d'ajouter l'individu moyen) :
X_reconstruit = CP*Wq' + repmat(individu_moyen, n, 1);

% Affichage des images reconstruites :
figure('Name',['Utilisation des ' num2str(q) ' premieres composantes principales'],'Position',[0.33*L,0,0.67*L,H]);
colormap gray;
for k = 1:n
	img = reshape(X_reconstruit(k,:),nb_lignes,nb_colonnes);
	subplot(nb_individus,nb_postures,k);
	imagesc(img);
	axis image;
	axis off;
	title(['Image reconstruite ',num2str(k)],'FontSize',10);
end

% Calcul de la RMSE entre images originales et images reconstruites, pour q = 1:n-1 :
RMSE = zeros(1, n-1);
for q = 1:n-1
    Wq = W(:,1:q);
    CP = Xc*Wq;
    X_reconstruit = CP*Wq' + repmat(individu_moyen, n, 1);
    diff = X - X_reconstruit;
    RMSE(q) = mean(sqrt(sum(diff.*diff, 2)) / p);
end
valeurs_q = 1:q;
valeurs_RMSE = RMSE;

% Trace du graphe de la RMSE en fonction du nombre q de composantes principales :
figure('Name','RMSE en fonction du nombre de composantes principales','Position',[0,0,0.33*L,0.3*L]);
plot(valeurs_q,valeurs_RMSE,'r+','MarkerSize',8,'LineWidth',2);
hx = xlabel('$q$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('RMSE','FontSize',20);
