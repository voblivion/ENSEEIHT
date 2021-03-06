
% Number of simulations
Nens = 30;

% Wind parameter
GW = 1;

% Stopping criterions 
maxIter=100;
percentInfo = 0.95;

fprintf('==== Computing F, some random solutions ====\n');
% Generate the simulations
F = Model(GW,Nens);
fprintf('Computed !\n\n');

% Ensemble mean
muF = mean(F,2);

% Compute the anomaly matrix
Z   = F - repmat(muF,1,Nens);

fprintf('==== SVD ====\n');
fprintf('==== Computing dominant eignspace using SVD ====\n');
[U,S,~] = svd(Z,0);
D = diag(S);
if (D(1)==0)
    disp('Alert: the matrix is null')
    return
end
converged=1;
while (D(converged)/D(1)>1-percentInfo) 
    converged=converged+1;
end
converged=converged-1;
U = U(:,1:converged);
fprintf('Dimension of the subspace: %d\n\n', converged);

%%%%%%%       Reconstruction        %%%%%%%
[X, ns, nt] = Model(GW,1);
X0 = X(1:ns,:);
Z0 = X0 - muF(1:ns,:);
U0 = U(1:ns,:);
%
%   minimize ||U0.a - Z0||
%   minimize ||Q.R.a - Z0||
%   minimize ||tQ.(Q.R.a - Z0)|| (||tA.x|| = ||x|| if A orthon.)
%   minimize ||R.a - tQ.Z0|| : R pinv
%
[Q,R] = qr(U0);
tQ = Q';
alpha = pinv(R)*(tQ*Z0);
Zp = U*alpha;


%%%% Compute the error %%%%
Xp = Zp + muF;
error=norm(Xp-X)/norm(X);
fprintf('Error: %f\n\n',error);

fprintf('==== Power Method ====\n');
fprintf('==== Computing dominant eignspace using Power Method ====\n');
[U,D] = DominantEigenspace(Z, 0.1, 10, 1, percentInfo);
fprintf('Dimension of the subspace: %d\n', size(U, 2));


%%%%%%%       Reconstruction        %%%%%%%
[X, ns, nt] = Model(GW,1);
X0 = X(1:ns,:);
Z0 = X0 - muF(1:ns,:);
U0 = U(1:ns,:);
%
%   minimize ||U0.a - Z0|| a = pinv(U0)*Z0
%   minimize ||Q.R.a - Z0||
%   minimize ||tQ.(Q.R.a - Z0)|| (||tA.x|| = ||x|| if A orthon.)
%   minimize ||R.a - tQ.Z0|| : R pinv
%
alpha = pinv(U0)*Z0;
Zp = U*alpha;


%%%% Compute the error %%%%
Xp = Zp + muF;
error=norm(Xp-X)/norm(X);
fprintf('Error: %f\n\n',error);

%%%% Display %%%%
global Lx Ly Nx Ny;

% draw result
    x = linspace(0,Lx,Nx);     %  Independent variable x
    y = linspace(0,Ly,Ny);     %  Independent variable y
    [Mx, My] = meshgrid(x,y);  %  2D arrays, mainly for plotting
    Mx = Mx'; My = My';        %  MatLab is strange!
    
      figure(2)
 for tt=1:nt
          subplot(1,2,1);
          z = X((tt-1)*ns+1:tt*ns,1);
          z = reshape(z,Nx,Ny);
          surf(Mx,My,z); shading('interp');
          axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Solution')
	  
          subplot(1,2,2);
          zappr = Xp((tt-1)*ns+1:tt*ns,1);
          zappr = reshape(zappr,Nx,Ny);
          surf(Mx,My,zappr); shading('interp');
	  axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Reconstruction')
         drawnow
  end

