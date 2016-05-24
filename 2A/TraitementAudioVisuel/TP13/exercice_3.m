clear;
close all;

load exercice_2;

% Calcul du maximum de vraisemblance :
maximum_vraisemblance = max(vraisemblance_pensees,vraisemblance_oeillets);
maximum_vraisemblance = max(maximum_vraisemblance,vraisemblance_chrysanthemes);
classe_pensees = find(vraisemblance_pensees == maximum_vraisemblance);
classe_oeillets = find(vraisemblance_oeillets == maximum_vraisemblance);
classe_chrysanthemes = find(vraisemblance_chrysanthemes == maximum_vraisemblance);
code_classe = zeros(nb_R,nb_V);
code_classe(classe_pensees) = 3;
code_classe(classe_oeillets) = 2;
code_classe(classe_chrysanthemes) = 1;

% Affichage des classes :
figure('Name','Classification par maximum de vraisemblance','Position',[0.5*L,0,0.5*L,0.67*H]);
axis equal;
axis ij;
axis([R(1) R(end) V(1) V(end)]);
hold on;
surface(R,V,code_classe);
carte_couleurs = [.45 .45 .65 ; .45 .65 .45 ; .65 .45 .45];
colormap(carte_couleurs);
hx = xlabel('$\overline{r}$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex');
view(-90,90);

% Initialisation des compteurs :
cpt_images = 0;
cpt_images_correctement_classees = 0;

% Comptage des images de pensees correctement classees :
for i = 1:nb_images_pensees
	cpt_images = cpt_images+1;
	m = X_pensees(i, :);
	ir = dsearchn(R', m(1));
	iv = dsearchn(V', m(2));
    r = R(ir);
    v = V(iv);
	if code_classe((ir-1) * nb_V + iv) == 3
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		plot3(r,v,4,'r*','MarkerSize',10,'LineWidth',2);
	else
		plot3(r,v,4,'k*','MarkerSize',10,'LineWidth',2);
	end
end

% Comptage des images d'oeillets correctement classees :
for i = 1:nb_images_oeillets
	cpt_images = cpt_images+1;
	m = X_oeillets(i, :);
	ir = dsearchn(R', m(1));
	iv = dsearchn(V', m(2));
    r = R(ir);
    v = V(iv);
	if code_classe((ir-1) * nb_V + iv) == 2
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		plot3(r,v,4,'g*','MarkerSize',10,'LineWidth',2);
	else
		plot3(r,v,4,'k*','MarkerSize',10,'LineWidth',2);
	end
end

% Comptage des images de chrysanthemes correctement classees :
for i = 1:nb_images_chrysanthemes
	cpt_images = cpt_images+1;
	m = X_chrysanthemes(i, :);
	ir = dsearchn(R', m(1));
	iv = dsearchn(V', m(2));
    r = R(ir);
    v = V(iv);
	if code_classe((ir-1) * nb_V + iv) == 1
		cpt_images_correctement_classees = cpt_images_correctement_classees+1;
		plot3(r,v,4,'b*','MarkerSize',10,'LineWidth',2);
	else
		plot3(r,v,4,'k*','MarkerSize',10,'LineWidth',2);
	end
end

% Affichage du pourcentage d'images correctement classees :
disp([num2str((100*cpt_images_correctement_classees)/cpt_images,'%.2f') '% d''images correctement classees']);
