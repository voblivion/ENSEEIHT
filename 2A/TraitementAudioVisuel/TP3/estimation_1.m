function delta_estime = estimation_1(d,y,x_gauche,beta_0,x_droite,gamma_0)

n = size(y, 1);

G = [x_gauche; x_droite] - [beta_0 * (1-y).^d; gamma_0 * (1-y).^d];
A = zeros(n, d);
B = zeros(n, d);
for i = 1:d
    A(:,i) = nchoosek(d,i)*y.^i.*(1-y).^(d-i);
end
F = [A B; B A];
delta_estime = F\G;
end