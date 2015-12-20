function [f2x] = d2fdx2(f, x)
    h = 0.001;
    f2x = (f(x+h) - 2 * f(x) + f(x-h))/(h^2);
end