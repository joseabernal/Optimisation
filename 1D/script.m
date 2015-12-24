clc;
clear all;
close all;

[z1, ~] = GoldenSearch(f, -2, 0, 2, 0.001)
[z2, ~] = GoldenSearch(f, -1, 0, 1, 0.001)
[z3, ~] = GoldenSearch(f, -1, 0, 1, 0.001)
[z4, ~] = BrentMethod(f, -2, 0, 2, 0.001)
[z5, ~] = BrentMethod(f, -1, 0, 1, 0.001)
[z6, ~] = BrentMethod(f, -0.5, 0.2, 0.5, 0.001)
[z7, ~] = NewtonMethod(f, @dfdx, @d2fdx2, -0.2, 0.001);