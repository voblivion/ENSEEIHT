function I = simplifier(I, min_dist)
    [n, m, o] = size(I); %#ok<ASGLU>
    
    for i = 1:n
        for j = 1:m
            %% Pour chaque pixel de l'image
            for jj = j+1:m
                %% Simplifier les pixels proches sur la même ligne
                
            end
            for ii = i+1:n
                for jj = 1:m
                    %% Simplifier les pixels proches sur les lignes suivantes
                    if all(abs(I(i, j, :) - I(ii, jj, :)) < min_dist)
                        I(ii, jj, :) = I(i, j, :);
                    end
                end
            end
        end
    end
end