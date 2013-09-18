function [ R ] = compute_rotation_matrix(phi, s)
% Computes the rotation matrix corresponding to angle phi and axis vector s.

x = s(1,1);
y = s(2,1);
z = s(3,1);

cos_phi = cos(phi);
sin_phi = sin(phi);

R = [cos_phi+x^2*(1 - cos_phi), x*y*(1-cos_phi)-z*sin_phi, y*sin_phi+x*z*(1-cos_phi);
    z*sin_phi+x*y*(1-cos_phi), cos_phi+y^2*(1 - cos_phi), -x*sin_phi+y*z*(1-cos_phi);
    -y*sin_phi+x*z*(1-cos_phi), x*sin_phi+y*z*(1-cos_phi), cos_phi+z^2*(1 - cos_phi)];
