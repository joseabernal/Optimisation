clc;
clear;
close all;
%% Minimization of a quadratic form
A = 2*[5 4; 4 5];
b = [34; 38];
c = 74;
f = CuadraticFunction(A, b, c);

t = -20:20;
[X,Y] = meshgrid(t,t);
Z = zeros(length(t), length(t));

for i = -20:20
    for j = -20:20
        Z(i+21, j+21) = f([i; j]);
    end
end

figure()
surf(X, Y, Z)
figure()
hold on
contour(X, Y, Z)
P0 = [10; 10];
DisplayPoint(P0)
%[z, iter] = ArbitraryLineSearch(f, P0);
%[z, iter] = SteepestDescent(f, P0);
%[z, iter] = PowellsMethod(f, P0);
[z, iter] = ConjugateGradient(A, b, P0);

%% Minimization of a non-quadratic form
% Goldstein - Price function
clc;
clear all;
close all;
f = GoldsteinPrice();
t = -2.6:0.5:2.6;
[X, Y] = meshgrid(t);
Z = zeros(size(X, 1), size(X, 2));

for i = 1:size(X, 1)
    for j = 1:size(X, 2)
        Z(i, j) = f([X(i, j); Y(i, j)]);
    end
end
%figure(),
%hold on
[U,V] = gradient(Z, 0.001, 0.001);
%quiver(X,Y,U,V)

figure()
hold on
%surf(X, Y, Z)
t = -3:0.1:3;
[X, Y] = meshgrid(t);
Z = zeros(size(X, 1), size(X, 2));

for i = 1:size(X, 1)
    for j = 1:size(X, 2)
        Z(i, j) = f([X(i, j); Y(i, j)]);
    end
end

contour(X, Y, Z)

P0 = [0; -1.0001];
DisplayPoint(P0)
%[xmin, iter] = ArbitraryLineSearch(f, P0);
%[xmin, iter] = SteepestDescent(f, P0);
[xmin, iter] = QuasiNewtonMethod(f, P0);