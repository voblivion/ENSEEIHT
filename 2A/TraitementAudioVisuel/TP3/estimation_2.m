function delta_estime = estimation_2(d,y,x_gauche,beta_0,x_droite,gamma_0)

n = size(y, 1);

G = [x_gauche; x_droite] - [beta_0 * (1-y).^d; gamma_0 * (1-y).^d];
A = zeros(n, d);
B = zeros(n, d-1);
for i = 1:d
    A(:,i) = nchoosek(d,i)*y.^i.*(1-y).^(d-i);
end
F = [A(:,1:d-1) B A(:,d); B A];
size(F)
size(G)
delta_estime = F\G;
end
