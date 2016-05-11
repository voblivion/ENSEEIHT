%% Solution du TP

%% Traçage des graphiques de la figure 2
t0 = 0;
tf = 6.6632868593231303896996820305;
y0 = [2.00861986087484313650940188 0];
N = 10;
[T, Y] = ode_runge(@phi, [t0 tf], y0, N);
figure('Name', 'Figure 2');
subplot(2, 2, 1);
plot(T, Y(:, 1));
subplot(2, 2, 2);
plot(T, Y(:, 2));
subplot(2, 1, 2);
plot(Y(:, 1), Y(:, 2));

%% Traçage des graphiques de la figure 1
t0 = 0;
tf = 6.6632868593231303896996820305;
y0 = [2.00861986087484313650940188 0];
nphi = [120:60:1080 1200:600:10800];
err_euler = zeros(length(nphi), 2);
for i = 1:length(nphi)
    N = nphi(i);
    [T, Y] = ode_euler(@phi, [t0 tf], y0, N);
    err_euler(i, :) = abs(Y(N + 1, :) - y0);
end
figure('Name', 'Figure 1');
subplot(1, 2, 1);
plot(log10(nphi), log10(err_euler(:, 1)));
subplot(1, 2, 2);
plot(log10(nphi), log10(err_euler(:, 2)));
