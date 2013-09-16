function [h, t] = computeH(s, d)
    % s and d are 2xN matrices, you want to compute a homography which
    % takes the source points to destination points.
    % h is the homography matrix and t is the tform returned from the
    % maketfrom function

    %% Write code to set up a system of equations solving which will give
    % you the homography.

    %% Use maketform to generate a transformation that imtransform will
    % understand.

    A = zeros(8,8);
    b = zeros(8,1);

    % Setup system
    for i = 1:4
        x_s = s(1, i);
        y_s = s(2, i);
        x_d = d(1, i);
        y_d = d(2, i);

        A(1 + (i-1)*2, :) = [x_s, y_s, 1, 0, 0, 0, -x_s*x_d, -y_s*x_d];
        A(2 + (i-1)*2, :) = [0, 0, 0, x_s, y_s, 1, -x_s*y_d, -y_s*y_d];

        b(1 + (i-1)*2, 1) = x_d;
        b(2 + (i-1)*2, 1) = y_d;
    end

    % Solve
    h = A \ b;

    % Construct 3x3 matrix from vector
    h = [h(1), h(2), h(3);
         h(4), h(5), h(6);
         h(7), h(8), 1];

    % Use maketform
    t = maketform('projective', h.');

end
