function [L, R] = aux(Points)
    L = Points(:,1);
    R = Points;
    n = size(Points, 2);
    for k = 1:n-1
        R(:,1:n-k) = 0.5 * R(:,1:n-k) + 0.5 * R(:,2:n-k+1);
        L = [L R(:,1)]; %#ok<AGROW>
    end
end