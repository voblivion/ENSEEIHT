clear;

% % Truc bizarre
% vertices = [0 0 0; 1 0 1; 2 0 0; 0.5 sin(pi/3) 1; 1.5 sin(pi/3) 1; 1 2*sin(pi/3) 0];
% faces = [1 2 4; 2 3 5; 2 4 5; 4 5 6];

% Machin étrange
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

[v, f] = s3a(vertices, faces, 0);

figure('Name', 'sqrt3');
hold on;
for k = 1:size(f, 1)
    X = [v(f(k, 1), 1) v(f(k, 2), 1) v(f(k, 3), 1) v(f(k, 1), 1)];
    Y = [v(f(k, 1), 2) v(f(k, 2), 2) v(f(k, 3), 2) v(f(k, 1), 2)];
    Z = [v(f(k, 1), 3) v(f(k, 2), 3) v(f(k, 3), 3) v(f(k, 1), 3)];
    plot3(X, Y, Z, 'b');
    plot3(X, Y, Z, 'ro');
    pause(0.001);
end
for k = 1:size(faces, 1)
    X = [vertices(faces(k, 1), 1) vertices(faces(k, 2), 1) vertices(faces(k, 3), 1) vertices(faces(k, 1), 1)];
    Y = [vertices(faces(k, 1), 2) vertices(faces(k, 2), 2) vertices(faces(k, 3), 2) vertices(faces(k, 1), 2)];
    Z = [vertices(faces(k, 1), 3) vertices(faces(k, 2), 3) vertices(faces(k, 3), 3) vertices(faces(k, 1), 3)];
    plot3(X, Y, Z, 'g');
    pause(0.001);
end