clc;
close all;
a = 1;
b = 4;

figure();
hold on
y0 = GenerateEllipse(a, b, 100);
%scatter(y0(:, 1), y0(:, 2), 'k')

y = Rotation(y0, pi/10);
%scatter(y(:, 1), y(:, 2), 'r')

y = Translation(y, 0.5, 0);
%scatter(y(:, 1), y(:, 2), 'b')

y = GenerateNoiseEllipse(a, b, 100, 100);
scatter(y(:, 1), y(:, 2), 'g')

f = Conicity(y);
[xmin, iter] = LevenbergMarquart(f, [1 1 1 1 1 1]', 1.1, 1);

A = xmin(1);
B = xmin(2);
C = xmin(3);
D = xmin(4);
E = xmin(5);
F = xmin(6);
M0 = [F D/2 E/2; D/2 A B/2; E/2 B/2 C];
M = [A B/2; B/2 C];

lambdas = eig(M);
lambda1 = lambdas(1);
lambda2 = lambdas(2);
if abs(lambda1 - A) > abs(lambda1 - C)
    lambdaTemp = lambda1;
    lambda1 = lambda2;
    lambda2 = lambdaTemp;
end
af = sqrt(-det(M0) / (det(M) * lambda1));
bf = sqrt(-det(M0) / (det(M) * lambda2));
hf = (B * E - 2 * C * D) / (4 * A * C - B^2);
kf = (B * D - 2 * A * E) / (4 * A * C - B^2);
thetaf = acot((A - C)/B)/2;

yf = GenerateEllipse(af, bf, 100);
yf = Rotation(yf, thetaf);
yf = Translation(yf, hf, kf);
scatter(yf(:, 1), yf(:, 2), 'b')