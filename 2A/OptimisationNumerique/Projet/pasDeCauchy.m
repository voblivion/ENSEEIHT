function s = pasDeCauchy(g, h, delta)
    a = 1/2 * g' * h * g;
    ng = norm(g);
    b = - ng^2;
    
    % Calcul de s
    if a > 0
        t = - b / (2 * a);
        if t > delta / ng
            t = delta / ng;
        end
    else
        if ng == 0
            t = 1;
        else
            t = delta / ng;
        end
    end
    
    s = - t * g;
end
