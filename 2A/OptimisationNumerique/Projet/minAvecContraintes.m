function [x, minF, err] = minAvecContraintes(type, f, gf, hf, ce, gce, mhce, x0, lambda0)

epsilon1 = 10^-8;
epsilon2 = 10^-6;
epsilon3 = 10^-8;
n = size(x0, 1);
m = size(ce(x0), 2);
muk = 1;
tau = 1.5;
etac = 0.1258925;
alpha = 0.1;
beta = 0.9;
epsilon0 = 1/muk;
epsilonk = epsilon0;
etak = etac / (muk^alpha);
xk = x0;
lambdak = lambda0;
round = 0;
roundMax = 50000;

function y = LA(x)
    cex = ce(x);
    if m == 0
        y = f(x)
    else
        y = f(x) + lambdak'*cex + muk / 2 * norm(cex)^2;
    end
end

function gy = gLA(x)
    gcex = gce(x);
    gy = gf(x) + lambdak' * gcex + muk * ce(x)' * gcex;
end

function gy = gL(x, lambda)
    gy = gf(x) + lambda' * gce(x);
end

function hy = hLA(x)
    gcex = gce(x);
    mhcex = mhce(x);
    
    s1 = zeros(n);
    for i = 1:m
        s1 = s1 + lambdak(i) * mhcex((i-1)*n+1:i*n,:);
    end
    
    cex = ce(x);
    s2 = zeros(n);
    for i = 1:m
        s2 = s2 + cex(i) * mhcex((i-1)*n+1:i*n,:);
    end
    
    hy = hf(x) + s1 + muk * (s2 + gcex' * gcex);
end

converge = 0; % grandient du lagrangien (non augmenté) < eps2 et contraintes < eps3 et n on stagnation et itération
while ~converge
    xj = xk;
    [xk, minLA, err] = minSansContrainte(type, @LA, @gLA, @hLA, xk, epsilonk);
    cex = ce(xk);
    fprintf('--------------------------------\n');
    xk
    converge = (norm(gL(xk, lambdak)) < epsilon1 && norm(cex) < epsilon2) || norm(xj - xk) < epsilon3 || round >= roundMax;
    if ~converge
        if norm(cex) <= etak
            lambdak = lambdak + muk * cex;
            epsilonk = epsilonk / muk;
            etak = etak / muk;
        else
            muk = tau * muk;
            epsilonk = epsilon0 / muk;
            etak = etac / (muk^alpha);
        end
    end
    lambdak
    muk
    round = round + 1;
end

x = xk;
minF = f(x);
fprintf('L algorithme a convergé en %d tours.\n', round);
fprintf('Le dernier pas effectué était de %f*10^-10.\n', norm(xk - xj)*10^10);
fprintf('La norme des contraintes évaluées en x est de %f*10^-10.\n', norm(cex)*10^-10);


end
