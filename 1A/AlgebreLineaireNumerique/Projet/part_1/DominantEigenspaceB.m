function [U,D] =  DominantEigenspace(Z, epsilon, maxIter, p, percentTrace)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   
    %   Calcul les vecteurs dominants de l'espace singulier gauche de Z.
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %   Initialisation of m
    m = size(Z,2);
    
    %   Generate an initial set of m orthonormal vectors V [O(m*n)]
    V = randn(size(Z,1),m);
    for i = 1:size(V,2)
        for j = 1:(i-1)
            V(:,i) = V(:,i) - (V(:,j)'*V(:,i))*V(:,j);
        end
        V(:,i) = V(:,i)./norm(V(:,i));
    end
    
    %	Initializations
    nIter = 0;
    converged = 0;
    percentReached = 0;
    
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
    while (percentReached <= percentTrace && nIter <= maxIter)
        
        %   Compute Y such that Y = A^p.V [O(n²*p)]
        Y = B*(Z'*V);
        
        %   Orthonormalization of the columns of Y in V [O(n⁴)]
        for i = 1:size(Y,2)
            %   [O(n³)]
            for j = 1:(i-1)
                %   [O(n²)]
                Y(:,i) = Y(:,i) - (Y(:,j)'*Y(:,i))*Y(:,j);
            end
            if (norm(Y(:,i)) ~= 0)
                %   [O(n³)]
                Y(:,i) = Y(:,i)./norm(Y(:,i));
            end
        end
        V = Y;
        
        %   Compute the Rayleigh quotient H = tV.A.V [O(n²*m²)]
        H = tZ*V;
        H = Z*H;
        H = V'*H;
        
        %   Compute the spectral decomposition H = X.D.tX [O(n³)]
        [W, D] = eig(H);
        X = W';
        
        %   Arrange the eigenvalues of H in descending order of magnitude
        [Dp,I] = sort(diag(D),2,'descend');
        X = X(:,I);
        Dp = diag(Dp);
        
        %   Compute V.X in V 
        V = V*X;
        
        %   [O()]
        for i = converged+1:m
            %   [O(n²*m²)]
            val = norm(Z*(tZ*V(:,i))-Dp(i,i)*V(:,i))/Dp(1,1)
            if (val < epsilon) 
                %   Update converged and PercentReached
                converged = converged + 1;
                %   [O(m)]
                percentReached = sum(diag(Dp(1:i,1:i)))/trace;
            else
                break
            end
        end
        
        %   Update nIter 
        nIter = nIter + 1;
    end
    
    U = V(:,1:converged);
    D = D(1:converged,1:converged);

return
            
            














