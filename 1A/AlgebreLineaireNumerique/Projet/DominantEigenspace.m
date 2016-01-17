function [U,D] =  DominantEigenspace(Z, epsilon, maxIter, p, percentInfo)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   
    %   Calcul les vecteurs dominants de l'espace singulier gauche de Z.
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %   Initialisation of m
    m = size(Z,2);
    
    %   Generate an initial set of m orthonormal vectors V [O(m*n)]
    X = randn(size(Z,1),1);
    V = zeros(size(Z,1),m);
    L = zeros(1,m);
    
    %	Initializations
    nIter = 0;
    converged = 0;
    percent = 0;
    
    %   Compute Trace(A) [O(m*n)]
    tZ = Z';
    trace = 0;
    for i = 1:size(Z,1)
        for j = 1:size(Z,2)
            trace = trace + Z(i,j)*Z(i,j);
        end
    end
    
    %   Compute B = A^(p-1).Z
    C = Z'*Z;
    B = eye(m,m);
    for i = 1:(p-1)
        B = C*B;
    end
    B = Z*B;
    
    %   [O()]
    while (percent <= percentInfo && nIter <= maxIter)
       
        i = 1;
        while X(i,1) == 0 && i < size(Z)
            i = i+1;
        end
        if X(i,1) == 0
            return
        end
        
        Y = Z*(Z'*X);
        lambda = Y(i,1)/X(i,1);
        
        if norm(Y(:,1)-lambda*X(:,1)) < epsilon
            converged = converged + 1;
            V(:,converged) = X;
            L(1,converged) = lambda;
            percent = lambda/L(1,1);
            
            X = randn(size(Z,1),1);
            for i = 1:converged
                %   [O(n²)]
                X = X - (V(:,i)'*X)*Y(:,i);
            end
        else
            X = Z*(Z'*X);
        end
        X = X/norm(X);
        
        %   Update nIter 
        nIter = nIter + 1;
    end
    
    U = V(:,converged);
    D = diag(L(1,converged));

return
            
            














