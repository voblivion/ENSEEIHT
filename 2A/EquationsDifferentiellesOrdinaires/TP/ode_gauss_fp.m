function [T, Y, nphi, ifail] = ode_gauss_fp(phi, ts, y0, option)
t0 = ts(1);
tf = ts(2);
n = length(y0);
Y = zeros(N + 1, n);
Y(1, :) = y0;
T = zeros(N + 1, 1);
T(1) = 0;
dt = (tf - t0) / N;
N = option(1);
nb_itmax = option(2);
f_eps = option(3);
s = 
nphi = 



end

