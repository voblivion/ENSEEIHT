clear;
close all;
figure('Name', 'Approximation sqrt(3)');

%% Mesh à approximer
% mesh_triangle;
% mesh_trepied;
% mesh_chapiteau;
mesh_tetraedre;

%% Nombre d'itérations
iter = 3;

%% Affichage du mesh à approximer
% for k = 1:size(faces, 1)
%     X = [vertices(faces(k, 1), 1) vertices(faces(k, 2), 1) vertices(faces(k, 3), 1) vertices(faces(k, 1), 1)];
%     Y = [vertices(faces(k, 1), 2) vertices(faces(k, 2), 2) vertices(faces(k, 3), 2) vertices(faces(k, 1), 2)];
%     Z = [vertices(faces(k, 1), 3) vertices(faces(k, 2), 3) vertices(faces(k, 3), 3) vertices(faces(k, 1), 3)];
%     plot3(X, Y, Z, 'g');
%     hold on;
% end
trimesh(faces, vertices(:, 1), vertices(:, 2), vertices(:, 3));

%% Approximation
[v, f] = s3a(vertices, faces, iter);

%% Affichage de l'approximation
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
trimesh(f, v(:, 1), v(:, 2), v(:, 3));