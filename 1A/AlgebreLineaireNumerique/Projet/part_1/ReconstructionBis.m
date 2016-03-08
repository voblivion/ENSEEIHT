%%% Set check to true for validation %%%
check=true;

% Number of simulations
%%%
Nens = 20;

% Wind parameter
GW = 1;
% Stopping criterions 
maxIter=100;
% of the reconstruction
percentInfo = 0.95;

% Generate the simulations
F = Model(GW,Nens);

% Ensemble mean
muF = mean(F,2);

% Compute the anomaly matrix
Z   = F - repmat(muF,1,Nens);

%%%%%%%  Compute the SVD of A    %%%%%%%
if (check)  
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
  fprintf('dimension of the subspace: %d\n',converged);
else
  %%%%
  % TODO: power iteration method
  %%%%
end