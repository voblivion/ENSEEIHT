[X, Y] = saisi_points();

P = [X; Y];
n = size(P, 2);
m = 4;

T = zeros(m, n);
T(:, 1) = [0; 0; 0; cos(pi / (2 * n + 2))];
for i = 2:n
    % Uniforme
    T(1, i) = i - 1;
    
    % Distance
    T(2, i) = T(2, i-1) + norm(P(:, i) - P(:, i-1));
    
    % Distance ^ 1/2
    T(3, i) = T(3, i-1) + sqrt(norm(P(:, i) - P(:, i-1)));
    
    % Tchebitchev
    T(4, i) = cos((2 * (i - 1) + 1) * pi / (2 * n + 2));
end

for type = 1:m
    if i ~= 1
        pause
    end
    f = Neville(P, T(i,:), min(T(i,:)):0.01:max(T(i,:)));
    plot(f(1,:), f(2,:));
end