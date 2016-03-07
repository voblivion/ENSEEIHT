function param = estimation_ellipse(x,y)

n = size(x, 1);
Pd = [x y];
A = ones(n, 6);
A(:,1) = Pd(:,1).^2;
A(:,2) = Pd(:,1).*Pd(:,2);
A(:,3) = Pd(:,2).^2;
A(:,4) = Pd(:,1);
A(:,5) = Pd(:,2);
[V, D] = eig(A'*A);
D = diag(D);
i = find(D == min(D));
p = V(:, i); %#ok<FNDSB>

[C,theta_0,a,b] = conversion(p);

param(1) = C(1);
param(2) = C(2);
param(3) = a;
param(4) = b;
param(5) = theta_0;
