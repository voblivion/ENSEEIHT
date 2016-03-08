%%% Set check to true for validation %%%
check=false;

%Number of simulations
Nens=20;
%Quality of the subspace approximation
percentInfo=0.95;

%Reading the observations
load('observation-G28.mat');
	  
% Initiatlization	  
Pi=zeros(3,1);

for GWi = 1:3
    %Generation of the data set
    Fi = Model(GWi,Nens);
    
    %Computation of the mean and anomalies 
    mFi= mean(Fi,2);
    Zi=Fi-repmat(mFi,1,Nens);
    
    %%%%%%%  Compute the SVD of A    %%%%%%%
    if (check)  
      [Ui,Si,~] = svd(Zi,0);
      Di = diag(Si);
      if (Di(1)==0)
        disp('Alert: the matrix is null')
        return
      end
      converged=1;
      while (Di(converged)/Di(1)>1-percentInfo) 
        converged=converged+1;
      end
      converged=converged-1;
      Ui = Ui(:,1:converged);
      fprintf('Dimension of the subspace: %d\n',converged);
    else
      [Ui,Di] = DominantEigenspace(Zi, 0.01, 10, 2, percentInfo);
    end
    
    %   Compute the distance to orth(Ui)
    Zobsi = Fobs - mFi;
    Pi(GWi) = norm(Zobsi - Ui*(Ui'*Zobsi))
end

figure(1)
bar(Pi)



