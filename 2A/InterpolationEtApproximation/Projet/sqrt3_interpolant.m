clear;
close all;
figure('Name', 'Interpolation sqrt(3)');

%% Mesh à interpoler
% mesh_triangle;
% mesh_double_triangle;
% mesh_trepied;
 mesh_chapiteau;
% mesh_tetraedre;
% mesh_dome;

%% Nombre d'itérations
iter = 3;

%% Affichage du mesh à interpoler
for k = 1:size(faces, 1)
    X = [vertices(faces(k, 1), 1) vertices(faces(k, 2), 1) vertices(faces(k, 3), 1) vertices(faces(k, 1), 1)];
    Y = [vertices(faces(k, 1), 2) vertices(faces(k, 2), 2) vertices(faces(k, 3), 2) vertices(faces(k, 1), 2)];
    Z = [vertices(faces(k, 1), 3) vertices(faces(k, 2), 3) vertices(faces(k, 3), 3) vertices(faces(k, 1), 3)];
    plot3(X, Y, Z, 'g');
    hold on;
end
% trimesh(faces, vertices(:, 1), vertices(:, 2), vertices(:, 3));

%% Interpolation
[v, f] = s3i(vertices, faces, iter);

%% Affichage de l'interpolation
% for k = 1:size(f, 1)
%     X = [v(f(k, 1), 1) v(f(k, 2), 1) v(f(k, 3), 1) v(f(k, 1), 1)];
%     Y = [v(f(k, 1), 2) v(f(k, 2), 2) v(f(k, 3), 2) v(f(k, 1), 2)];
%     Z = [v(f(k, 1), 3) v(f(k, 2), 3) v(f(k, 3), 3) v(f(k, 1), 3)];
%     plot3(X, Y, Z, 'b');
%     hold on;
%     plot3(X, Y, Z, 'ro');
%     hold on;
%     pause(0.01);
% end
% pause
t = trimesh(f, v(:, 1), v(:, 2), v(:, 3));
