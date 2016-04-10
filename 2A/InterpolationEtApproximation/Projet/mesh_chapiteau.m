% Chapiteau mesh

vertices = zeros(13, 3);
k = 1;
vertices(k, :) = [0 0 1];
k = k + 1;
for i = 1:6
    vertices(k, :) = [cos(i*2*pi/6) sin(i*2*pi/6) 0.8];
    k = k + 1;
end
for i = 1:6
    vertices(k, :) = [2*cos(i*2*pi/6 + pi/6) 2*sin(i*2*pi/6 + pi/6) 0];
    k = k + 1;
end
faces = zeros(12, 3);
k = 1;
for i = 1:5
    faces(k, :) = [1 i+1 i+2];
    k = k + 1;
end
faces(k, :) = [1 7 2];
k = k + 1;
for i = 1:5
    faces(k, :) = [i+1 i+2 i+7];
    k = k + 1;
    faces(k, :) = [i+2 i+7 i+8];
    k = k + 1;
end
faces(k, :) = [7 2 13];
k = k + 1;
faces(k, :) = [2 13 8];
k = k + 1;