function [x,R] = gomory(OPT,c,A,b)
m = size(A,1);  % nombre de lignes
n = size(A,2);  % nombre de colonnes
[x, R, GAMMA, JN] = simplexe(OPT,c,A,b);

while any((x ~= floor(x)) == 0)
    % Calcul des résidus
    F = GAMMA - floor(GAMMA)
    % Récupération de l'équation qui fait que x non entier
    i = 1;
    while ((F(i,JN) * x(JN)) - F(i,n+1) == 0)
        i = i + 1;
    end
    % Calcul de l'équation a ajouter pour afiner
    eq3iGaucheB = zeros(1,n);
    for j = JN
        eq3iGaucheB(1,j) = -F(i,j);
    end
    eq3iGauche = [eq3iGaucheB 1];
    
    c = [c; 0];
    A = [[A zeros(m,1)]; eq3iGauche];
    b = [b; F(i,n+1)];
    [x, R, GAMMA, JN] = simplexe(OPT,c,A,b);
end
% intlinprog