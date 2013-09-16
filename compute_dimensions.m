% Given vertices of planes, return plane width/height ratios
function [dimensions] = compute_dimensions(vertices)

dimensions = zeros(1, 5);

% Ceil
ceil_width = norm(vertices(:, 2, 1) - vertices(:, 1, 1));
ceil_depth = norm(vertices(:, 1, 2) - vertices(:, 1, 1));

% Floor
floor_width = norm(vertices(:, 4, 1) - vertices(:, 3, 1));
floor_depth = norm(vertices(:, 3, 2) - vertices(:, 3, 1));

% Left
left_width = norm(vertices(:, 1, 1) - vertices(:, 1, 2));
left_height = norm(vertices(:, 4, 1) - vertices(:, 1, 1));

% Right
right_width = norm(vertices(:, 2, 1) - vertices(:, 2, 2));
right_height = norm(vertices(:, 2, 1) - vertices(:, 3, 1));

% Back
back_width = norm(vertices(:, 2, 2) - vertices(:, 1, 2));
back_height = norm(vertices(:, 1, 2) - vertices(:, 4, 1));

dimensions = [ceil_width ceil_depth;
              floor_width floor_depth;
              left_width left_height;
              right_width right_height;
              back_width back_height];
