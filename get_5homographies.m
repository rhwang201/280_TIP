%% Computes homographies for each of the 5 surfaces.
function [homographies, vertices, planes, ds, big_im] = ...
        get_5homographies(im, f)

    % Get vanishing point, back wall dimensions, and image dimensions.
    [vx,vy,irx,iry,orx,ory] = TIP_GUI(im);
    
    % Get 2d coordinates of rectangle vertices.
    [big_im,big_im_alpha,vx,vy,ceilrx,ceilry,floorrx,floorry,...
        leftrx,leftry,rightrx,rightry,backrx,backry] = ...                           
        TIP_get5rects(im,vx,vy,irx,iry,orx,ory);

    [h, w, ~] = size(im);

   
    planes = [ceilrx; ceilry; floorrx; floorry; leftrx; leftry;
              rightrx; rightry; backrx(1:4); backry(1:4)];

    % Used for destination points.
    [vertices] = get_coordinates(f, w, h, vx, vy, ceilrx, ceilry,...
            floorrx, floorry, leftrx, leftry, rightrx, rightry, backrx, backry);
     plane_dimensions = compute_dimensions(vertices);

    homographies = cell(5,2);
    ds = zeros(2, 4, 5);
    
    % Compute homographies for each plane.
    for i = 1:5
        rx = planes(1 + (i-1)*2, 1:4);
        ry = planes(2 + (i-1)*2, 1:4);
        s = [rx; ry];

        % Compute d
        dim = plane_dimensions(i, :);
        d = [0 dim(1) dim(1) 0;
             0 0 dim(2) dim(2)];
        ds(:, :, i) = d;

        [h, t] = computeH(s, d);
        homographies{i,1} = h;
        homographies{i,2} = t;

    end

end
