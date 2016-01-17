
%Number of simulations
Nens=30;

%Quality of the subspace approximation
percentInfo=0.95;

%Reading the observations
load('observation-G28.mat');
	  
% Initiatlization	  
Pi=zeros(3,2);

for GWi = 1:3
    %Generation of the data set
    Fi = Model(GWi,Nens);
    
    %Computation of the mean and anomalies 
    mFi= mean(Fi,2);
    Zi=Fi-repmat(mFi,1,Nens);
    
    %%%%%%%  Compute the SVD of A    %%%%%%%
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
    
    %%%%%%%  Power Method    %%%%%%%
    [Uj,Dj] = DominantEigenspace(Zi, 0.1, 10, 2, percentInfo);

    %   Compute the distance to orth(Ui)
    Zobsi = Fobs - mFi;
    Pi(GWi,1) = norm(Zobsi - Ui*(Ui'*Zobsi))
    Pi(GWi,2) = norm(Zobsi - Uj*(Uj'*Zobsi))
end

figure(1)
bar(Pi)



