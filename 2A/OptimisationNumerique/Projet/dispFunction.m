minX = -10;
maxX = 10;
minY = -10;
maxY = 10;
pasX = 1;
pasY = 1;

x = minX:pasX:maxX
y = minY:pasY:maxY
t = [x; y]
f = str2func('f2');

z = [];
for i = x
    zt = [];
    for j = y
        zt = [zt f([i, j])];
    end
    z = [z; zt];
end

plot3(x, y, z);