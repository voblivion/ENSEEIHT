function p = comptage(I, min_size)

[n, m, o] = size(I); %#ok<ASGLU>
P = zeros(n, m);

p = 0;
q = 0;
for i = 1:n
    for j = 1:m
        % Le pixel n'est pas encore classé
        if P(i, j) == 0
            p = p + 1;
            s = 1;
            P(i, j) = p;
            voisins = [];
            voisins_check = [];
            % Ajout des voisins à vérifier
            if i > 1 && P(i-1, j) == 0
                voisins = [voisins [i-1; j]]; %#ok<*AGROW>
                voisins_check = [voisins_check [i-1; j]];
            end
            if i < n && P(i+1, j) == 0
                voisins = [voisins [i+1; j]];
                voisins_check = [voisins_check [i+1; j]];
            end
            if j > 1 && P(i, j-1) == 0
                voisins = [voisins [i; j-1]];
                voisins_check = [voisins_check [i; j-1]];
            end
            if j < m && P(i, j+1) == 0
                voisins = [voisins [i; j+1]];
                voisins_check = [voisins_check [i; j+1]];
            end
            
            while size(voisins, 2) > 0
                voisins_nouv = [];
                for k = 1:size(voisins, 2)
                    ii = voisins(1, k);
                    jj = voisins(2, k);
                    if all(abs(I(ii, jj, :) - I(i, j, :)) < 0.001)
                        s = s + 1;
                        P(ii, jj) = p;
                        % Ajout des voisins à vérifier
                        if ii > 1 && P(ii-1, jj) == 0
                            check = 0;
                            for l = 1:size(voisins_check, 2)
                                if voisins_check(1, l) == ii-1 && voisins_check(2, l) == jj
                                    check = 1;
                                end
                            end
                            if ~check
                                voisins_nouv = [voisins_nouv [ii-1; jj]];
                                voisins_check = [voisins_check [ii-1; jj]];
                            end
                        end
                        if ii < n && P(ii+1, jj) == 0
                            check = 0;
                            for l = 1:size(voisins_check, 2)
                                if voisins_check(1, l) == ii+1 && voisins_check(2, l) == jj
                                    check = 1;
                                end
                            end
                            if ~check
                                voisins_nouv = [voisins_nouv [ii+1; jj]];
                                voisins_check = [voisins_check [ii+1; jj]];
                            end
                        end
                        if jj > 1 && P(ii, jj-1) == 0
                            check = 0;
                            for l = 1:size(voisins_check, 2)
                                if voisins_check(1, l) == ii && voisins_check(2, l) == jj-1
                                    check = 1;
                                end
                            end
                            if ~check
                                voisins_nouv = [voisins_nouv [ii; jj-1]];
                                voisins_check = [voisins_check [ii; jj-1]];
                            end
                        end
                        if jj < m && P(ii, jj+1) == 0
                            check = 0;
                            for l = 1:size(voisins_check, 2)
                                if voisins_check(1, l) == ii && voisins_check(2, l) == jj+1
                                    check = 1;
                                end
                            end
                            if ~check
                                voisins_nouv = [voisins_nouv [ii; jj+1]];
                                voisins_check = [voisins_check [ii; jj+1]];
                            end
                        end
                    end
                end
                voisins = voisins_nouv;
            end
            if s < min_size
                q = q + 1;
            end
        end
    end
end

p = p - q;

end