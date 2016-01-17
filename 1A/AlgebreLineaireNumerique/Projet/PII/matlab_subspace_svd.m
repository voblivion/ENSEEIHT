function [U,d] =  matlab_subspace_svd(Z, m, percentage)

  [U,S,~] = svd(Z,0);
  d = diag(S);
  
  if (d(1)==0)
    disp('Alert: the matrix is null')
    return
  end
  
  converged=0;
  condition = 0;
  while (condition < percentage && converged <= m)
    converged=converged+1;
    condition = 1 - d(converged)/d(1);
    fprintf('condition : %f\n', condition);
  end
  
  U = U(:,1:converged);
  d = d(1:converged);
return