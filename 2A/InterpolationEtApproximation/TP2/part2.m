%% part 2

%% Paramètres
pas = 0.25; % Pas de la génération
iter = 4; % Nombre d'itérations pour De Casteljau
pas_eval = 0.02; % Pas pour Bézier par évaluation

% 1 = Dôme bruité, 2 = Sinusoïde
for k = 1:2
    if k == 1
        courbe = 'Dôme bruité';
    else
        courbe = 'Sinusoïde';
    end
    
    dxy = 0:pas:1;
    n = size(dxy, 2);
    g = grille(dxy, dxy, k);
    
    % 1 = De Casteljau, 2 = Evaluation
    for l = 1:2
        if l == 1
            param = iter;
            methode = ['De Casteljau avec ' int2str(param) ' itérations'];
            m = n*2^param;
            f = @DeCasteljau;
        else
            param = 0:pas_eval:1;
            methode = ['Evaluation de pas ' num2str(pas_eval)];
            m = size(param, 2);
            f = @Bezier;
        end
        tmp = zeros(n, m, 3);
        for i = 1:n
            X = g(i,:,1);
            Y = g(i,:,2);
            Z = g(i,:,3);
            P = [X; Y; Z];
            res = f(P, param);
            tmp(i,:,1) = res(1,:);
            tmp(i,:,2) = res(2,:);
            tmp(i,:,3) = res(3,:);
        end
        pts = zeros(m, m, 3);
        for j = 1:m
            X = tmp(:,j,1)';
            Y = tmp(:,j,2)';
            Z = tmp(:,j,3)';
            P = [X; Y; Z];
            res = f(P, param);
            pts(:,j,1) = res(1,:);
            pts(:,j,2) = res(2,:);
            pts(:,j,3) = res(3,:);
        end

        figure('name', [courbe ' par ' methode]);
        hold on
        view(17, 42)
        surf(g(:,:,1), g(:,:,2), g(:,:,3));
        alpha 0.4;
        surf(pts(:,:,1), pts(:,:,2), pts(:,:,3));
        alpha 0.6;
    end
end