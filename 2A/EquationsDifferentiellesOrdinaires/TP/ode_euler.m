function [T, Y] = ode_euler(phi, ts, y0, N)
t0 = ts(1);
tf = ts(2);
n = length(y0);
Y = zeros(N + 1, n);
Y(1, :) = y0;
T = zeros(N + 1, 1);
T(1) = 0;
dt = (tf - t0) / N;

for i = 1:N
    t = t0 + i * dt;
    T(i + 1) = t;
    Y(i + 1, :) = Y(i, :) + dt * phi(t, Y(i, :));
end

end

