%%%%% PARAMETERS %%%%%
% Add Fortran subfolder to path
addpath('Fortran')

% Number of simulations
Nens = 200;

% Wind parameter
GW = 1;

% Spectral size to keep
percentInfo = 0.95;

% Eigenvalue's precision
eps = 1.e-8;

% Pow for Power-method
p = 8;

% Max size of iteration subspace
m = 5;

% max number of iteration for Power-method
maxit = 500;

fprintf('Compute reconstruction (%d, %f, %d) :\n', Nens, percentInfo, p);
%%%%% GENERATE MATRIX %%%%%
% Generate the simulations
F = Model(GW,Nens);

% Compute the mean ensemble
muF = mean(F,2);

% Compute the anomaly matrix
Z = F - repmat(muF,1,Nens);

%%%%% PREPARE RECONSTRUCTION %%%%%
[X, ns, nt] = Model(GW,1);
X0 = X(1:ns,:);
Zp = zeros(size(X)); 
Z0=X0-muF(1:ns);

%%%%% USING MATLAB SVD %%%%%
fprintf('======================\n');
fprintf('    Using Matlab SVD :\n');
fprintf('======================\n');
% Compute Left Doninant Singular Space %
fprintf('        Compute Left Dominant Singular Space :\n');
tic;
[U1,d1] = matlab_subspace_svd(Z,Nens,percentInfo);
time1=toc;
fprintf('            Singular values : %d\n', size(d1,1));
fprintf('            Time to compute : %7.3f\n', time1);
fprintf('            Variability     : %3.2f\n', 1-d1(size(d1,1))/d1(1));
fprintf('\n');

% Reconstruction %
fprintf('        Compute Reconstruction :\n');
alpha=(U1(1:ns,:)'*U1(1:ns,:))\(U1(1:ns,:)'*Z0);
Zp=U1*alpha;

% Compute Error %
Xp1 = Zp + muF;
error=norm(Xp1-X)/norm(X);
fprintf('            Error           : %f\n', error);

%%%%% USING MATLAB POWER METHOD %%%%%
fprintf('===============================\n');
fprintf('    Using Matlab Power Method :\n');
fprintf('===============================\n');
% Compute Left Doninant Singular Space %
fprintf('        Compute Left Dominant Singular Space :\n');
tic;
[U2,d2] = matlab_subspace_iter_sv(Z,m,p,percentInfo,eps,maxit);
time2=toc;
fprintf('            Singular values : %d\n', size(d2,1));
fprintf('            Time to compute : %7.3f\n', time2);
fprintf('            Variability     : %3.2f%\n', 1-d2(size(d2,1))/d2(1));
fprintf('\n');

% Reconstruction %
fprintf('        Compute Reconstruction :\n');
alpha=(U2(1:ns,:)'*U2(1:ns,:))\(U2(1:ns,:)'*Z0);
Zp=U2*alpha;

% Compute Error %
Xp2 = Zp + muF;
error=norm(Xp2-X)/norm(X);
fprintf('            Error           : %f\n', error);

%%%%% USING FORTRAN POWER METHOD %%%%%
fprintf('================================\n');
fprintf('    Using Fortran Power Method :\n');
fprintf('================================\n');
% Compute Left Doninant Singular Space %
fprintf('        Compute Left Dominant Singular Space :\n');
tic;
[U3,d3] = fortran_subspace_iter_sv(Z,m,p,percentInfo,eps,maxit);
time3=toc;
fprintf('            Singular values : %d\n', size(d3,1));
fprintf('            Time to compute : %7.3f\n', time3);
fprintf('            Variability     : %3.2f%\n', 1-d3(size(d3,1))/d3(1));
fprintf('\n');

% Reconstruction %
fprintf('        Compute Reconstruction :\n');
alpha=(U3(1:ns,:)'*U3(1:ns,:))\(U3(1:ns,:)'*Z0);
Zp=U3*alpha;

% Compute Error %
Xp3 = Zp + muF;
error=norm(Xp3-X)/norm(X);
fprintf('            Error           : %f\n', error);

%%%% Display %%%%
global Lx Ly Nx Ny;
fprintf('___________________________________________________________\n');
fprintf('| Nens : %d; percentInfo : %1.2f; p : %d;|\n', Nens, percentInfo, p);
fprintf('|_________________________________________________________|\n');
fprintf('| Times : %7.3f (m.svd), %7.3f (m.pm), %7.3f (f.pm) |\n', time1, time2, time3);
fprintf('|_________________________________________________________|\n');


% draw result
    x = linspace(0,Lx,Nx);     %  Independent variable x
    y = linspace(0,Ly,Ny);     %  Independent variable y
    [Mx, My] = meshgrid(x,y);  %  2D arrays, mainly for plotting
    Mx = Mx'; My = My';        %  MatLab is strange!
    
      figure(2)
 for tt=1:nt
          subplot(2,2,1);
          z = X((tt-1)*ns+1:tt*ns,1);
          z = reshape(z,Nx,Ny);
          surf(Mx,My,z); shading('interp');
          axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Solution')
	  
          subplot(2,2,2);
          zappr = Xp1((tt-1)*ns+1:tt*ns,1);
          zappr = reshape(zappr,Nx,Ny);
          surf(Mx,My,zappr); shading('interp');
	  axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Reconstruction (Matlab SVD)')
	  
          subplot(2,2,3);
          zappr = Xp2((tt-1)*ns+1:tt*ns,1);
          zappr = reshape(zappr,Nx,Ny);
          surf(Mx,My,zappr); shading('interp');
	  axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Reconstruction (Matlab Power Method)')
	  
          subplot(2,2,4);
          zappr = Xp3((tt-1)*ns+1:tt*ns,1);
          zappr = reshape(zappr,Nx,Ny);
          surf(Mx,My,zappr); shading('interp');
	  axis([0,Lx,0,Ly ,5000,6000]);
	  pbaspect([3 1 3])
	  title('Reconstruction (Fortran Power Method)')
         drawnow
 end
