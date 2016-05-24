clear;
close all;

load exercice_1;

azimuth = -72;
elevation = 42;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PENSEES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estimation des parametres de la loi normale :
[mu_pensees, Sigma_pensees] = mu_Sigma(X_pensees);
Sigma_pensees_inverse = inv(Sigma_pensees);

% Valeurs de la loi normale sur la grille choisie :
vraisemblance_pensees = [];
for i = 1:nb_R
	for j = 1:nb_V
		r = R(i);
		v = V(j);
        X_p_c = [r-mu_pensees(1); v-mu_pensees(2)];
        q_pensees = 2*pi*det(Sigma_pensees)^(1/2);
		p_pensees = exp(-1/2*X_p_c'*Sigma_pensees_inverse*X_p_c); %#ok<*MINV>
		vraisemblance_pensees = [vraisemblance_pensees; p_pensees / q_pensees];
	end
end

% Normalisation de la loi normale :
denominateur_classe_pensees = 2*pi*sqrt(det(Sigma_pensees));
vraisemblance_pensees = vraisemblance_pensees/denominateur_classe_pensees;

% Representation 3D de la loi normale :
figure('Name','Vraisemblance de la classe "pensees"','Position',[0,0,0.33*L,0.55*H]);
hold on;
vraisemblance_pensees = reshape(vraisemblance_pensees,nb_R,nb_V);
surface(R,V,vraisemblance_pensees,'EdgeColor',[.85 .65 .65],'FaceColor','none');
axis([R(1) R(end) V(1) V(end)]);
view(azimuth,elevation);
rotate3d on;

% Trace des données d'apprentissage de la classe "pensees" (etoiles rouges) :
plot(X_pensees(:,1),X_pensees(:,2),'r*','MarkerSize',10,'LineWidth',2);
hx = xlabel('$\bar{r}$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OEILLETS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estimation des parametres de la loi normale :
[mu_oeillets, Sigma_oeillets] = mu_Sigma(X_oeillets);
Sigma_oeillets_inverse = inv(Sigma_oeillets);

% Valeurs de la loi normale sur la grille choisie :
vraisemblance_oeillets = [];
for i = 1:nb_R
	for j = 1:nb_V
		r = R(i);
		v = V(j);
        X_o_c = [r-mu_oeillets(1); v-mu_oeillets(2)];
        q_oeillets = 2*pi*det(Sigma_oeillets)^(1/2);
		p_oeillets = exp(-1/2*X_o_c'*Sigma_oeillets_inverse*X_o_c);
		vraisemblance_oeillets = [vraisemblance_oeillets; p_oeillets / q_oeillets];
	end
end

% Normalisation de la loi normale :
denominateur_classe_oeillets = 2*pi*sqrt(det(Sigma_oeillets));
vraisemblance_oeillets = vraisemblance_oeillets/denominateur_classe_oeillets;

% Representation 3D de la loi normale :
figure('Name','Vraisemblance de la classe "oeillets"','Position',[0.33*L,0,0.33*L,0.55*H]);
hold on;
vraisemblance_oeillets = reshape(vraisemblance_oeillets,nb_R,nb_V);
surface(R,V,vraisemblance_oeillets,'EdgeColor',[.65 .85 .65],'FaceColor','none');
axis([R(1) R(end) V(1) V(end)]);
view(azimuth,elevation);
rotate3d on;

% Trace des donn�es d'apprentissage de la classe "oeillets" (etoiles vertes) :
plot(X_oeillets(:,1),X_oeillets(:,2),'g*','MarkerSize',10,'LineWidth',2);
hx = xlabel('$\bar{r}$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHRYSANTHEMES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estimation des parametres de la loi normale :
[mu_chrysanthemes, Sigma_chrysanthemes] = mu_Sigma(X_chrysanthemes);
Sigma_chrysanthemes_inverse = inv(Sigma_chrysanthemes);

% Valeurs de la loi normale sur la grille choisie :
vraisemblance_chrysanthemes = [];
for i = 1:nb_R
	for j = 1:nb_V
		r = R(i);
		v = V(j);
        X_c_c = [r-mu_chrysanthemes(1); v-mu_chrysanthemes(2)];
        q_chrysanthemes = 2*pi*det(Sigma_chrysanthemes)^(1/2);
		p_chrysanthemes = exp(-1/2*X_c_c'*Sigma_chrysanthemes_inverse*X_c_c);
		vraisemblance_chrysanthemes = [vraisemblance_chrysanthemes; p_chrysanthemes / q_chrysanthemes];
	end
end

% Normalisation de la loi normale :
denominateur_classe_chrysanthemes = 2*pi*sqrt(det(Sigma_chrysanthemes));
vraisemblance_chrysanthemes = vraisemblance_chrysanthemes/denominateur_classe_chrysanthemes;

% Representation 3D de la loi normale :
figure('Name','Vraisemblance de la classe "chrysanthemes"','Position',[0.66*L,0,0.33*L,0.55*H]);
hold on;
vraisemblance_chrysanthemes = reshape(vraisemblance_chrysanthemes,nb_R,nb_V);
surface(R,V,vraisemblance_chrysanthemes,'EdgeColor',[.65 .65 .85],'FaceColor','none');
axis([R(1) R(end) V(1) V(end)]);
view(azimuth,elevation);
rotate3d on;

% Trace des donn�es d'apprentissage de la classe "chrysanthemes" (etoiles bleues) :
plot(X_chrysanthemes(:,1),X_chrysanthemes(:,2),'b*','MarkerSize',10,'LineWidth',2);
hx = xlabel('$\bar{r}$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex');


save exercice_2;
