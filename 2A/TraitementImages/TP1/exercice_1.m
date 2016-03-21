clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

couleurs = [0 0.1250 1.0 ; 0.1750 1.0 0.2250 ; 1.0 1.0 0 ; 1.0 0.3750 0 ; 0.85 0 0 ; 0.5 0 0.3 ; 0.5 0.5 0.1];

% Parametres de la methode de segmentation :
T_0 = 1;
q_max = 250;
alpha = 0.99;
beta = 1;
intervalle_entre_affichages = 10;
temps_affichage = 0.01;
nb_voisins = 4;

% Lecture et affichage de l'image d'origine :
I = imread('Images/image.bmp');
I = double(I);
[nb_lignes,nb_colonnes] = size(I);
figure('Name','Image a segmenter','Position',[0,0,0.33*L,0.3*L]);
imagesc(I);
axis equal;
axis off;
colormap gray;
pause(1);

% Parametres des classes de pixels :
moyennes_ecarts_types = [ 36.0 20.0 ; 72.0 20.0 ; 108.0 20.0 ; 144.0 20.0 ; 180.0 20.0 ; 216.0 20.0 ];
N = size(moyennes_ecarts_types,1);

% Initialisation aleatoire des classes :
k = zeros(nb_lignes,nb_colonnes);
for i = 1:nb_lignes
    for j = 1:nb_colonnes
        k(i,j) = ceil(rand*N);
    end
end

% Affichage des classes :
couleurs_classes = zeros(nb_lignes,nb_colonnes,3);
for i = 1:nb_lignes
    for j = 1:nb_colonnes
        couleurs_classes(i,j,:) = couleurs(k(i,j),:);
    end
end
f = figure('Name',['Segmentation en ' num2str(N) ' regions'],'Position',[0.33*L,0,0.33*L,0.3*L]);
imagesc(couleurs_classes);
axis equal;
axis off;
pause(temps_affichage);

% Boucle du recuit simule :
T = T_0;
[v_i, v_j] = voisins(nb_voisins, nb_lignes, nb_colonnes); % Pré-calcul des indices voisins
for q = 1:q_max
    % Recuit simulé
    for i = 1:nb_lignes
        for j = 1:nb_colonnes
            % Choix d'une nouvelle classe pour le pixel courant
            ks = k(i, j);
            while ks == k(i, j);
                ks = ceil(rand*N);
            end
            % Calcul de la somme du troisième terme de l'énergie
            sCour = 0;
            sNouv = 0;
            for p = 1:nb_voisins
                sCour = sCour + (k(i,j) ~= k(v_i(i, j, p), v_j(i, j, p)));
                sNouv = sNouv + (ks ~= k(v_i(i, j, p), v_j(i, j, p)));
            end
            
            % Petite modification de beta
            if beta ~= 0
                beta_q = beta * (0.5 + 1 * sqrt(q / q_max));
            else
                beta_q = 0;
            end
            
            % Calcul de l'énergie courante et de l'énergie nouvelle
            UCour = log(moyennes_ecarts_types(k(i,j), 2));
            UCour = UCour + 1/2*((I(i,j) - moyennes_ecarts_types(k(i,j), 1)) / moyennes_ecarts_types(k(i,j), 2))^2;
            UCour = UCour + beta_q * sCour;
            UNouv = log(moyennes_ecarts_types(ks    , 2));
            UNouv = UNouv + 1/2*((I(i,j) - moyennes_ecarts_types(ks    , 1)) / moyennes_ecarts_types(ks    , 2))^2;
            UNouv = UNouv + beta_q * sNouv;
            
            % Mise à jour de n'énergie courante
            if UNouv <= UCour
                k(i, j) = ks;
            else
                if rand() < exp(-(UNouv - UCour) / T)
                    K(i, j) = ks;
                end
            end
        end
    end
    % Affichage de l'image nouvellement calcuée
    if mod(q,intervalle_entre_affichages)==0
        for i = 1:nb_lignes
            for j = 1:nb_colonnes
                couleurs_classes(i,j,:) = couleurs(k(i,j),:);
            end
        end
        figure(f);
        imagesc(couleurs_classes);
        axis equal;
        axis off;
        title(['Pas ' num2str(q) '/' num2str(q_max)]);
        pause(temps_affichage);
    end
    % Mise à jour de T
    T = alpha*T;
end

% Calcul du pourcentage de pixels correctement classes :
load classification_OK;
pixels_correctement_classes = find(k==y2);
disp(['Pixels correctement classes : ' num2str(100*length(pixels_correctement_classes(:))/(nb_lignes*nb_colonnes),'%.2f') ' %']);
