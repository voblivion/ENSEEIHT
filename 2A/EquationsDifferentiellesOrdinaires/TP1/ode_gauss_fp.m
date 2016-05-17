function [T, Y, nphi, ifail] = ode_gauss_fp(phi, ts, y0, option, varargin)
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
pt_fixe = 0;
newton = 0;
if isempty(varargin)
    pt_fixe = 1;
elseif length(varargin) == 1
    dphi = varargin{1};
    newton = 1;
else
    error('Nombre d''arguments incorrect.');
end

% Schéma de Gauss
A = [1/4 1/4-sqrt(3)/6; 1/4+sqrt(3)/6 1/4];
C = [1/2+sqrt(3)/6 1/2-sqrt(3)/6];
B = [1/2 1/2];
s = length(C);

if pt_fixe
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
elseif newton
    %% Algorithme de Newton
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

end

