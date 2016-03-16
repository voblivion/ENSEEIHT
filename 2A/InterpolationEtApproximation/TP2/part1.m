% part1

% Saisie des points
[X, Y] = saisi_points();
plot(X, Y);

% Bezier par évaluation
pts = Bezier([X; Y], 0:0.01:1);
plot(pts(1,:), pts(2,:));

% Bezier par De Casteljau
pts = DeCasteljau([X; Y], 4);
plot(pts(1,:), pts(2,:));