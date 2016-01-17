function Q = mgs(A)

    [n, m] =size(A);
    Q=A;

    for i = 1:m
        y = A(:,i);
        for j = 1:i-1
            y = y-(y'*Q(:,j))*Q(:,j);
        end
        y = y/norm(y);
        Q(:,i) = y;
    end

end