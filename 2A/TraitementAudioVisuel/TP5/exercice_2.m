clear;
close all;

load exercice_1;

% Parametres a regler :
n = 12;
T = 5;

% Affichage de l'image originale et de l'image de contours :
figure('Name','Image originale et image de contours','Position',[0.5*L,0,0.5*L,H]);
subplot(2,1,1);
imagesc(valeurs_x,valeurs_y,I_RVB);
axis equal;
axis off;
set(gca,'FontSize',20);
title('Image originale','Interpreter','Latex');
subplot(2,1,2);
imagesc(valeurs_x,valeurs_y,I_contours);
axis equal;
axis off;
colormap gray;
hold on;
set(gca,'FontSize',20);
title('Image de contours','Interpreter','Latex');

% Detection des n maxima locaux les plus eleves de C :
M = zeros(n, 2);
for k = 1:n
    [m, I] = max(C);
    [m, J] = max(m);
    i = I(J);
    j = J;
    rho = i - d - 1;
    theta = (j-1)*pi/180;
    M(k,:) = [rho theta];
    for ii = max(1,i-T):min(i+T,2*d+1)
        for jj = max(1,j-T):min(j+T,180)
            C(ii, jj) = 0;
        end
    end
end

% Affichage des n maxima locaux les plus eleves de C :
figure('Name','Detection des droites detectees','Position',[0,0,0.5*L,0.5*H]);
imagesc(valeurs_theta,valeurs_rho,C);
colormap gray;
hold on;
xlabel('$\theta$ (en radians)','FontSize',20,'Interpreter','Latex');
ylabel('$\rho$ (en pixels)','FontSize',20,'Interpreter','Latex');
set(gca,'FontSize',15);
set(gca,'XTick',valeurs_theta(1):valeurs_theta(end));
set(gca,'YTick',[fliplr([0:-floor(d/5):-d]) [floor(d/5):floor(d/5):d]]);
for numero = 1:n
    plot(M(numero,2),M(numero,1),'x','MarkerSize',10,'LineWidth',2,'Color','r');
end

% Affichage des droites detectees :
figure(1);
subplot(2,1,2);
for numero = 1:n
    rho = M(numero,1);
    theta = M(numero,2);
    plot(valeurs_x,(rho-valeurs_x*cos(theta))/sin(theta),'-','LineWidth',2,'Color','r');
end

save exercice_2;
