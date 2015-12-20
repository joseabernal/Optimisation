clc;
clear;
close all;
%% Minimization of a quadratic form
A = [2 -1; -1 1];
b = [0; 0];
c = 0;
f = CuadraticFunction(A, b, c);

t = -10:10;
[X,Y] = meshgrid(t,t);
Z = zeros(length(t), length(t));

for i = -10:10
    for j = -10:10
        Z(i+11, j+11) = f([i; j]);
    end
end

figure()
%surf(X, Y, Z)
%hold on
contour(X, Y, Z)
hold on
P0 = [4.5; 3];
DisplayPoint(P0)
%ArbitraryLineSearch(f, P0);
SteepestDescent(f, P0);
%PowellsMethod(f, P0)
%ConjugateGradient(A, b, P0, 0.001);

%% Minimization of a non-quadratic form
% Goldstein - Price function
clc;
clear;
close all;
f = GoldsteinPrice();
t = -3:0.05:3;
[X, Y] = meshgrid(t);
Z = zeros(size(X, 1), size(X, 2));

for i = 1:size(X, 1)
    for j = 1:size(X, 2)
        Z(i, j) = f([X(i, j); Y(i, j)]);
    end
end

figure()
%surf(X, Y, Z)
hold on
contour(X, Y, Z)

P0 = [0; 0];
DisplayPoint(P0)
%[xmin, iter] = ArbitraryLineSearch(f, P0);
%[xmin, iter] = SteepestDescent(f, P0);
[xmin, iter] = QuasiNewtonMethod(f, P0);