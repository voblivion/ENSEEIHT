function [x, minF, err] = minSansContrainte(fullNewton, func, gradF, hessF, x0)

f = str2func(func);
gf = str2func(gradF);
hf = str2func(hessF);
xk = x0;
fk = f(xk);
gk = gf(xk);
epsilonGradient = 10^-10;
epsilonX = 10^-15;
normG0 = norm(gk);
minGradient = epsilonGradient * (normG0 + epsilonGradient);
ngk = -gk;
hk = hf(xk);
p = 0;
maxRounds = 30000;
round = 0;
delta0 = 2;
deltak = delta0;
deltaMax = 10 + 10 * norm(x0);
eta1 = 0.25;
eta2 = 0.75;
gamma1 = 0.5;
gamma2 = 2;
again = 1;

% |gradf(xk)| / |gradf(x0)| < epsilon
% |xk+1 - xk| / |xk| < epsilon
if ~fullNewton
    while (norm(gk) > minGradient) && (p > epsilonX || again) && (round < maxRounds)
        %% Calcul du pas de cauchy
        sk = pasDeCauchy(gk, hk, deltak);

        %% Calculer le nouveau point courant
        xn = xk + sk;
        fn = f(xn);
        rhok = (fk - fn) / (- gk' * sk - 1/2 * sk' * hk * sk);
        lastAgain = again;
        again = 0;
        if rhok < eta1
            xn = xk;
            again = 1;
        end

        %% Mise à jour de la région de confiance
        if rhok >= eta2
            deltak = min(gamma2 * deltak, deltaMax);
        else
            if rhok < eta1
                deltak = gamma1 * deltak;
            end
        end

        %% Calcul de l'amélioration effectuée
        p = norm(xn - xk) / norm(xk);

        %% Préparer les données pour le prochain tour
        xk = xn;
        fk = f(xk);
        gk = gf(xk);
        ngk = -gk;
        % h = df/dxi.xj = t(j(gf))
        hk = hf(xk);
        round = round + 1;
    end
else
    while (norm(gk) > minGradient) && (p > epsilonX) && (round < maxRounds)
        %% Calcul du pas
        dk = hk \ ngk;

        %% Calculer le nouveau point courant
        xn = xk + dk;

        %% Calcul de l'amélioration effectuée
        p = norm(xn - xk) / norm(xk);

        %% Préparer les données pour le prochain tour
        xk = xn;
        fk = f(xk);
        gk = gf(xk);
        ngk = -gk;
        % h = df/dxi.xj = t(j(gf))
        hk = hf(xk);
        round = round + 1;
    end
end

if ~(norm(gk) > minGradient) || ~(p > epsilonX)
    fprintf('L algorithme a convergé en %d tours.\n', round);
    fprintf('La norme du gradient était de %s.\n', norm(gk));
    fprintf('Le dernier pas effectué était de %f*10^-10.\n', p*10^10);
    x = xk;
    minF = f(xk);
    err = 0;
else
    fprintf('Nombre de tours maximal %d atteint.\n', round);
    x = xk;
    minF = f(xk);
    err = 1;
end

end
