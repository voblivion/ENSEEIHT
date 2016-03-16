function pts = DeCasteljau(Points, iter)
    n = size(Points, 2);
    P = [1:n; Points];
    m = size(P, 1);
    for i = 1:iter
        [L, R] = aux(P);
        P = [L; R];
    end
    qts = reshape(P, [m n*2^(iter)]);
    [~,I] = sort(qts(1,:));
    qts = qts(:,I);
    pts = qts(2:m,:);
end