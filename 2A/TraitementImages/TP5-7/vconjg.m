% Verification de la relation de conjugaison
%
conservation;

if all(abs(imfn(2:nlig, 2:ncol)-conj(imfn(nlig:-1:2, ncol:-1:2))) == 0)
    disp('Relation de conjugaison verifiée sur (2:nlig, 2:ncol)');
else
    disp('ATTENTION Relation de conjugaison NON verifiée sur (2:nlig, 2:ncol)');
end
if all(abs(imfn(1, 2:ncol)-conj(imfn(1, ncol:-1:2))) == 0)
    disp('Relation de conjugaison verifiée sur (1, 2:ncol)');
else
    disp('ATTENTION Relation de conjugaison NON verifiée sur (1, 2:ncol)');
end
if all(abs(imfn(2:nlig, 1)-conj(imfn(nlig:-1:2, 1))) == 0)
    disp('Relation de conjugaison verifiée sur (2:nlig, 1)');
else
    disp('ATTENTION Relation de conjugaison NON verifiée sur (2:nlig, 1)');
end