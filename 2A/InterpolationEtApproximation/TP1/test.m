[X, Y] = saisi_points();

P = [X; Y];
n = size(P, 2);

T1 = zeros(1, n);
T1(1) = 0;
for i = 2:n
    T1(i) = T1(i-1) + sqrt(norm(P(:,i) - P(:,i-1)));
end
f = F(P, T1, T1(1):0.01:T1(n));
plot(f(1,:), f(2,:));

T2 = zeros(1, n);
T2(1) = 1;
for i = 2:n
    T2(i) = i;
end
g = F(P, T2, T2(1):0.01:T2(n));
plot(g(1,:), g(2,:));