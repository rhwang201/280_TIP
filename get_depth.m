% Returns ratio of height/length and depth
function [depth] = get_depth(im, f);

[vx,vy,irx,iry,orx,ory] = TIP_GUI(im);

depth = f * ((ory(3) - vy)/(iry(3) - vy) - 1);
