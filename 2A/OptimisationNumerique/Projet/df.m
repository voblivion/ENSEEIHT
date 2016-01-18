%%
%
%   df avec f = ║s║² et s : x -> - Somme(beta_i / (lambda_i + x))
%
%
function [y] = df(beta, lambda, x)

gamma = lambda + x;
alpha = (beta.^2) ./ (gamma.^3);
y = - 2 * sum(alpha);

end

