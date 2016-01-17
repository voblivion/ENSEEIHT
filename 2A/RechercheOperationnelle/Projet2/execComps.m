
function nothing = execComps(nbrRounds, mine)

% Récupérer les stratégies
files = dir('.');
strats = {};
k = 0;
mineInd = 1;
for i = 1:size(files, 1)
    fileName = files(i).name;
    if size(fileName, 2) >= 4 && strcmp(fileName(1:4), 'str_')
        k = k + 1;
        if strcmp(fileName(1:size(fileName, 2)-2), mine)
            mineInd = k;
        end
        strats = union(strats, {fileName(1:size(fileName, 2)-2)});
    end
end

n = size(strats, 2);
results = zeros(n, n);

% Lancer les jeux
for i=1:n
    for j=1:n
        [tx, ty, gx, gy] = jeu(nbrRounds,strats{i},strats{j});
        results(j, i) = sum(gx);
    end;
end;

% Calculer les résultats
means = mean(results);
mins = min(results);
maxs = max(results);
[sorteds, ind] = sort(means);


fprintf('%s/Min/Mean/Max\n', mine);
for k=1:n
    i = n+1-k;
    j = ind(i);
    fprintf('%6.2f %6.2f  %6.2f  %6.2f %s\n', results(j, mineInd), mins(j), sorteds(i), maxs(j), strats{j});
end

end