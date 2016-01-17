
function execTest(nbrRounds, mine)

% Récupérer les stratégies
files = dir('.');
strats = {};
for i = 1:size(files, 1)
    fileName = files(i).name;
    if size(fileName, 2) >= 4 && strcmp(fileName(1:4), 'str_')
        strats = union(strats, {fileName(1:size(fileName, 2)-2)});
    end
end

n = size(strats, 2);
results = zeros(n, n);

% Lancer les jeux
for i=1:n
    fprintf('\n%s :\n', strats{i});
    [tx, ty, gx, gy] = jeu(nbrRounds,strats{i},mine);
    results(i) = sum(gy);
end;

% Calculer les résultats
[sorteds, ind] = sort(results);
moyenne = mean(sorteds);

fprintf('\n%6.2f moyenne\n', moyenne(1));
for k=1:n
    i = n+1-k;
    j = ind(i);
    fprintf('%6.2f %s\n', sorteds(i), strats{j});
end

end