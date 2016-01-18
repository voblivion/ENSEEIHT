function [y] = df(beta, lambda, x)

gamma = lambda + x;
alpha = (beta.^2) ./ (gamma.^3);
y = - 2 * sum(alpha);

end

