function dx = derivateur(x, x1, x0, delta)

if x1 == -1
    x1 = x0;
end

dx = (x - x1) / delta;

end
