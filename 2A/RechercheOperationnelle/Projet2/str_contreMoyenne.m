function x = strategie(numpart,tx,ty,gx,gy)

if numpart == 1
    x = 1.25;
else
    x = 1 / 2 * (3 - mean(ty(1:numpart-1)));
end