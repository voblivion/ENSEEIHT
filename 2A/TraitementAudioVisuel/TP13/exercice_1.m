clear;
close all;

load donnees;

% Couleur moyenne de chaque image de pensee :
X_pensees = [];
for i = 1:nb_images_pensees
	nom_image = eval(['pe' num2str(i)]);
	X_pensees = [X_pensees ; moyenne(nom_image)];
end

% Couleur moyenne de chaque image d'oeillet :
X_oeillets = [];
for i = 1:nb_images_oeillets
	nom_image = eval(['oe' num2str(i)]);
	X_oeillets = [X_oeillets ; moyenne(nom_image)];
end

% Couleur moyenne de chaque image de chrysantheme :
X_chrysanthemes = [];
for i = 1:nb_images_chrysanthemes
	nom_image = eval(['ch' num2str(i)]);
	X_chrysanthemes = [X_chrysanthemes ; moyenne(nom_image)];
end

% Affichage des couleurs moyennes des images :
pas = 0.0025;
R = 0.35:pas:0.60;
V = 0.2:pas:0.45;
nb_R = length(R);
nb_V = length(V);
figure('Name','Couleurs moyennes des images','Position',[0.5*L,0,0.5*L,0.67*H]);
axis equal;
axis ij;
axis([R(1) R(end) V(1) V(end)]);
hold on;
plot(X_pensees(:,1),X_pensees(:,2),'r*','MarkerSize',10,'LineWidth',2);
plot(X_oeillets(:,1),X_oeillets(:,2),'g*','MarkerSize',10,'LineWidth',2);
plot(X_chrysanthemes(:,1),X_chrysanthemes(:,2),'b*','MarkerSize',10,'LineWidth',2);
hx = xlabel('$\bar{r}$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex');
legend('Pensees','Oeillets','Chrysantemes','Location','Best');
view(-90,90);

save exercice_1;
