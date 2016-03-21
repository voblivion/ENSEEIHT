function Grille = grille(tx, ty, type)
  [X,Y] = meshgrid(tx, ty);
  if type == 1
    Z=exp(-((X-1/2).^2+(Y-1/2).^2));
  else
    Z=sin((X + Y) * 2 * pi);
  end
  Grille=zeros(size(X,1),size(X,2),3);
  Grille(:,:,1)=X;
  Grille(:,:,2)=Y;
  Grille(:,:,3)=Z;
  Grille(1,1,3) = 1;
end