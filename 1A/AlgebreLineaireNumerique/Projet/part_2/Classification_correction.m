
%Number of simulations
Nens=20;
%Quality of the subspace approximation
percentInfo=0.95;

%Reading the observations
%%%
% TODO: select the file associated to your group number  
load('observation-G1.mat');
	  
% Initiatlization	  
Pi=zeros(3,1);

for GWi = 1:3
    %Generation of the data set
    Fi = Model(GWi,Nens);
    
    %Computation of the mean and anomalies 
    mFi= mean(Fi,2);
    Zi=Fi-repmat(mFi,1,Nens);
    
    %%%
    % TODO: compute the dominant left eigenvectors of Zi
    % accordingly to the targeted quality of the subspace approximation   
    [Ui,Si,~] = svd(Zi,0);  
    DS = diag(Si);
    if (DS(1)==0)
      disp('Matrix null')
      return
    end    
    converged=1;
    while (DS(converged)/DS(1)>1-percentInfo) 
      converged=converged+1;
    end
    converged=converged-1;
    Ui = Ui(:,1:converged);
    
    %%%
    % TODO: compute Pi
    %
    Zobs=Fobs-mFi;
    tmp=(Ui')*Zobs; % to prevent "out of memory" issues 
    Pi(GWi)=norm(Zobs-Ui*tmp);
    
end

figure(1)
bar(Pi)
