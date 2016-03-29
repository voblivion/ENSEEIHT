function Grille = grille(tx, ty, type)
  [X,Y] = meshgrid(tx, ty);
  if type == 1
    Z=exp(-((X-1/2).^2+(Y-1/2).^2));
  else
      if type == 2
          Z=sin((X + Y) * 2 * pi);
      else
          s = 0:6.28/6+0.0001:6.28;
          t = 0:6.28/6+0.0001:6.28;
          n = size(s, 2);
          m = size(t, 2);
          X = zeros(n, m);
          Y = zeros(n, m);
          Z = zeros(n, m);
          i = 0;
          for u = s
              i = i + 1;
              j = 0;
              for v = t
                  j = j + 1;
                  p0 = [cos(u) - 2; sin(u); 0];
                  r = [cos(v) 0 -sin(v); 0 1 0; sin(v) 0 cos(v)];
                  p = r * p0;
                  X(i, j) = p(1);
                  Z(i, j) = p(2);
                  Y(i, j) = p(3);
              end
          end
      end
  end
  Grille=zeros(size(X,1),size(X,2),3);
  Grille(:,:,1)=X;
  Grille(:,:,2)=Y;
  Grille(:,:,3)=Z;
end