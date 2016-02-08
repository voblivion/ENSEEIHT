%%
%
%   f = ║s║² et s : x -> - Somme(beta_i / (lambda_i + x))
%
%
function [y] = f(beta, lambda, delta, x)

gamma = lambda + x;
alpha = beta ./ gamma;
y = sum(alpha.^2) - delta^2;

end

