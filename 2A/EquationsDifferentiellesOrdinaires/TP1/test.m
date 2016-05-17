%% Solution du TP
clear;
close all;

%% Traçage des graphiques de la figure 2
t0 = 0;
tf = 6.6632868593231303896996820305;
y0 = [2.00861986087484313650940188 0];
N = 25;
figure('Name', 'Figure 2');
% ODE Euler
[T, Y] = ode_euler(@phi, [t0 tf], y0, N);
subplot(2, 2, 1);
plot(T, Y(:, 1));
hold on;
subplot(2, 2, 2);
plot(T, Y(:, 2));
hold on;
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
hold on;
% ODE Runge
[T, Y] = ode_runge(@phi, [t0 tf], y0, N);
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
% ODE Heun
[T, Y] = ode_heun(@phi, [t0 tf], y0, N);
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
% ODE RK4
[T, Y] = ode_rk4(@phi, [t0 tf], y0, N);
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
% ODE RK4 3/8
[T, Y] = ode_rk4_3b8(@phi, [t0 tf], y0, N);
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
% Gauss (15, 10^-12)
nb_itmax = 15;
f_eps = 10^-6;
option = [N nb_itmax f_eps];
[T, Y, ~, ~] = ode_gauss_fp(@phi, [t0 tf], y0, option);
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));
% Legende et labels
legend('Euler', 'Runge', 'Heun', 'RK4', 'RK4 3/8', 'Gauss');
subplot(2, 2, 1);
xlabel('t');
ylabel('y_1(t)');
subplot(2, 2, 2);
xlabel('t');
ylabel('y_2(t)');
subplot(2, 1, 2);
xlabel('y_1(t)');
ylabel('y_2(t)');

%% Traçage des graphiques de la figure 1
t0 = 0;
tf = 6.6632868593231303896996820305;
y0 = [2.00861986087484313650940188 0];
nphi = [120:60:1080 1200:600:10800];
nphi_1 = zeros(size(nphi));
err_euler = zeros(length(nphi), 2);
err_runge = zeros(length(nphi), 2);
err_heun = zeros(length(nphi), 2);
err_rk4 = zeros(length(nphi), 2);
err_rk4_3b8 = zeros(length(nphi), 2);
err_gauss_1 = zeros(length(nphi), 2);
for i = 1:length(nphi)
    % Euler
    N = nphi(i);
    [~, Y] = ode_euler(@phi, [t0 tf], y0, N);
    err_euler(i, :) = abs(Y(N + 1, :) - y0);
    % Runge
    N = nphi(i) / 2;
    [~, Y] = ode_runge(@phi, [t0 tf], y0, N);
    err_runge(i, :) = abs(Y(N + 1, :) - y0);
    % Heun
    N = nphi(i) / 3;
    [~, Y] = ode_heun(@phi, [t0 tf], y0, N);
    err_heun(i, :) = abs(Y(N + 1, :) - y0);
    % RK4
    N = nphi(i) / 4;
    [~, Y] = ode_rk4(@phi, [t0 tf], y0, N);
    err_rk4(i, :) = abs(Y(N + 1, :) - y0);
    % RK4 3/8
    N = nphi(i) / 4;
    [~, Y] = ode_rk4_3b8(@phi, [t0 tf], y0, N);
    err_rk4_3b8(i, :) = abs(Y(N + 1, :) - y0);
    % Euler (15, 10^-12)
    nb_itmax = 15;
    f_eps = 10^-12;
    option = [N nb_itmax f_eps];
    [~, Y, nphi_g] = ode_gauss_fp(@phi, [t0 tf], y0, option);
    nphi_1(i) = nphi_g;
    err_gauss_1(i, :) = abs(Y(N + 1, :) - y0);
end
figure('Name', 'Figure 1');
% Euler
subplot(1, 2, 1);
plot(log10(nphi), log10(err_euler(:, 1)));
hold on;
subplot(1, 2, 2);
plot(log10(nphi), log10(err_euler(:, 2)));
hold on;
% Runge
subplot(1, 2, 1);
plot(log10(nphi), log10(err_runge(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi), log10(err_runge(:, 2)));
% Heun
subplot(1, 2, 1);
plot(log10(nphi), log10(err_heun(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi), log10(err_heun(:, 2)));
% RK4
subplot(1, 2, 1);
plot(log10(nphi), log10(err_rk4(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi), log10(err_rk4(:, 2)));
% RK4 3/8
subplot(1, 2, 1);
plot(log10(nphi), log10(err_rk4_3b8(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi), log10(err_rk4_3b8(:, 2)));
% Gauss
subplot(1, 2, 1);
plot(log10(nphi_1), log10(err_gauss_1(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi_1), log10(err_gauss_1(:, 2)));
% Legende et labels
legend('Euler', 'Runge', 'Heun', 'RK4', 'RK4 3/8', 'Gauss');
subplot(1, 2, 1);
xlabel('log_{10}(phi)');
ylabel('log_{10}(erreur pour y_1)');
subplot(1, 2, 2);
xlabel('log_{10}(phi)');
ylabel('log_{10}(erreur pour y_2)');
