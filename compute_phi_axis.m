function [ phi, s ] = compute_phi_axis(R)
% Computes angle phi and axis vector s corresponding to R.


[v, d] = eig(R);

[i, j] = find(d == 1);
s = v(:, j);

x = s(1,1);
y = s(2,1);
z = s(3,1);

R = R - R.';
if abs(z) > 1e-14
    phi = asin(-R(1,2) / (2 * z));
elseif abs(y) > 1e-14
    disp(R(1,3) / (2 * y));
    phi = asin(R(1,3) / (2 * y));
elseif abs(x) > 1e-14
    phi = asin(-R(2,3) / (2 * x));
end

