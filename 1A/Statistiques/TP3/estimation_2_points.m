function [cos_theta,sin_theta,rho] = estimation_2_points(x_donnees,y_donnees)

x_G = mean(x_donnees);
y_G = mean(y_donnees);
distance = sqrt((x_donnees(2)-x_donnees(1))^2+(y_donnees(2)-y_donnees(1))^2);
cos_theta = (x_donnees(2)-x_donnees(1))/distance;
sin_theta = (y_donnees(2)-y_donnees(1))/distance;
rho = x_G*cos_theta+y_G*sin_theta;