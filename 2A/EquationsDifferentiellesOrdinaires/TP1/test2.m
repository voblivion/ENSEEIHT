%% Solution du TP (partie implicite)
clear;
close all;

%% Traçage des graphiques de la figure 1b
t0 = 0;
tf = 6.6632868593231303896996820305;
y0 = [2.00861986087484313650940188 0];
Ns = [120:60:1080 1200:600:10800]/4;
nphi_1 = zeros(size(Ns));
nphi_2 = zeros(size(Ns));
nphi_3 = zeros(size(Ns));
err_gauss_1 = zeros(length(nphi), 2);
err_gauss_2 = zeros(length(nphi), 2);
err_gauss_3 = zeros(length(nphi), 2);
for i = 1:length(Ns)
    N = Ns(i);
    % Euler (15, 10^-12)
    nb_itmax = 15;
    f_eps = 10^-12;
    option = [N nb_itmax f_eps];
    [~, Y, nphi] = ode_gauss_fp(@phi, [t0 tf], y0, option);
    nphi_1(i) = nphi;
    err_gauss_1(i, :) = abs(Y(N + 1, :) - y0);
    % Euler (2, 10^-12)
    nb_itmax = 2;
    f_eps = 10^-12;
    option = [N nb_itmax f_eps];
    [~, Y, nphi] = ode_gauss_fp(@phi, [t0 tf], y0, option);
    nphi_2(i) = nphi;
    err_gauss_2(i, :) = abs(Y(N + 1, :) - y0);
    % Euler (15, 10^-6)
    nb_itmax = 15;
    f_eps = 10^-6;
    option = [N nb_itmax f_eps];
    [~, Y, nphi] = ode_gauss_fp(@phi, [t0 tf], y0, option);
    nphi_3(i) = nphi;
    err_gauss_3(i, :) = abs(Y(N + 1, :) - y0);
end
figure('Name', 'Figure 1b');
% Gauss (15, 10^-12)
subplot(1, 2, 1);
plot(log10(nphi_1), log10(err_gauss_1(:, 1)));
hold on;
subplot(1, 2, 2);
plot(log10(nphi_1), log10(err_gauss_1(:, 2)));
hold on;
% Gauss (2, 10^-12)
subplot(1, 2, 1);
plot(log10(nphi_2), log10(err_gauss_2(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi_2), log10(err_gauss_2(:, 2)));
% Gauss (15, 10^-6)
subplot(1, 2, 1);
plot(log10(nphi_3), log10(err_gauss_3(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi_3), log10(err_gauss_3(:, 2)));
% Legende et labels
legend('Gauss (15, 10^{-12})', 'Gauss (2, 10^{-12})', 'Gauss (15, 10^{-6})');
subplot(1, 2, 1);
xlabel('log_{10}(phi)');
ylabel('log_{10}(erreur pour y_1)');
subplot(1, 2, 2);
xlabel('log_{10}(phi)');
ylabel('log_{10}(erreur pour y_2)');
