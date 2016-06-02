function [T, Y] = ode_rk4_3b8(phi, ts, y0, N)
%% ode_rk4_3b8
%
%  Applique le schéma de Runge-Kutta rk4 3 par 8 entre ts(1) et ts(2) pour
%  N subdivisions de cet intervalle et pour le système :
%    - y'(t) = phi(t, y(t))
%    - y(0) = y0
%
%  Params :
%    - phi : la fonction de t et de y retournant la valeur de phi(t, y)
%    - ts  : les bornes de l'intervalle d'intégration
%    - y0  : la condition initiale
%    - N   : le nombre de subdivisions de l'intervalle d'intégration  
t0 = ts(1);
tf = ts(2);
n = length(y0);
Y = zeros(N + 1, n);
Y(1, :) = y0;
T = zeros(N + 1, 1);
T(1) = 0;
dt = (tf - t0) / N;

% Schéma RK4 3/8
A = [0 0 0 0; 1/3 0 0 0; -1/3 1 0 0; 1 -1 1 0];
C = [0 1/3 2/3 1];
B = [1/8 3/8 3/8 1/8];
s = length(C);

t = t0;
y = y0;
B = repmat(B', 1, n);
for i = 1:N
    ts = t + dt * C;
    K = zeros(s, n);
    for j = 1:s
        K(j, :) = phi(ts(j), y + dt * A(j, :) * K);
    end
    t = t + dt;
    y = y + dt * sum(B .* K);
    
    T(i + 1) = t;
    Y(i + 1, :) = y;
end

end

