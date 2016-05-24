function [d, i] = sub_score(sample, data)
m = log2(1 + 1/15);

% % Version euclidienne...
% ds = data - repmat(sample, size(data, 1), 1);
% ds = sqrt(sum(ds.^2, 2));
% [d, i] = min(ds);
% return


ds(:, 1) = abs(data(:, 1) - sample(1));
ds(:, 2) = abs(log2(data(:, 2)) - log2(sample(2)));

d = inf;
for j = 1:size(data, 1)
    if ds(j, 2) < m && ds(j, 1) < d
        d = ds(j, 1);
        i = j;
    end
end

d = d^(1/2);

end

