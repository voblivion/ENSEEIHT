%% part1

%% Paramètres
pas_eval = 0.01;
iter = 4;

% Saisie des points
[X, Y] = saisi_points();
close all;

%% Bezier par évaluation
figure('name', 'Evaluation');
hold on;
plot(X, Y);
pts = Bezier([X; Y], 0:0.01:1);
plot(pts(1,:), pts(2,:));

%% Bezier par De Casteljau
figure('name', 'De Casteljau');
hold on;
plot(X, Y);
pts = DeCasteljau([X; Y], iter);
plot(pts(1,:), pts(2,:));
