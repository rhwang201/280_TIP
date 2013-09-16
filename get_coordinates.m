% Transforms 2d image coordinates into 3d coordinates.
function [vertices] = ...
    get_coordinates(f, w, h, vx, vy, ceilrx, ceilry, floorrx, floorry,...
        leftrx, leftry, rightrx, rightry, backrx, backry)

% For ratios between back wall and front wall.
l_back = vx - backrx(1);
r_back = backrx(2) - vx;
t_back = vy - backry(1);
b_back = backry(3) - vy;

w_back = backrx(2) - backrx(1);
h_back = backry(3) - backry(2);

depth = f * (vy/(vy - backry(1)) - 1);

% (x,y,z) by 4 vertices(top-left clockwise) by front-or-back wall
vertices = zeros(3, 4, 2);

vertices(:, 1, 1) = [-l_back * w / w_back, t_back * h / h_back, f];
vertices(:, 2, 1) = [r_back * w / w_back, t_back * h / h_back, f];
vertices(:, 3, 1) = [r_back * w / w_back, -b_back * h / h_back, f];
vertices(:, 4, 1) = [-l_back * w / w_back, -b_back * h / h_back, f];

z_back = f + depth;
vertices(:, 1, 2) = [-l_back * w / w_back, t_back * h / h_back, z_back];
vertices(:, 2, 2) = [r_back * w / w_back, t_back * h / h_back, z_back];
vertices(:, 3, 2) = [r_back * w / w_back, -b_back * h / h_back, z_back];
vertices(:, 4, 2) = [-l_back * w / w_back, -b_back * h / h_back, z_back];
