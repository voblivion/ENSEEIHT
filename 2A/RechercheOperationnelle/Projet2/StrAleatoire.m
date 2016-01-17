%% StrAleatoire
%
% Forme recherchée : y = a + b * rand()
%
function [x, ok] = StrAleatoire(ux, uy, n, kMin)

% Parametres
epsilon = 10^-5;
d = 3;

% TODO
% Faire plutôt en fonction des a et b (ax + b)
ok = true;
x = 1 / 2 * (d - mean(uy));
for i = 1:n
    c = sum(abs(uy - uy(i)) < epsilon);
    if c > n / 4
        ok = false;
    end
end

end