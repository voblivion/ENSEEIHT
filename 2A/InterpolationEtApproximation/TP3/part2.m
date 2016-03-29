%% part2

%% Paramètres
degree = 3;
iterations = 3;
pas = 0.5;

% 1 = Dôme bruité, 2 = Sinusoïde
for k = 1:3
    if k == 1
        courbe = 'Dôme bruité';
    else
        if k == 2
            courbe = 'Sinusoïde';
        else
            courbe = 'Thor';
        end
    end
    
    dxy = 0:pas:1;
    q = size(dxy, 2);
    g = grille(dxy, dxy, k);
    q = size(g, 2);
    
    % 1 = Spline fermée, 2 = Spline fermée
    for l = 1:2
        if l == 1
            methode = ['Spline fermée'];
            f = @splineC;
        else
            p = 0;
            methode = ['Spline ouverte'];
            f = @spline;
        end
        
        % DEBUT Calcul du nombre de colonnes
        X = g(1,:,1);
        Y = g(1,:,2);
        Z = g(1,:,3);
        P = [X; Y; Z];
        m = size(f(P, degree, iterations), 2);
        % FIN Calcul du nombre de colonnes
        
        tmp = zeros(q, m, 3);
        for i = 1:q
            X = g(i,:,1);
            Y = g(i,:,2);
            Z = g(i,:,3);
            P = [X; Y; Z];
            res = f(P, degree, iterations);
            tmp(i,:,1) = res(1,:);
            tmp(i,:,2) = res(2,:);
            tmp(i,:,3) = res(3,:);
        end
        
        % DEBUT Calcul du nombre de lignes
        X = tmp(:,1,1)';
        Y = tmp(:,1,2)';
        Z = tmp(:,1,3)';
        P = [X; Y; Z];
        n = size(f(P, degree, iterations), 2);
        % FIN Calcul du nombre de lignes
        
        pts = zeros(n, m, 3);
        for j = 1:m
            X = tmp(:,j,1)';
            Y = tmp(:,j,2)';
            Z = tmp(:,j,3)';
            P = [X; Y; Z];
            res = f(P, degree, iterations);
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