function [ phi, s ] = compute_phi_axis(R)
% Computes angle phi and axis vector s corresponding to R.


[v, d] = eig(R);

%[i, j] = find(d > 0);
%[k, h] = find(imag(d) == 0);
%[i, j] = intersect([i j], [k, h], 'rows');

if isreal(d(:, 1))
    j = 1;
elseif isreal(d(:, 2))
    j = 2;
elseif isreal(d(:, 3))
    j = 3;
end

s = v(:, j);

%x = s(1,1);
%y = s(2,1);
%z = s(3,1);

%R = R - R.';
%if abs(z) > 1e-14
%    disp(-R(1,2) / (2 * z));
%    phi = asin(-R(1,2) / (2 * z));
%elseif abs(y) > 1e-14
%    disp(R(1,3) / (2 * y));
%    phi = asin(R(1,3) / (2 * y));
%elseif abs(x) > 1e-14
%    disp(-R(2,3) / (2 * x));
%    phi = asin(-R(2,3) / (2 * x));
%end

phi = acos(0.5 * (trace(R) - 1));
