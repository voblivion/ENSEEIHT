clear;
close all;
load exercice_2;

% Estimation des lois normales :
delta_moyen = mean(delta, 2);
delta_ecart = std(delta, 0, 2);

% Simulation de silhouettes par tirages aleatoires :
figure('Name','Simulation de silhouettes par tirages aleatoires','Position',[0.33*L,0,0.67*L,H]);
N = 15;			% Longueur de la sequence simulee
for k = 1:N
    x_gauche = 1;
    x_droite = -1;
    while any(x_gauche > x_droite)
        delta_aleatoire = delta_moyen + delta_ecart .* randn(2*d-1, 1);
        x_gauche = bezier(y, beta_0, [delta_aleatoire(1:d-1); delta_aleatoire(d+d-1)]);
        x_droite = bezier(y, gamma_0, delta_aleatoire(d:d+d-1));
    end

	plot(x_droite,y,'Color','b','LineWidth',2);
	axis([limites(3:4) limites(1:2)]);
	xlabel('$x$','FontSize',20,'Interpreter','Latex');
	ylabel('$y$','FontSize',20,'Interpreter','Latex','Rotation',0);
	hold on;
	plot(x_gauche,y,'Color','b','LineWidth',2);
	for j = 1:p
		plot([x_gauche(j) x_droite(j)],[y(j) y(j)],'Color','b','LineWidth',2);
	end

	pause(0.03);
	hold off;
end

save exercice_3;