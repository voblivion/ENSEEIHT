clear;
close all;
figure('Name', 'Approximation sqrt(3)');

%% Mesh à approximer
% mesh_triangle;
% mesh_double_triangle;
% mesh_trepied;
% mesh_chapiteau;
% mesh_tetraedre;
mesh_dome;

%% Nombre d'itérations
iter = 3;

%% Affichage du mesh à approximer
% (On n'affiche que les arrêtes)
for k = 1:size(faces, 1)
    X = [vertices(faces(k, 1), 1) vertices(faces(k, 2), 1) vertices(faces(k, 3), 1) vertices(faces(k, 1), 1)];
    Y = [vertices(faces(k, 1), 2) vertices(faces(k, 2), 2) vertices(faces(k, 3), 2) vertices(faces(k, 1), 2)];
    Z = [vertices(faces(k, 1), 3) vertices(faces(k, 2), 3) vertices(faces(k, 3), 3) vertices(faces(k, 1), 3)];
    plot3(X, Y, Z, 'g');
    hold on;
end

%% Approximation
[v, f] = s3a(vertices, faces, iter);

%% Affichage de l'approximation
hold on;
trimesh(f, v(:, 1), v(:, 2), v(:, 3));