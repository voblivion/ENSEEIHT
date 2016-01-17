function x = strategie(numpart,tx,ty,gx,gy)
n = numpart - 1;
d = 3;

if mod(numpart, 3) == 0
    x = 0.75;
else
    if mod(numpart, 3) == 1
        x = 1.5;
    else
        x = 1;
    end
end

end