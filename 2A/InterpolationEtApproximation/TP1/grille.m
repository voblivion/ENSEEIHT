function Grille = grille(tx, ty)
  [X,Y] = meshgrid(tx, ty);
  Z=exp(-((X-1/2).^2+(Y-1/2).^2));
  Grille=zeros(size(X,1),size(X,2),3);
  Grille(:,:,1)=X;
  Grille(:,:,2)=Y;
  Grille(:,:,3)=Z;
end