function [U,d] =  matlab_subspace_iter_sv(Z, m, p, percentage, eps, maxit)

  n=length(Z(:,1));  
  V=zeros(n,m);
  
  for k=1:m
    V(k,k)=1;
  end
  converged=0;
  iter=0;  
  condition=0;
  while((converged<m)&&(iter<maxit)) 
    iter=iter+1;
    
    %Compute Y=(A*A')^p*V
    Y=V;
    for k=1:p
      Y=Z*((Z')*Y);
    end
   
    %Gram-Schmidt orthogonalization
    V=Y;
    for i=1:m
       for j=1:i-1
    	  s=V(:,j)'*V(:,i);
          V(:,i) = V(:,i) - s*V(:,j);
       end
       V(:,i) = V(:,i)/norm(V(:,i));
    end
  
    %Rayleigh quotient
    H=(V')*(Z*((Z')*V));
  
    %eig-decomposition of H
   [Ens,dns]=eig(H);
   [d,index]=sort(diag(dns),'descend');
    E=Ens(:,index);
   
    %V=V*X
    V=V*E; 
  
    % Check wich are the eigenvalues that have converged 
    conv=0;
    for i=converged+1:m
      res=norm(Z*((Z')*V(:,i))-d(i)*V(:,i),'fro')/norm(Z,'fro'); 
      if (res>eps)
        break
      end
      conv=conv+1;
      s(i)=sqrt(d(i));
      condition=1-s(i)/s(1);       
    end
    converged=converged+conv;
    U = V(:,1:converged-1);
    time=toc;
  
    %Stopping criterion
    if(condition>percentage)
      disp('Convergence')
      break
    end
return