function s = moreSorensen(g, h, delta)

epsilon = 10^-10;

%% Recherche d'une solution intérieur
sn = h \ (-g);
[v, d] = eig(h);
lambda = diag(d);
if norm(sn) < delta && all(lambda > 0)
    s = sn;
%% Recherche d'une solution sur la frontière
else
    s = 0;
end
    [lambda, indices] =  sort(lambda);
    q = [];
    for i=indices
        q = [q v(i)];
    end
    beta = q' * g;
    
    if beta(1) ~= 0
        %% Calcul de xmin et xmax
        dy = 2;
        ymin = abs(beta(1));
        ymax = abs(beta(1)) * 2;
        fxmin = f(beta, lambda, delta, -lambda(1) + ymin);
        fxmax = f(beta, lambda, delta, -lambda(1) + ymax);
        while fxmin * fxmax >= 0
            ymin = ymin / 2;
            ymax = ymax * 2;
            fxmin = f(beta, lambda, delta, -lambda(1) + ymin);
            fxmax = f(beta, lambda, delta, -lambda(1) + ymax);
        end
        xmin = -lambda(1) + ymin;
        xmax = -lambda(1) + ymax;
        
        %% Résolution de l'équation non linéaire
        x = newtonNonLineaire(beta, lambda, delta, xmin, xmax);
        
    else
        
    end
end

