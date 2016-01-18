function s = moreSorensen(g, h, delta)

%% Recherche d'une solution intérieur
sn = h \ (-g);
[v, d] = eig(h);
lambda = diag(d);
if norm(sn) < delta && all(lambda > 0)
    s = sn;
    return;
%% Recherche d'une solution sur la frontière
else
    [lambda, indices] =  sort(lambda);
    q = v(:,indices);
    beta = q' * g;
    
    if beta(1) ~= 0
        fprintf('1 Cas super simple\n');
        s = resolutionNonLineaire(q, g, beta, lambda, delta);
        return;
    else
        n = size(q, 2);
        s1 = - sum((q(:,2:n)'*g) ./ (lambda(2:n) - lambda(1)) * q(:,2:n), 2)
        if norm(s1) > delta
            fprintf('2.1 Cas simple\n');
            s = resolutionNonLineaire(q(2:n), g, beta(2:n), lambda(2:n), delta);
            return;
        else
            fprintf('2.2 Cas difficile\n');
            
            alpha = sqrt(delta^2 - norm(s1)^2);
            s = s1 + alpha*q(:,1);
            return;
        end
    end
end

end

function s = resolutionNonLineaire(q, g, beta, lambda, delta)
    %% Calcul de xmin et xmax
    dy = 2;
    ymin = abs(beta(1));
    ymax = abs(beta(1)) * 2;
    fxmin = f(beta, lambda, delta, -lambda(1) + ymin);
    fxmax = f(beta, lambda, delta, -lambda(1) + ymax);
    while fxmin * fxmax >= 0
        ymin = ymin / dy;
        ymax = ymax * dy;
        fxmin = f(beta, lambda, delta, -lambda(1) + ymin);
        fxmax = f(beta, lambda, delta, -lambda(1) + ymax);
    end
    xmin = -lambda(1) + ymin;
    xmax = -lambda(1) + ymax;

    %% Résolution de l'équation non linéaire
    x = newtonNonLineaire(beta, lambda, delta, xmin, xmax);
    
    %% Calcul de s*
    s = 0;
    for i=1:size(q ,2)
        s = s - (q(:,i)'*g) / (lambda(i) + x) * q(:,i);
    end
end
