function [x_mu, y_mu, Sigma] = estimation_gaussienne(x, y)
n = length(x);
x_mu = mean(x);
x_centre = x-x_mu;
y_mu = mean(y);
y_centre = y-y_mu;
Sigma = diag([sqrt(sum(x_centre.^2))/n; sqrt(sum(y_centre.^2))/n]);
end