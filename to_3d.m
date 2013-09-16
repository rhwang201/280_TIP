% Creates 3d model using homographies
function [] = to_3d(im, f)

[h, v, p, d, bim] = get_5homographies(im, f); 

figure(2);

% Ceiling
J_ceil = imtransform(bim, h{1,2}, 'xData', [d(1,1,1) d(1,3,1)],...
                     'yData', [d(2,1,1) d(2,3,1)]);
ceil_x = [v(1,1,1) (v(1,2,1)+v(1,1,1))/2 v(1,2,1);
          v(1,1,2) (v(1,2,2)+v(1,1,2))/2 v(1,2,2)];
ceil_y = [v(2,1,1) v(2,1,1) v(2,2,1);
          v(2,1,2) v(2,1,2) v(2,2,2)];
ceil_z = [v(3,1,1) v(3,1,1) v(3,2,1);
          v(3,1,2) v(3,1,2) v(3,2,2)];
warp(ceil_x,ceil_y,ceil_z,J_ceil);

hold on;

% Floor
J_floor = imtransform(bim, h{2,2}, 'xData', [d(1,1,2) d(1,3,2)],...
                      'yData', [d(2,1,2) d(2,3,2)]);
floor_x = [v(1,4,2) (v(1,3,2) + v(1,4,2))/2 v(1,3,2);
           v(1,4,1) (v(1,3,1) + v(1,4,1))/2 v(1,3,1)];
floor_y = [v(2,4,2) v(2,4,2) v(2,3,2);
           v(2,4,1) v(2,4,1) v(2,3,1)];
floor_z = [v(3,4,2) v(3,4,2) v(3,3,2);
           v(3,4,1) v(3,4,1) v(3,3,1)];
warp(floor_x,floor_y,floor_z,J_floor);

% Left
J_left = imtransform(bim, h{3,2}, 'xData', [d(1,1,3) d(1,3,3)],...
                     'yData', [d(2,1,3) d(2,3,3)]);
left_x = [v(1,1,1) v(1,1,1) v(1,1,2);
           v(1,4,1) v(1,4,1) v(1,4,2)];
left_y = [v(2,1,1) v(2,1,1) v(2,1,2);
           v(2,4,1) v(2,4,1) v(2,4,2)];
left_z = [v(3,1,1) (v(3,1,2) + v(3,1,1))/2 v(3,1,2);
           v(3,4,1) (v(3,4,2) + v(3,4,1))/2 v(3,4,2)];
warp(left_x,left_y,left_z,J_left);

% Right
J_right = imtransform(bim, h{4,2}, 'xData', [d(1,1,4) d(1,3,4)],...
                      'yData', [d(2,1,4) d(2,3,4)]);
right_x = [v(1,2,2) v(1,2,2) v(1,2,1);
           v(1,3,2) v(1,3,2) v(1,3,1)];
right_y = [v(2,2,2) v(2,2,2) v(2,2,1);
           v(2,3,2) v(2,3,2) v(2,3,1)];
right_z = [v(3,2,2) (v(3,2,2) + v(3,2,1))/2 v(3,2,1);
           v(3,3,2) (v(3,3,2) + v(3,3,1))/2 v(3,3,1)];
warp(right_x,right_y,right_z,J_right);

% Back
J_back = imtransform(bim, h{5,2}, 'xData', [d(1,1,5) d(1,3,5)],...
                     'yData', [d(2,1,5) d(2,3,5)]);
back_x = [v(1,1,2) (v(1,2,2) + v(1,1,2))/2 v(1,2,2);
          v(1,4,2) (v(1,3,2) + v(1,4,2))/2 v(1,3,2)];
back_y = [v(2,1,2) v(2,1,2) v(2,2,2);
          v(2,4,2) v(2,4,2) v(2,3,2)];
back_z = [v(3,1,2) v(3,1,2) v(3,2,2);
          v(3,4,2) v(3,4,2) v(3,3,2)];
warp(back_x,back_y,back_z,J_back);

hold off;

axis equal;  % make X,Y,Z dimentions be equal
axis vis3d;  % freeze the scale for better rotations
axis off;    % turn off the stupid tick marks
camproj('perspective');  % make it a perspective projection
