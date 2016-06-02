function [T, Y] = ode_euler(phi, ts, y0, N)
%% ode_euler
%
%  Applique le schéma de Runge-Kutta d'Euler entre ts(1) et ts(2) pour N
%  subdivisions de cet intervalle et pour le système :
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

for i = 1:N
    t = t0 + i * dt;
    T(i + 1) = t;
    Y(i + 1, :) = Y(i, :) + dt * phi(t, Y(i, :));
end

end

