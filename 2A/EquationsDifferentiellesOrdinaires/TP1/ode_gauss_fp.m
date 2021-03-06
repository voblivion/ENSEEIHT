function [T, Y, nphi, ifail] = ode_gauss_fp(phi, ts, y0, option)
%% ode_gauss_fp
%
%  Applique le schéma de Runge-Kutta de Gauss entre ts(1) et ts(2) pour N
%  subdivisions de cet intervalle et pour le système :
%    - y'(t) = phi(t, y(t))
%    - y(0) = y0
%  en employant la méthode du point fixe pour le calcul de K.
%
%  Params :
%    - phi : la fonction de t et de y retournant la valeur de phi(t, y)
%    - ts  : les bornes de l'intervalle d'intégration
%    - y0  : la condition initiale
%    - option(1) : le nombre de subdivisions de l'intervalle d'intégration
%    - option(2) : le nombre maximum d'itérations de l'algo. du point fixe
%    - option(3) : f_eps le seuil de convergence de l'algo. du point fixe
N = option(1);
nb_itmax = option(2);
f_eps = option(3);
t0 = ts(1);
tf = ts(2);
n = length(y0);
Y = zeros(N + 1, n);
Y(1, :) = y0;
T = zeros(N + 1, 1);
T(1) = 0;
dt = (tf - t0) / N;
nphi = 0;
ifail = zeros(N, 1);

% Schéma de Gauss
A = [1/4 1/4-sqrt(3)/6; 1/4+sqrt(3)/6 1/4];
C = [1/2+sqrt(3)/6 1/2-sqrt(3)/6];
B = [1/2 1/2];
s = length(C);

%% Algorithme du point fixe
t = t0;
y = y0;
B = repmat(B', 1, n);
for i = 1:N
    ts = t + dt * C;
    % Initialiser les ki
    K = zeros(s, n);
    for j = 1:s
        K(j, :) = phi(ts(j), Y(i, :));
    end
    nphi = nphi + s;
    norm_prog = 1;
    nb_iter = 0;
    while nb_iter < nb_itmax && norm_prog > f_eps
        % Calculer les nouveaux ki
        new_K = zeros(s, n);
        for j = 1:s
            new_K(j, :) = phi(ts(j), y + dt * A(j, :) * K);
        end
        nphi = nphi + s;
        % Calculer norm_prog
        norm_prog = norm(new_K - K);
        K = new_K;
        nb_iter = nb_iter + 1;
    end
    % Mettre à jour ifail
    if norm_prog <= f_eps
        ifail(i) = nb_iter;
    else
        ifail(i) = -1;
    end
    t = t + dt;
    y = y + dt * sum(B .* K);

    T(i + 1) = t;
    Y(i + 1, :) = y;
end

end

