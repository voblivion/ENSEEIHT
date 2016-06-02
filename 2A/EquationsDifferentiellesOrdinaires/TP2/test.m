clear;
close all;

% Paramètres
n = 10;
m = 100;
n_t = 100;
m_t = 10;
tf = [2*pi/sqrt(3) 2*pi/sqrt(3) 1];
x0 = [0.8 0.8 0.15];
y0 = [0.8 0.8 -0.6];
r0 = [0.3 0.3 0.1];
A(:, :, 1) = [-1 -4; 1 -1];
A(:, :, 2) = [1 -4; 1 -1];
A(:, :, 3) = [1 1; 4 -2];

f = figure('Name', 'Visualisation des flots');
for k = 1:3
    subplot(1, 3, k);
    if k == 1
        t = 'Flot pour A1';
    elseif k == 2
        t = 'Flot pour A2';
    else
        t = 'Flot pour A3';
    end
    title(t);
    hold on;

    %% Trajectoires
    ks = (0:n-1)/n*2*pi;
    ts = (0:n_t-1)/n_t*tf(k);
    p0s = [x0(k)+r0(k)*cos(ks); y0(k)+r0(k)*sin(ks)];
    for i = 1:n
        xi0 = p0s(1, i);
        yi0 = p0s(2, i);
        pis = myf(A(:, :, k), [xi0; yi0], ts);
        plot(pis(1, :), pis(2, :));
        hold on;
    end

    %% Cercles
    ks = (0:m-1)/m*2*pi;
    ts = (0:m_t-1)/m_t*tf(k);
    p0s = [x0(k)+r0(k)*cos(ks); y0(k)+r0(k)*sin(ks)];
    for i = 1:m_t
        t = ts(i);
        pis = yourf(A(:, :, k), p0s, t);
        fill(pis(1, :), pis(2, :), '-g', 'faceAlpha', 0.2);
        hold on;
    end
end