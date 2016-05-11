function [T, Y] = ode_runge(phi, ts, y0, N)
t0 = ts(1);
tf = ts(2);
n = length(y0);
Y = zeros(N + 1, n);
Y(1, :) = y0;
T = zeros(N + 1, 1);
T(1) = 0;
dt = (tf - t0) / N;

% Schéma de Runge
A = [0 0; 1/2 0];
B = [0 1];
C = [0 1/2];
s = length(C);

t = t0;
y = y0;
for i = 1:N
    ts = t + dt * C;
    K = zeros(s, n);
    for j = 1:s
        K(j, :) = phi(ts(j), y + dt * A(j, :) * K);
    end
    t = t + dt;
    y = y + dt * sum(repmat(B, s, 1) .* K);
    
    T(i + 1) = t;
    Y(i + 1, :) = y;
end

end

