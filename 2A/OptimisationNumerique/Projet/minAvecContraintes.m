function [x, minF, err] = minAvecContraintes(type, f, gf, hf, ce, gce, mhce, x0, lambda0)

n = size(x0, 1);
m = size(ce, 2);
muk = 1;
tauk = 1;
etac = 0.1258925;
alpha = 0.1;
beta = 0.9;
epsilonk = 1/muk;
etak = etac / (muk^alpha);
xk = x0;
lambdak = lambda0;

function y = LA(x)
    cex = ce(x);
    y = f(x) + lambdak'*cex + muk / 2 * norm(cex)^2;
end

function gy = gLA(x)
    gcex = gce(x);
    gy = gf(x) + gcex' * lambdak + muk * gcex' * ce(x);
end

function hy = hLA(x)
    gcex = gce(x);
    
    s1 = zeros(m);
    for i = 1:m
        s1 = s1 + lamndak(i) * mhce(i, x);
    end
    
    cex = ce(x);
    s2 = zeros(m);
    for i = 1:m
        s2 = s2 + cex(i) * mhce(i, x);
    end
    
    hy = hf(x) + s1 + muk * (s2 + gcex' * gcex);
end

converge = 0; % grandiant du lagrangien (non augmenté) < eps2 et contraintes < eps3 et n on stagnation et itération
while ~converge
    [xk, minLA, err] = minSansContrainte(type, @LA, @gLA, @hLA, xk, epsilonk);
    if norm(ce(xk)) <= etak
        lambdak
end



end

function y = L(f, ce, x, lambda)
    y = f(x) + lambda' * ce(x);
end



function hy = hL(x)
    
end