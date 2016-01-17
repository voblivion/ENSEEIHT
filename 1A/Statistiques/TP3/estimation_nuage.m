function [cos_theta,sin_theta,rho] = estimation_nuage(x_donnees,y_donnees)

x_G = mean(x_donnees);
y_G = mean(y_donnees);
x_donnees_centrees = x_donnees-x_G;
y_donnees_centrees = y_donnees-y_G;
if size(x_donnees_centrees,2)>size(x_donnees_centrees,1)
	x_donnees_centrees = transpose(x_donnees_centrees);
	y_donnees_centrees = transpose(y_donnees_centrees);
end
C = [x_donnees_centrees y_donnees_centrees];
M = transpose(C)*C;
[V,D] = eig(M);
[valeurs_triees,indices_tries] = sort(diag(D),'ascend');
cos_theta = V(1,indices_tries(1));
sin_theta = V(2,indices_tries(1));
rho = x_G*cos_theta+y_G*sin_theta;
