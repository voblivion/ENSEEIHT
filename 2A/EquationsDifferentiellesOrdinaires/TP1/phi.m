function [dy] = phi(t, y)

dy = zeros(size(y));
dy(:, 1) = y(:, 2);
dy(:, 2) = (1 - y(:, 1).^2) .* y(:, 2) - y(:, 1);

end

