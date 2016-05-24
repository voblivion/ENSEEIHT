function [mu, Sigma] = mu_Sigma(X)

n = size(X, 1);

mu = mean(X, 1);

Sigma = (X - repmat(mu, n, 1))' * (X - repmat(mu, n, 1)) / n;

end

