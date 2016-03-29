%% part1

%% Paramètres
degree = 2;
iterations = 5;

% Saisie des points
[X, Y] = saisi_points();
close all;

%% Spline fermée
figure('name', 'Spline fermée');
hold on;
plot([X X(:, 1)], [Y Y(:, 1)]);
pts = splineC([X; Y], degree, iterations);
plot([pts(1,:) pts(1,1)], [pts(2,:) pts(2,1)]);

%% Spline ouverte
figure('name', 'Spline ouverte');
hold on;
plot(X, Y);
pts = spline([X; Y], degree, iterations);
plot(pts(1,:), pts(2,:));
