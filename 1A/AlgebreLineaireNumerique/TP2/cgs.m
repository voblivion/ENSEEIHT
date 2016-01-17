function Q = cgs(A)

    [n, m] =size(A);
    Q=A;

    for i = 1:m
        y = A(:,i)'*Q(:,1:i-1);
        Q(:,i) = Q(:,i)-Q(:,1:i-1)*y';
        Q(:,i) = Q(:,i)/norm(Q(:,i));
    end

end